
execute pathogen#infect()
syntax on

"let base16colorspace=256  " Access colors present in 256 colorspace
"let g:solarized_termcolors=256

"Sets how many lines of history VIM has to remember
set history=500

"Enable filetype plugins
filetype plugin on
filetype indent on


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

nmap ; :
imap jj <ESC>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7


"Turn on WiLd menu
set wildmenu
set wildmode=longest,full
set wildignore=*.bak,*.o,*.obj,*.e,*~,*.pyc,*.svn,*.png,*.jpg,*logDir*


"Always show current position
set ruler

" Show Linenumber
set nu

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

set mouse=a

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" show incomplete commands
set showcmd

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on
set t_Co=256  "256 color schemes
"colorscheme solarized
"colorscheme flatland
"colorscheme dracula
colorscheme onedark
"set background=dark

"set background=light
" Toggle Backgroundcolor
"call togglebg#map("<F5>")

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    "set background=light
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Monaco:h16
    set guifontwide=Monaco:h16
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" fileencodings
let &termencoding=&encoding
set fileencodings=utf-8,gbk


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=80

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
" Different from arrow keys
map j gj
map k gk

map <silent><leader>/ :nohl<cr>
map <silent><leader>t :CtrlP<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map Spacebar to page down
map <Space> <PageDown>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


set sessionoptions=buffers,sesdir,help,tabpages,winsize
let $VIMSESSION = '~/.vim/session.vim'
au VimLeave * mks! $VIMSESSION
nmap <F6> :so $VIMSESSION<CR>

" yank to the system register (*) by default
set clipboard=unnamed

" Windows issues
vmap <leader>c "+y
vmap <leader>x "+x
map <leader>v "+gP

set pastetoggle=<F2>
nmap <leader>w :w<CR>

"Format the statusline
set statusline=%F%m%r%h%w\ [%Y,%{&ff},%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]

vnoremap < <gv
vnoremap > >gv



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => For Coding Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change file type
map <leader>f1 :set filetype=html<cr>
map <leader>f2 :set filetype=js<cr>
map <leader>f3 :set filetype=css<cr>

"
map <leader>l <Plug>TaskList
let g:tlWindowPosition = 1
let g:tlTokenList = ['TODO', 'debug']


" ACK
map <leader>a :Ack
" NerdTree
map <leader>d :NERDTreeToggle<cr>

"plugin config
let g:jsx_ext_required = 0

" autocomplete
" tag, filename, whole name
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-L> <C-X><C-L>

"noremap <silent> <Left> :bp<CR>
"noremap <silent> <Right> :bn<CR>

"nnoremap \ :!open <C-R>%<CR><CR>


"整行补全                        CTRL-X CTRL-L
"根据字典补全                    CTRL-X CTRL-K
"根据标签补全                    CTRL-X CTRL-]
"补全文件名                      CTRL-X CTRL-F

"echo $VIMRUNTIME

" 搜索替换 alias
" nmap S :%s///g<LEFT><LEFT><LEFT>
"

" http://linux-wiki.cn/wiki/zh-hans/Vim%E4%BB%A3%E7%A0%81%E7%BC%A9%E8%BF%9B%E8%AE%BE%E7%BD%AE
"

let g:jsx_ext_required = 0

"ack config
let g:ackprg = 'ag --vimgrep'

"nerdtree config
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTress File highlighting

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')

" ctrlp config
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
"let g:ctrlp_max_files=10000
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore node_modules
      \ --ignore target
      \ --ignore .DS_Store
      \ --ignore "**/*.class"
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_working_path_mode = 0
