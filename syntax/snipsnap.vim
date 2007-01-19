"----------------------------------------------------------------------------
"  Description: Snip Snap syntax file
"     Language: Snip Snap Wiki
"          $Id: snipsnap.vim,v 1.1 2006/11/22 14:13:23 krischikm Exp $
"    Copyright: Copyright (C) 2006 Martin Krischik
"   Maintainer: Martin Krischik
"      $Author: krischikm $
"        $Date: 2006/11/22 14:13:23 $
"      Version: 4.2
"    $Revision: 1.1 $
"     $HeadURL: https://svn.sourceforge.net/svnroot/gnuada/trunk/tools/vim/syntax/ada.vim $
"               http://www.dwheeler.com/vim
"      History: 20.11.2006 MK SnipSnap Wiki Syntax
"    Help Page: help ft-snipsnap-syntax
"------------------------------------------------------------------------------

if exists("b:current_syntax") || version < 700
    finish
endif

let b:current_syntax = "snipsnap"

" Section: SnipSnap is case-sensitive. {{{1
"
syntax case match

" Section: Simple Format {{{1
"
syntax region  SnipSnapBold   start=/__/    end=/__/    oneline
syntax region  SnipSnapItalic start=/\~\~/  end=/\~\~/  oneline
syntax region  SnipSnapStrike start=/--/    end=/--/    oneline

" Section: Header Format {{{1

syntax match   SnipSnapHeader1 /^1\s.\{1,}$/            contains=SnipSnapExtLink,SnipSnapIntLink
syntax match   SnipSnapHeader2 /^1.1\s.\{1,}$/          contains=SnipSnapExtLink,SnipSnapIntLink
syntax match   SnipSnapHeader3 /^1.1.1\s.\{1,}$/        contains=SnipSnapExtLink,SnipSnapIntLink
syntax match   SnipSnapHeader4 /^1.1.1.1\s.\{1,}$/      contains=SnipSnapExtLink,SnipSnapIntLink
syntax match   SnipSnapHeader5 /^1.1.1.1.1\s.\{1,}$/    contains=SnipSnapExtLink,SnipSnapIntLink

" Section: List Format {{{1

syntax match   SnipSnapDashList /^-\s.\{1,}$/
syntax match   SnipSnapDotList  /^\*\s.\{1,}$/
syntax match   SnipSnapNList    /^1\.\s.\{1,}$/
syntax match   SnipSnapLAList   /^a\.\s.\{1,}$/
syntax match   SnipSnapUAList   /^A\.-\s.\{1,}$/
syntax match   SnipSnapLAList   /^i\.\s.\{1,}$/
syntax match   SnipSnapUAList   /^I\.-\s.\{1,}$/

" Section: Link Format {{{1

syntax region SnipSnapExtLink start=/{link:/ end=/\(|none\)\{0,1}}/  oneline contains=@NoSpell
syntax region SnipSnapIntLink start=/\[/     end=/]/                 oneline contains=@NoSpell

" Section: Code Format {{{1

syntax region  SnipSnapCode start=/^{code\(:\a\{1,}\)\{0,1}}/ end=/^{code}/  contains=@NoSpell fold
syntax region  SnipSnapHtml start=/{html}/                    end=/{html}/   contains=@NoSpell fold

" Section: Table1 Format {{{1

syntax region  SnipSnapTable
    \   start=/{table}/
    \   end=/{table}/
    \   contains=SnipSnapTableColumn,SnipSnapExtLink,SnipSnapIntLink
    \   fold

syntax match SnipSnapTableColumn /|/ contained

" Section: Comments. {{{1
"
syntax region  SnipSnapComment start="{html}<!--" end="-->{html}" contains=@NoSpell fold

" Section: The default methods for highlighting. Can be overridden later. {{{1
"
highlight def link SnipSnapBold         Bold
highlight def link SnipSnapCode         Code
highlight def link SnipSnapComment      Comment
highlight def link SnipSnapDashList     UList
highlight def link SnipSnapDotList      UList
highlight def link SnipSnapExtLink      Link
highlight def link SnipSnapHeader1      Header1
highlight def link SnipSnapHeader2      Header2
highlight def link SnipSnapHeader3      Header3
highlight def link SnipSnapHeader4      Header4
highlight def link SnipSnapHeader5      Header5
highlight def link SnipSnapHtml         Html
highlight def link SnipSnapIntLink      Link
highlight def link SnipSnapItalic       Italic
highlight def link SnipSnapLAList       OList
highlight def link SnipSnapLRList       OList
highlight def link SnipSnapNList        OList
highlight def link SnipSnapStrike       Strike
highlight def link SnipSnapTable        Table
highlight def link SnipSnapTableColumn  TableColumn
highlight def link SnipSnapUAList       OList
highlight def link SnipSnapURList       OList
:
" Section: formatoptions {{{1
"
setlocal formatoptions+=ron

" Section: sync {{{1
"
" for {code} and {html} blocks we need to look backwards
syntax sync minlines=100 maxlines=200

finish " 1}}}

"------------------------------------------------------------------------------
"   Copyright (C) 2006  Martin Krischik
"
"   Vim is Charityware - see ":help license" or uganda.txt for licence details.
"------------------------------------------------------------------------------
"vim: textwidth=78 nowrap tabstop=8 shiftwidth=3 softtabstop=3 noexpandtab
"vim: foldmethod=marker
