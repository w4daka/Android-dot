return {
  'Shougo/ddc.vim',
  dependencies = {
    'Shougo/ddc-source-around',
    'Shougo/ddc-filter-matcher_head',
    'Shougo/ddc-filter-sorter_rank',
    'Shougo/ddc-ui-pum',
    'Shougo/ddc-source-lsp',
    'Shougo/pum.vim',
    'vim-denops/denops.vim',
    'tani/ddc-fuzzy',
  },
  config = function()
    -- 	-- " Customize global settings
    --
    vim.fn['ddc#custom#patch_global']('ui', 'pum')
    --
    -- 	-- " Use around source.
    -- " https://github.com/Shougo/ddc-source-around
    vim.fn['ddc#custom#patch_global'](
      'sources',
      { 'skkeleton', 'skkeleton_okuri', 'lsp', 'around' }
    )
    vim.fn['ddc#custom#patch_global']('sourceOptions', {
      _ = {
        matchers = { 'matcher_head' },
        sorters = { 'sorter_rank' },
      },
      skkeleton = {
        mark = 'SKK',
        matchers = {},
        sorters = {},
        converters = {},
        isVolatile = true,
        minAutoCompleteLength = 1,
      },
      skkeleton_okuri = {
        mark = 'SKK*',
        matchers = {},
        sorters = {},
        converters = {},
        isVolatile = true,
      },
    })
    --
    -- 	-- " Change source options
    vim.fn['ddc#custom#patch_global']('sourceOptions', {
      around = { mark = 'A' },
    })
    vim.fn['ddc#custom#patch_global']('sourceParams', {
      around = { maxSize = 500 },
    })

    vim.fn['ddc#custom#patch_global']('sourceOptions', {
      lsp = {
        isVolatile = true,
        mark = 'LSP',
        forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
      },
    })
    vim.keymap.set('i', '<C-n>', '<Cmd>call pum#map#insert_relative(+1)<CR>')
    vim.keymap.set('i', '<C-p>', '<Cmd>call pum#map#insert_relative(-1)<CR>')
    vim.keymap.set('i', '<C-y>', '<Cmd>call pum#map#confirm()<CR>')
    vim.keymap.set('i', '<C-e>', '<Cmd>call pum#map#cancel()<CR>')
    vim.fn['ddc#enable']()
  end,
}
