; DESCRIPTION: Geometry OS program to draw a colored object.

; nano_editor.asm -- Nano-like Text Editor for Geometry OS
; Phase 139 -- Daily Driver Text Editor App
;
; Opens a host file, displays with scrolling, edits with cursor keys,
; and saves via FSWRITE. Search and goto for navigation.
;
; Controls:
;   Arrow keys (bitmask 0xFFB)  -- Move cursor
;   Printable ASCII (32-126)    -- Insert character
;   Enter (10)                  -- Insert newline
;   Backspace (8)               -- Delete char before cursor
;   Ctrl+O (15)                 -- Save file
;   Ctrl+S (19)                 -- Incremental search
;   Ctrl+R (18)                 -- Search and replace
;   Ctrl+Q (17)                 -- Quit editor
;   Ctrl+F (6)                  -- Find next match
;   Ctrl+G (7)                  -- Goto line number
;   Escape (27)                 -- Cancel prompt/clear match
;
; Screen: 256x256, DRAWTEXT 8x8 font
;   Title bar: y=0..11 (filename, status)
;   Content:   y=14..235 (28 lines at 8px each)
;   Hint bar:  y=240..255 (key hints)
;
; RAM Layout:
;   0x5000-0x51FF  Line starts table (offsets, max 512 lines)
;   0x5400-0x73FF  File content buffer (8192 chars)
;   0x7400         Line count (u32)
;   0x7401         Modified flag (0=clean, 1=dirty)
;   0x7402         Cursor line (u32)
;   0x7403         Cursor col (u32)
;   0x7404         Scroll offset (first visible line)
;   0x7405         File handle
;   0x7406         Buffer size (chars in buffer)
;   0x7420-0x744F  Filename (null-terminated, max 48 chars)
;   0x7460-0x748A  Scratch buffer (43 cells for one line + null)
;   0x7490-0x74BF  Search string buffer (48 chars)
;   0x74C0         Prompt mode (0=none, 1=search, 2=goto, 3=inc_search, 4=replace)
;   0x74C1         Search string length
;   0x74C2         Search match line (-1 if none)
;   0x74C3         Search match col
;   0x74C4         Goto number accumulator
;   0x74C5-0x74F4  Replace string buffer (48 chars)
;   0x74F5         Replace string length
;   0x74F6         Replace sub-mode (0=search_input, 1=replace_input, 2=confirm)
;   0x74F7         Replace match count (for "replace all")

; === Constants ===
#define COLS     42
#define VIS      28
#define LH       8

; Colors (packed RGB)
#define C_BG     0x0D0D0D
#define C_BAR    0x1A1A2E
#define C_FG     0xDDDDDD
#define C_TITLE  0x8888CC
#define C_GREEN  0x44DD44
#define C_AMBER  0xFFAA00
#define C_HINT   0x555577
#define C_CURLN  0x151520
#define C_SEL    0x335577
#define C_MATCH  0x664400
#define C_PROMPT 0x333355
#define C_REPL   0x553333    ; replace highlight color

; RAM addresses
#define LS       0x5000
#define FB       0x5400
#define FB_MAX   8192

#define R_NL     0x7400
#define R_DIRTY  0x7401
#define R_CL     0x7402
#define R_CC     0x7403
#define R_SC     0x7404
#define R_FH     0x7405
#define R_BS     0x7406
#define R_FN     0x7420
#define R_SCR    0x7460
#define R_SEARCH 0x7490
#define R_PM     0x74C0
#define R_SLEN   0x74C1
#define R_SML    0x74C2
#define R_SMC    0x74C3
#define R_GNUM   0x74C4
#define R_REPL   0x74C5      ; replace string buffer
#define R_RLEN   0x74F5      ; replace string length
#define R_RSM    0x74F6      ; replace sub-mode (0=search, 1=replace, 2=confirm)
#define R_RCNT   0x74F7      ; replace match count

; Multi-buffer state
#define R_BACT   0xB500    ; active buffer index (0 or 1)
#define R_BCNT   0xB501    ; buffer count (1 or 2)
#define R_B0FN   0xB510    ; buffer 0 filename (48 chars)
#define R_B1FN   0xB540    ; buffer 1 filename (48 chars)
#define R_B0CL   0xB570    ; buffer 0 saved cursor_line
#define R_B0CC   0xB571    ; buffer 0 saved cursor_col
#define R_B0SC   0xB572    ; buffer 0 saved scroll_offset
#define R_B1CL   0xB580    ; buffer 1 saved cursor_line
#define R_B1CC   0xB581    ; buffer 1 saved cursor_col
#define R_B1SC   0xB582    ; buffer 1 saved scroll_offset

; =========================================
; INIT
; =========================================
    LDI r30, 0xFE00
    LDI r10, 1

    ; Clear metadata
    LDI r8, R_NL
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_DIRTY
    STORE r8, r7
    LDI r8, R_CL
    STORE r8, r7
    LDI r8, R_CC
    STORE r8, r7
    LDI r8, R_SC
    STORE r8, r7
    LDI r8, R_BS
    STORE r8, r7

    ; Set filename
    LDI r8, R_FN
    STRO r8, "~/.geos_notes.txt"

    ; Init prompt state
    LDI r8, R_PM
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_SLEN
    STORE r8, r7
    LDI r8, R_SML
    LDI r7, 0xFFFFFFFF
    STORE r8, r7
    LDI r8, R_SMC
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_GNUM
    STORE r8, r7

    ; Init multi-buffer state
    LDI r8, R_BACT
    LDI r7, 0
    STORE r8, r7              ; active_buf = 0
    LDI r8, R_BCNT
    LDI r7, 1
    STORE r8, r7              ; buf_count = 1

    ; Copy default filename to buffer 0 slot
    LDI r15, R_B0FN
    LDI r16, R_FN
ib_copy_fn:
    LOAD r17, r16
    STORE r15, r17
    LDI r17, 0
    CMP r17, r16
    ; Check if we just copied a null
    LOAD r17, r16
    LDI r18, 0
    CMP r17, r18
    JZ r5, ib_fn_done
    LDI r17, 1
    ADD r15, r17
    ADD r16, r17
    JMP ib_copy_fn
ib_fn_done:

    ; Try to load file
    CALL load_file

    ; Build line table
    CALL build_lines

    ; If line_count == 0, ensure at least 1 line
    LDI r8, R_NL
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, main_loop

    ; Force 1 empty line
    LDI r8, R_NL
    LDI r7, 1
    STORE r8, r7
    LDI r8, LS
    LDI r7, 0
    STORE r8, r7

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    ; Clear screen
    LDI r0, C_BG
    FILL r0

    ; Read keyboard
    IKEY r1
    LDI r9, 0xFFB
    LOAD r9, r9

    ; Handle input
    CALL handle_input

    ; Render
    CALL render_title
    CALL render_content
    CALL render_cursor
    CALL render_hints

    FRAME
    JMP main_loop

; =========================================
; LOAD FILE -- open and read into buffer
; =========================================
load_file:
    PUSH r31

    ; FSOPEN path, mode=0 (read)
    LDI r8, R_FN
    LDI r7, 0
    FSOPEN r8, r7

    ; Check error (r5 >= 0x80000000)
    LDI r8, 0x80000000
    CMP r5, r8
    BGE r5, lf_done

    ; Save handle
    MOV r20, r5

    ; FSREAD handle, FB, 8192
    LDI r7, FB
    LDI r4, FB_MAX
    FSREAD r20, r7, r4
    MOV r21, r5

    ; FSCLOSE
    FSCLOSE r20

    ; Check read result
    LDI r8, 0x80000000
    CMP r21, r8
    BGE r5, lf_done

    ; Save buffer size
    LDI r8, R_BS
    STORE r8, r21

lf_done:
    POP r31
    RET

; =========================================
; SAVE FILE -- write buffer to host file
; =========================================
save_file:
    PUSH r31

    ; FSOPEN path, mode=1 (write/create)
    LDI r8, R_FN
    LDI r7, 1
    FSOPEN r8, r7

    LDI r8, 0x80000000
    CMP r5, r8
    BGE r5, sf_done

    MOV r20, r5

    ; FSWRITE handle, FB, buf_size
    LDI r7, FB
    LDI r4, R_BS
    LOAD r4, r4
    FSWRITE r20, r7, r4

    ; FSCLOSE
    FSCLOSE r20

    ; Clear dirty flag
    LDI r8, R_DIRTY
    LDI r7, 0
    STORE r8, r7

sf_done:
    POP r31
    RET

; =========================================
; BUILD LINES -- scan buffer for newlines
; line_starts[0] = 0, line_starts[N] = offset after Nth newline
; =========================================
build_lines:
    PUSH r31
    PUSH r10
    LDI r10, 1

    ; line_starts[0] = 0
    LDI r8, LS
    LDI r7, 0
    STORE r8, r7

    ; line_count = 1
    LDI r8, R_NL
    LDI r7, 1
    STORE r8, r7

    ; buf_size
    LDI r8, R_BS
    LOAD r8, r8

    ; If buf_size == 0, done
    LDI r7, 0
    CMP r8, r7
    JZ r5, bl_done

    ; Scan with offset counter
    LDI r4, 0

bl_scan:
    CMP r4, r8
    BGE r5, bl_done

    ; Load byte at FB + offset
    LDI r6, FB
    ADD r6, r4
    LOAD r6, r6
    LDI r12, 10
    CMP r6, r12
    JNZ r5, bl_next

    ; Found newline -- next line starts at offset + 1
    LDI r12, LS
    LDI r15, R_NL
    LOAD r15, r15
    ADD r12, r15
    LDI r16, 1
    ADD r16, r4
    STORE r12, r16

    ; line_count++
    ADD r15, r10
    LDI r12, R_NL
    STORE r12, r15

bl_next:
    ADD r4, r10
    JMP bl_scan

bl_done:
    POP r10
    POP r31
    RET

; =========================================
; HANDLE INPUT
; r1 = IKEY key, r9 = arrow bitmask
; =========================================
handle_input:
    PUSH r31
    PUSH r1
    PUSH r9

    ; Check if in prompt mode
    LDI r8, R_PM
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, hi_prompt

    ; Check arrow bitmask first
    MOV r8, r9

    ; bit 0 = up
    LDI r7, 1
    MOV r4, r8
    AND r4, r7
    JNZ r4, hi_up

    ; bit 1 = down
    LDI r7, 2
    MOV r4, r8
    AND r4, r7
    JNZ r4, hi_down

    ; bit 2 = left
    LDI r7, 4
    MOV r4, r8
    AND r4, r7
    JNZ r4, hi_left

    ; bit 3 = right
    LDI r7, 8
    MOV r4, r8
    AND r4, r7
    JNZ r4, hi_right

    ; Check IKEY key
    MOV r7, r1
    LDI r4, 0
    CMP r7, r4
    JZ r5, hi_done

    ; Ctrl+Q (17)?
    LDI r4, 17
    CMP r7, r4
    JZ r5, hi_quit

    ; Ctrl+O (15)? -- Save file
    LDI r4, 15
    CMP r7, r4
    JZ r5, hi_save

    ; Ctrl+R (18)? -- Replace
    LDI r4, 18
    CMP r7, r4
    JZ r5, hi_replace

    ; Ctrl+S (19)? -- Incremental search
    LDI r4, 19
    CMP r7, r4
    JZ r5, hi_incsearch

    ; Ctrl+F (6)? -- Find next match
    LDI r4, 6
    CMP r7, r4
    JZ r5, hi_search

    ; Ctrl+G (7)?
    LDI r4, 7
    CMP r7, r4
    JZ r5, hi_goto

    ; Ctrl+B (2)? -- switch buffer
    LDI r4, 2
    CMP r7, r4
    JZ r5, hi_buf_switch

    ; Ctrl+N (14)? -- new buffer
    LDI r4, 14
    CMP r7, r4
    JZ r5, hi_buf_new

    ; Escape (27) -- clear search match
    LDI r4, 27
    CMP r7, r4
    JZ r5, hi_clear_match

    ; Backspace (8)?
    LDI r4, 8
    CMP r7, r4
    JZ r5, hi_bksp

    ; Enter (10)?
    LDI r4, 10
    CMP r7, r4
    JZ r5, hi_enter

    ; Printable (32-126)?
    LDI r4, 32
    CMP r7, r4
    BLT r5, hi_done
    LDI r4, 127
    CMP r7, r4
    BGE r5, hi_done

    ; Insert printable char
    CALL insert_char
    JMP hi_done

hi_up:
    CALL cursor_up
    JMP hi_done
hi_down:
    CALL cursor_down
    JMP hi_done
hi_left:
    CALL cursor_left
    JMP hi_done
hi_right:
    CALL cursor_right
    JMP hi_done
hi_quit:
    HALT
hi_save:
    CALL save_file
    JMP hi_done
hi_bksp:
    CALL do_backspace
    JMP hi_done
hi_enter:
    CALL insert_newline
    JMP hi_done
hi_search:
    CALL enter_search
    JMP hi_done
hi_incsearch:
    CALL enter_incsearch
    JMP hi_done
hi_replace:
    CALL enter_replace
    JMP hi_done
hi_goto:
    CALL enter_goto
    JMP hi_done
hi_buf_switch:
    CALL switch_buf
    JMP hi_done
hi_buf_new:
    CALL new_buf
    JMP hi_done
hi_clear_match:
    LDI r8, R_SML
    LDI r7, 0xFFFFFFFF
    STORE r8, r7
    JMP hi_done

; =========================================
; PROMPT MODE HANDLER
; =========================================
hi_prompt:
    MOV r7, r1
    LDI r4, 0
    CMP r7, r4
    JZ r5, hi_done

    ; Escape (27) -- cancel prompt
    LDI r4, 27
    CMP r7, r4
    JZ r5, hp_cancel

    ; Enter (10) -- execute prompt
    LDI r4, 10
    CMP r7, r4
    JZ r5, hp_execute

    ; Backspace (8) -- delete last char
    LDI r4, 8
    CMP r7, r4
    JZ r5, hp_bksp

    ; Printable (32-126)?
    LDI r4, 32
    CMP r7, r4
    BLT r5, hi_done
    LDI r4, 127
    CMP r7, r4
    BGE r5, hi_done

    ; Add char to prompt
    LDI r8, R_PM
    LOAD r8, r8              ; prompt mode
    LDI r4, 1
    CMP r8, r4
    JZ r5, hp_add_search

    ; Mode 3 (inc search) -- same as mode 1
    LDI r4, 3
    CMP r8, r4
    JZ r5, hp_add_search

    ; Mode 4 (replace) -- check sub-mode
    LDI r4, 4
    CMP r8, r4
    JNZ r5, hp_add_goto

    LDI r8, R_RSM
    LOAD r8, r8
    LDI r4, 1
    CMP r8, r4
    JNZ r5, hp_add_search

    ; Replace sub-mode 1 -- add to replace string
    LDI r10, 1
    LDI r8, R_RLEN
    LOAD r8, r8
    LDI r4, 40
    CMP r8, r4
    BGE r5, hi_done

    LDI r4, R_REPL
    ADD r4, r8
    STORE r4, r1
    ADD r8, r10
    LDI r4, R_RLEN
    STORE r4, r8
    JMP hi_done

hp_add_goto:

    ; Goto mode -- accumulate digit
    LDI r7, 48                ; '0'
    SUB r1, r7                ; digit value (assumes 0-9 input)
    LDI r4, 0
    CMP r1, r4
    BLT r5, hi_done
    LDI r4, 9
    CMP r1, r4
    BGE r5, hi_done            ; not a digit

    ; gnum = gnum * 10 + digit
    LDI r8, R_GNUM
    LOAD r8, r8
    LDI r4, 10
    MUL r8, r4
    ADD r8, r1
    LDI r4, R_GNUM
    STORE r4, r8
    JMP hi_done

hp_add_search:
    ; Add char to search string (modes 1, 3, and 4-sub0 share this)
    LDI r10, 1                  ; increment constant
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r4, 40                ; max 40 chars
    CMP r8, r4
    BGE r5, hi_done

    LDI r4, R_SEARCH
    ADD r4, r8
    STORE r4, r1              ; search_buf[slen] = char
    ADD r8, r10
    LDI r4, R_SLEN
    STORE r4, r8             ; slen++

    ; Incremental search -- auto-search on each keystroke
    LDI r4, R_PM
    LOAD r4, r4
    LDI r6, 3
    CMP r4, r6
    JZ r5, hp_auto_search

    ; Replace mode sub 0 -- also auto-search
    LDI r6, 4
    CMP r4, r6
    JNZ r5, hi_done

    ; Check replace sub-mode
    LDI r4, R_RSM
    LOAD r4, r4
    LDI r6, 0
    CMP r4, r6
    JNZ r5, hi_done

hp_auto_search:
    CALL do_search
    JMP hi_done

hp_bksp:
    LDI r8, R_PM
    LOAD r8, r8

    ; Check for replace sub-mode 1 (replace input)
    LDI r4, 4
    CMP r8, r4
    JNZ r5, hp_bksp_not_repl1
    LDI r4, R_RSM
    LOAD r4, r4
    LDI r6, 1
    CMP r4, r6
    JNZ r5, hp_bksp_not_repl1

    ; Replace string backspace
    LDI r10, 1
    LDI r8, R_RLEN
    LOAD r8, r8
    LDI r4, 0
    CMP r8, r4
    JZ r5, hi_done
    SUB r8, r10
    LDI r4, R_RLEN
    STORE r4, r8
    LDI r4, R_REPL
    ADD r4, r8
    LDI r6, 0
    STORE r4, r6
    JMP hi_done

hp_bksp_not_repl1:
    LDI r4, 1
    CMP r8, r4
    JZ r5, hp_bksp_search

    ; Also handle inc search (mode 3) backspace same as search (mode 1)
    LDI r4, 3
    CMP r8, r4
    JZ r5, hp_bksp_search

    ; Replace mode sub 0 -- search input backspace
    LDI r4, 4
    CMP r8, r4
    JNZ r5, hp_bksp_goto
    LDI r4, R_RSM
    LOAD r4, r4
    LDI r6, 0
    CMP r4, r6
    JNZ r5, hp_bksp_goto
    JMP hp_bksp_search

hp_bksp_goto:
    LDI r8, R_GNUM
    LOAD r8, r8
    LDI r4, 10
    DIV r8, r4
    LDI r4, R_GNUM
    STORE r4, r8
    JMP hi_done

hp_bksp_search:
    LDI r10, 1                  ; decrement constant
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r4, 0
    CMP r8, r4
    JZ r5, hi_done
    SUB r8, r10
    LDI r4, R_SLEN
    STORE r4, r8             ; slen--
    LDI r4, R_SEARCH
    ADD r4, r8
    LDI r6, 0
    STORE r4, r6             ; null terminate
    JMP hi_done

hp_execute:
    LDI r8, R_PM
    LOAD r8, r8
    LDI r4, 1
    CMP r8, r4
    JZ r5, hp_do_search

    ; Mode 3 -- incremental search: exit prompt, keep highlights
    LDI r4, 3
    CMP r8, r4
    JZ r5, hp_cancel

    ; Mode 4 -- replace
    LDI r4, 4
    CMP r8, r4
    JNZ r5, hp_do_goto

    ; Handle replace sub-modes
    LDI r8, R_RSM
    LOAD r8, r8
    LDI r4, 0
    CMP r8, r4
    JZ r5, hp_repl_to_replace
    LDI r4, 1
    CMP r8, r4
    JZ r5, hp_repl_to_confirm
    LDI r4, 2
    CMP r8, r4
    JNZ r5, hp_cancel

    ; Confirm sub-mode -- execute replace
    CALL do_replace
    JMP hp_cancel

hp_repl_to_replace:
    ; Search input done -- move to replace input
    LDI r8, R_RSM
    LDI r7, 1
    STORE r8, r7
    JMP hi_done

hp_repl_to_confirm:
    ; Replace input done -- move to confirm
    LDI r8, R_RSM
    LDI r7, 2
    STORE r8, r7
    JMP hi_done

    ; Execute goto
    CALL do_goto
    JMP hp_cancel

hp_do_search:
    CALL do_search
    ; Fall through to cancel (exit prompt mode)

hp_cancel:
    LDI r8, R_PM
    LDI r7, 0
    STORE r8, r7
    JMP hi_done

hi_done:
    POP r9
    POP r1
    POP r31
    RET

; =========================================
; CURSOR UP
; =========================================
cursor_up:
    PUSH r31
    PUSH r10
    LDI r10, 1

    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, cu_done

    SUB r8, r10
    LDI r4, R_CL
    STORE r4, r8

    CALL clamp_col
    CALL scroll_adj

cu_done:
    POP r10
    POP r31
    RET

; =========================================
; CURSOR DOWN
; =========================================
cursor_down:
    PUSH r31
    PUSH r10
    LDI r10, 1

    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, R_NL
    LOAD r7, r7
    SUB r7, r10
    CMP r8, r7
    BGE r5, cd_done

    ADD r8, r10
    LDI r4, R_CL
    STORE r4, r8

    CALL clamp_col
    CALL scroll_adj

cd_done:
    POP r10
    POP r31
    RET

; =========================================
; CURSOR LEFT
; =========================================
cursor_left:
    PUSH r31
    PUSH r10
    LDI r10, 1

    LDI r8, R_CC
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, cl_dec

    ; At col 0 -- move to end of previous line
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, cl_done

    SUB r8, r10
    LDI r4, R_CL
    STORE r4, r8
    CALL clamp_end
    CALL scroll_adj
    JMP cl_done

cl_dec:
    SUB r8, r10
    LDI r4, R_CC
    STORE r4, r8

cl_done:
    POP r10
    POP r31
    RET

; =========================================
; CURSOR RIGHT
; =========================================
cursor_right:
    PUSH r31
    PUSH r10
    LDI r10, 1

    ; Get current line length
    CALL get_llen
    MOV r8, r5

    LDI r7, R_CC
    LOAD r7, r7
    CMP r7, r8
    BLT r5, cr_inc

    ; At end of line -- move to start of next line
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, R_NL
    LOAD r7, r7
    SUB r7, r10
    CMP r8, r7
    BGE r5, cr_done

    ADD r8, r10
    LDI r4, R_CL
    STORE r4, r8
    LDI r8, R_CC
    LDI r7, 0
    STORE r8, r7
    CALL scroll_adj
    JMP cr_done

cr_inc:
    ADD r7, r10
    LDI r4, R_CC
    STORE r4, r7

cr_done:
    POP r10
    POP r31
    RET

; =========================================
; CLAMP COL -- set cur_col to min(cur_col, line_length)
; =========================================
clamp_col:
    PUSH r31
    PUSH r10
    LDI r10, 1

    CALL get_llen
    MOV r8, r5

    LDI r7, R_CC
    LOAD r7, r7
    CMP r7, r8
    BLT r5, cc_ok

    ; cur_col >= line_len, clamp
    LDI r4, R_CC
    STORE r4, r8
    ; If line_len == 0, set to 0
    LDI r7, 0
    CMP r8, r7
    JNZ r5, cc_ok
    LDI r4, R_CC
    STORE r4, r7

cc_ok:
    POP r10
    POP r31
    RET

; =========================================
; CLAMP END -- set cur_col to line_length (for going to end of line)
; =========================================
clamp_end:
    PUSH r31
    PUSH r10
    LDI r10, 1

    CALL get_llen
    MOV r8, r5

    LDI r7, R_CC
    STORE r7, r8
    ; If line_len is 0, that's fine (col = 0)

    POP r10
    POP r31
    RET

; =========================================
; GET LINE LENGTH -- returns in r5
; Length excludes trailing newline
; =========================================
get_llen:
    PUSH r10
    PUSH r8
    PUSH r7
    PUSH r4
    LDI r10, 1

    ; Get cur_line
    LDI r8, R_CL
    LOAD r8, r8

    ; Get line_starts[cur_line]
    LDI r7, LS
    ADD r7, r8
    LOAD r7, r7

    ; Is this the last line?
    LDI r4, R_NL
    LOAD r4, r4
    MOV r6, r8
    ADD r6, r10
    CMP r6, r4
    BGE r5, gll_last

    ; Not last: len = line_starts[next] - line_starts[cur] - 1
    LDI r4, LS
    ADD r4, r8
    ADD r4, r10
    LOAD r4, r4
    SUB r4, r7
    SUB r4, r10
    MOV r5, r4
    JMP gll_done

gll_last:
    ; Last: len = buf_size - line_starts[cur]
    LDI r4, R_BS
    LOAD r4, r4
    SUB r4, r7
    MOV r5, r4

gll_done:
    POP r4
    POP r7
    POP r8
    POP r10
    RET

; =========================================
; SCROLL ADJ -- ensure cursor is visible
; =========================================
scroll_adj:
    PUSH r31
    PUSH r10
    PUSH r8
    PUSH r7
    LDI r10, 1

    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, R_SC
    LOAD r7, r7

    ; cur_line < scroll_off? scroll up
    CMP r8, r7
    BLT r5, sa_up

    ; cur_line >= scroll_off + VIS? scroll down
    LDI r4, VIS
    ADD r4, r7
    CMP r8, r4
    BLT r5, sa_done

    ; scroll_off = cur_line - VIS + 1
    MOV r4, r8
    LDI r6, VIS
    SUB r4, r6
    ADD r4, r10
    LDI r6, R_SC
    STORE r6, r4
    JMP sa_done

sa_up:
    LDI r4, R_SC
    STORE r4, r8

sa_done:
    POP r7
    POP r8
    POP r10
    POP r31
    RET

; =========================================
; INSERT CHAR
; Insert the key (from r1) at cursor position
; =========================================
insert_char:
    PUSH r31
    PUSH r10
    PUSH r1
    PUSH r20
    LDI r10, 1

    ; Check buffer space
    LDI r8, R_BS
    LOAD r8, r8
    LDI r7, FB_MAX
    CMP r8, r7
    BGE r5, ic_full

    ; Get cursor position (offset in buffer)
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, LS
    ADD r7, r8
    LOAD r7, r7
    LDI r4, R_CC
    LOAD r4, r4
    ADD r7, r4            ; r7 = cursor_pos (offset)

    ; Shift buffer right from buf_size down to cursor_pos
    LDI r6, R_BS
    LOAD r6, r6           ; r6 = buf_size (shift counter)

ic_shift:
    CMP r6, r7
    BLT r5, ic_write
    JZ r5, ic_write

    ; Copy buf[offset-1] to buf[offset]  -- shift right
    LDI r12, FB
    ADD r12, r6
    SUB r12, r10             ; source = FB + offset - 1
    LOAD r15, r12
    LDI r12, FB
    ADD r12, r6            ; dest = FB + offset
    STORE r12, r15

    SUB r6, r10
    JMP ic_shift

ic_write:
    ; Write char at cursor_pos
    LDI r12, FB
    ADD r12, r7
    STORE r12, r1           ; buf[cursor_pos] = key char

    ; buf_size++
    LDI r8, R_BS
    LOAD r8, r8
    ADD r8, r10
    LDI r7, R_BS
    STORE r7, r8

    ; cur_col++
    LDI r8, R_CC
    LOAD r8, r8
    ADD r8, r10
    LDI r7, R_CC
    STORE r7, r8

    ; Set dirty
    LDI r8, R_DIRTY
    LDI r7, 1
    STORE r8, r7

    ; Rebuild lines
    CALL build_lines

ic_full:
    POP r20
    POP r1
    POP r10
    POP r31
    RET

; =========================================
; DO BACKSPACE
; Delete char before cursor, shift buffer left
; =========================================
do_backspace:
    PUSH r31
    PUSH r10
    PUSH r20
    LDI r10, 1

    ; Get cursor position
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, LS
    ADD r7, r8
    LOAD r7, r7
    LDI r4, R_CC
    LOAD r4, r4
    ADD r7, r4            ; r7 = cursor_pos

    ; If cursor_pos == 0, nothing to delete
    LDI r6, 0
    CMP r7, r6
    JZ r5, db_done

    ; Delete at cursor_pos - 1
    SUB r7, r10             ; r7 = delete_pos

    ; Shift left: copy [delete_pos+1 .. buf_size-1] to [delete_pos .. buf_size-2]
    LDI r6, R_BS
    LOAD r6, r6
    MOV r12, r7            ; r12 = current position

db_shift:
    MOV r15, r12
    ADD r15, r10             ; r15 = r12 + 1
    CMP r15, r6
    BGE r5, db_shift_done

    ; Copy buf[r12+1] to buf[r12]
    LDI r16, FB
    ADD r16, r15
    LOAD r17, r16
    LDI r16, FB
    ADD r16, r12
    STORE r16, r17

    ADD r12, r10
    JMP db_shift

db_shift_done:
    ; buf_size--
    LDI r8, R_BS
    LOAD r8, r8
    SUB r8, r10
    LDI r15, R_BS
    STORE r15, r8

    ; Adjust cursor
    LDI r8, R_CC
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, db_col_dec

    ; cur_col was 0 -- deleted a newline, join with prev line
    LDI r8, R_CL
    LOAD r8, r8
    SUB r8, r10
    LDI r7, R_CL
    STORE r7, r8
    CALL build_lines
    CALL clamp_end
    JMP db_dirty

db_col_dec:
    SUB r8, r10
    LDI r7, R_CC
    STORE r7, r8
    CALL build_lines

db_dirty:
    LDI r8, R_DIRTY
    LDI r7, 1
    STORE r8, r7

db_done:
    POP r20
    POP r10
    POP r31
    RET

; =========================================
; INSERT NEWLINE
; Insert 0x0A at cursor position
; =========================================
insert_newline:
    PUSH r31
    PUSH r10
    PUSH r20
    LDI r10, 1

    ; Check buffer space
    LDI r8, R_BS
    LOAD r8, r8
    LDI r7, FB_MAX
    CMP r8, r7
    BGE r5, inl_done

    ; Get cursor position
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, LS
    ADD r7, r8
    LOAD r7, r7
    LDI r4, R_CC
    LOAD r4, r4
    ADD r7, r4            ; r7 = cursor_pos

    ; Shift buffer right (same as insert_char)
    LDI r6, R_BS
    LOAD r6, r6

inl_shift:
    CMP r6, r7
    BLT r5, inl_write
    JZ r5, inl_write

    LDI r12, FB
    ADD r12, r6
    SUB r12, r10
    LOAD r15, r12
    LDI r12, FB
    ADD r12, r6
    STORE r12, r15

    SUB r6, r10
    JMP inl_shift

inl_write:
    ; Write newline char
    LDI r12, FB
    ADD r12, r7
    LDI r15, 10
    STORE r12, r15

    ; buf_size++
    LDI r8, R_BS
    LOAD r8, r8
    ADD r8, r10
    LDI r7, R_BS
    STORE r7, r8

    ; cur_line++, cur_col = 0
    LDI r8, R_CL
    LOAD r8, r8
    ADD r8, r10
    LDI r7, R_CL
    STORE r7, r8

    LDI r8, R_CC
    LDI r7, 0
    STORE r8, r7

    ; Set dirty
    LDI r8, R_DIRTY
    LDI r7, 1
    STORE r8, r7

    CALL build_lines
    CALL scroll_adj

inl_done:
    POP r20
    POP r10
    POP r31
    RET

; =========================================
; RENDER TITLE BAR
; =========================================
render_title:
    PUSH r31

    ; Bar background
    LDI r10, 0
    LDI r0, 0
    LDI r2, 256
    LDI r11, 12
    LDI r1, C_BAR
    RECTF r10, r0, r2, r11, r1

    ; Filename
    LDI r8, 4
    LDI r7, 2
    LDI r4, R_FN
    LDI r6, C_TITLE
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Buffer indicator (show active buffer number)
    LDI r8, R_BCNT
    LOAD r8, r8
    LDI r7, 1
    CMP r8, r7
    JZ r5, rt_nomod             ; only 1 buffer, skip indicator

    ; Show "[1]" or "[2]" in cyan
    LDI r8, R_BACT
    LOAD r8, r8
    LDI r7, 48                  ; '0'
    ADD r8, r7                 ; ascii digit
    LDI r7, 1
    ADD r8, r7                 ; 1-based
    LDI r15, R_SCR
    LDI r16, 91                  ; '['
    STORE r15, r16
    LDI r16, 1
    ADD r15, r16
    STORE r15, r8
    LDI r16, 1
    ADD r15, r16
    LDI r16, 93                  ; ']'
    STORE r15, r16
    LDI r16, 1
    ADD r15, r16
    LDI r16, 0
    STORE r15, r16
    LDI r8, 180
    LDI r7, 2
    LDI r4, R_SCR
    LDI r6, C_GREEN
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Modified indicator
    LDI r8, R_DIRTY
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rt_nomod

    LDI r8, R_SCR
    STRO r8, " *"
    LDI r8, 200
    LDI r7, 2
    LDI r4, R_SCR
    LDI r6, C_AMBER
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

rt_nomod:
    POP r31
    RET

; =========================================
; RENDER CONTENT -- draw visible lines
; =========================================
render_content:
    PUSH r31
    PUSH r10
    LDI r10, 1

    ; scroll_off
    LDI r8, R_SC
    LOAD r8, r8

    ; Loop i = 0..VIS-1
    LDI r7, 0

rc_loop:
    LDI r4, VIS
    CMP r7, r4
    BGE r5, rc_done

    ; line_num = scroll_off + i
    MOV r4, r8
    ADD r4, r7

    ; y position = 14 + i * 8
    MOV r6, r7
    LDI r12, LH
    MUL r6, r12
    LDI r12, 14
    ADD r6, r12            ; r6 = y

    ; Check line_num < line_count
    LDI r12, R_NL
    LOAD r12, r12
    CMP r4, r12
    BGE r5, rc_next

    ; Highlight current line
    LDI r12, R_CL
    LOAD r12, r12
    CMP r4, r12
    JNZ r5, rc_no_hl

    LDI r12, 0
    LDI r15, 256
    LDI r16, LH
    LDI r17, C_CURLN
    RECTF r12, r6, r15, r16, r17

rc_no_hl:
    ; Get line_start offset
    LDI r12, LS
    ADD r12, r4
    LOAD r12, r12            ; r12 = line_start (offset)

    ; Copy line to scratch (up to COLS chars, stop at newline)
    LDI r15, R_SCR           ; scratch dest
    LDI r16, 0               ; col counter

rc_copy:
    LDI r17, COLS
    CMP r16, r17
    BGE r5, rc_copy_end

    ; Check buffer bounds
    MOV r17, r12
    ADD r17, r16             ; r17 = line_start + col
    LDI r18, R_BS
    LOAD r18, r18
    CMP r17, r18
    BGE r5, rc_copy_end

    ; Load char
    LDI r18, FB
    ADD r18, r17
    LOAD r18, r18

    ; Check newline
    LDI r19, 10
    CMP r18, r19
    JZ r5, rc_copy_end

    ; Store in scratch
    STORE r15, r18
    ADD r15, r10
    ADD r16, r10
    JMP rc_copy

rc_copy_end:
    ; Null terminate
    LDI r17, 0
    STORE r15, r17

    ; Draw the line
    LDI r17, 0
    LDI r18, R_SCR
    LDI r19, C_FG
    LDI r20, 0
    DRAWTEXT r17, r6, r18, r19, r20

rc_next:
    ADD r7, r10
    JMP rc_loop

rc_done:
    POP r10
    POP r31
    RET

; =========================================
; RENDER CURSOR -- draw cursor block
; =========================================
render_cursor:
    PUSH r31
    PUSH r10
    LDI r10, 1

    ; Check if cursor line is visible
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, R_SC
    LOAD r7, r7
    SUB r8, r7             ; r8 = cur_line - scroll_off

    LDI r7, 0
    CMP r8, r7
    BLT r5, rcur_done
    LDI r7, VIS
    CMP r8, r7
    BGE r5, rcur_done

    ; y = 14 + (cur_line - scroll_off) * 8
    LDI r7, LH
    MUL r8, r7
    LDI r7, 14
    ADD r8, r7             ; r8 = y

    ; x = cur_col * 6
    LDI r7, R_CC
    LOAD r7, r7
    LDI r4, 6
    MUL r7, r4             ; r7 = x

    ; Draw cursor block
    LDI r4, 6
    LDI r6, LH
    LDI r12, C_SEL
    RECTF r7, r8, r4, r6, r12

rcur_done:
    POP r10
    POP r31
    RET

; =========================================
; RENDER HINTS -- bottom bar with key hints
; =========================================
render_hints:
    PUSH r31

    ; Bar background
    LDI r10, 0
    LDI r0, 240
    LDI r2, 256
    LDI r11, 16
    LDI r1, C_BAR
    RECTF r10, r0, r2, r11, r1

    ; Check if in prompt mode
    LDI r8, R_PM
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, rh_prompt

    ; Normal hints
    LDI r8, R_SCR
    STRO r8, "^S:Save ^Q:Quit ^F:Find ^G:Goto ^B:Buf ^N:New"
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_HINT
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_prompt:
    ; Search prompt (mode 1)
    LDI r7, 1
    CMP r8, r7
    JZ r5, rh_do_search_prompt

    ; Incremental search prompt (mode 3)
    LDI r7, 3
    CMP r8, r7
    JZ r5, rh_incsearch_prompt

    ; Replace prompt (mode 4)
    LDI r7, 4
    CMP r8, r7
    JZ r5, rh_replace_prompt

    ; Goto prompt (mode 2)
    JMP rh_goto_prompt

rh_do_search_prompt:

    LDI r8, R_SCR
    STRO r8, "Search: "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_AMBER
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Show search text after "Search: " (8 chars)
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_ln

    ; Copy search string to scratch
    LDI r8, R_SCR
    STRO r8, "                                        "
    LDI r15, R_SCR
    LDI r16, 0

rh_scopy:
    LDI r10, 1
    LDI r17, R_SLEN
    LOAD r17, r17
    CMP r16, r17
    BGE r5, rh_scopy_done
    LDI r17, R_SEARCH
    ADD r17, r16
    LOAD r17, r17
    STORE r15, r17
    ADD r15, r10
    ADD r16, r10
    JMP rh_scopy

rh_scopy_done:
    LDI r17, 0
    STORE r15, r17
    LDI r8, 52             ; x = 8 chars * 6px + 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_incsearch_prompt:
    ; Incremental search prompt (mode 3)
    LDI r8, R_SCR
    STRO r8, "ISearch: "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_GREEN
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Show search text (reuse rh_scopy pattern)
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_inc_status

    LDI r8, R_SCR
    STRO r8, "                                        "
    LDI r15, R_SCR
    LDI r16, 0

rh_iscopy:
    LDI r10, 1
    LDI r17, R_SLEN
    LOAD r17, r17
    CMP r16, r17
    BGE r5, rh_iscopy_done
    LDI r17, R_SEARCH
    ADD r17, r16
    LOAD r17, r17
    STORE r15, r17
    ADD r15, r10
    ADD r16, r10
    JMP rh_iscopy

rh_iscopy_done:
    LDI r17, 0
    STORE r15, r17
    LDI r8, 52
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

rh_inc_status:
    ; Show match count or "no match"
    LDI r8, R_SML
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_ln
    LDI r7, 0xFFFFFFFF
    CMP r8, r7
    JNZ r5, rh_ln

    ; No match found
    LDI r8, R_SCR
    STRO r8, " [no match]"
    LDI r8, 150
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_HINT
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_replace_prompt:
    ; Replace prompt (mode 4) -- show different text per sub-mode
    LDI r8, R_RSM
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_repl_search

    LDI r7, 1
    CMP r8, r7
    JZ r5, rh_repl_replace

    ; Sub-mode 2: confirm
    LDI r8, R_SCR
    STRO r8, "Replace all? (y=yes, n=no) "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_REPL
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_repl_search:
    ; Sub-mode 0: search input
    LDI r8, R_SCR
    STRO r8, "Find: "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_AMBER
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Show search text
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_ln

    LDI r8, R_SCR
    STRO r8, "                                        "
    LDI r15, R_SCR
    LDI r16, 0

rh_rscopy:
    LDI r10, 1
    LDI r17, R_SLEN
    LOAD r17, r17
    CMP r16, r17
    BGE r5, rh_rscopy_done
    LDI r17, R_SEARCH
    ADD r17, r16
    LOAD r17, r17
    STORE r15, r17
    ADD r15, r10
    ADD r16, r10
    JMP rh_rscopy

rh_rscopy_done:
    LDI r17, 0
    STORE r15, r17
    LDI r8, 28
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_repl_replace:
    ; Sub-mode 1: replace input
    LDI r8, R_SCR
    STRO r8, "Replace: "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_REPL
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Show replace text
    LDI r8, R_RLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_ln

    LDI r8, R_SCR
    STRO r8, "                                        "
    LDI r15, R_SCR
    LDI r16, 0

rh_rrcopy:
    LDI r10, 1
    LDI r17, R_RLEN
    LOAD r17, r17
    CMP r16, r17
    BGE r5, rh_rrcopy_done
    LDI r17, R_REPL
    ADD r17, r16
    LOAD r17, r17
    STORE r15, r17
    ADD r15, r10
    ADD r16, r10
    JMP rh_rrcopy

rh_rrcopy_done:
    LDI r17, 0
    STORE r15, r17
    LDI r8, 52
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_goto_prompt:
    ; Goto prompt
    LDI r8, R_SCR
    STRO r8, "Goto line: "
    LDI r8, 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_AMBER
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    ; Show number
    LDI r8, R_GNUM
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_show_zero

    ; Convert number to decimal string
    LDI r10, 1                  ; increment constant
    LDI r8, R_GNUM
    LOAD r8, r8
    LDI r7, R_SCR
    LDI r4, 0
    STRO r7, "                                        "
    LDI r15, R_SCR
    ADD r15, r4            ; points to end of number string
    LDI r16, 10

rh_ndiv:
    LDI r7, 0
    CMP r8, r7
    JZ r5, rh_ndone
    MOV r17, r8            ; save value before MOD
    LDI r7, 10
    MOD r8, r7            ; r8 = value % 10 (digit)
    LDI r4, 48
    ADD r8, r4            ; digit char
    STORE r15, r8
    ADD r15, r10
    LDI r7, 10
    DIV r17, r7            ; r17 = value / 10 (quotient)
    MOV r8, r17            ; r8 = quotient for next iteration
    JMP rh_ndiv

rh_ndone:
    ; Reverse the string in place
    ; r15 points past last digit, r4 = R_SCR was start
    ; Actually we need to reverse from R_SCR to r15-1
    LDI r8, R_SCR
    MOV r7, r15
    SUB r7, r10             ; r7 = last digit position
    LDI r4, 0
    CMP r8, r7
    BGE r5, rh_nshow        ; 0 or 1 digits, no reversal needed

rh_rev:
    CMP r8, r7
    BGE r5, rh_nshow
    LOAD r4, r8
    LOAD r6, r7
    STORE r8, r6
    STORE r7, r4
    ADD r8, r10
    SUB r7, r10
    JMP rh_rev

rh_nshow:
    ; Null terminate
    LDI r8, 0
    STORE r15, r8
    LDI r8, 64             ; x = 10 chars * 6px + 4
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_show_zero:
    LDI r8, R_SCR
    LDI r7, 48             ; '0'
    STORE r8, r7
    LDI r7, 0
    ADD r8, r10
    STORE r8, r7
    LDI r8, 64
    LDI r7, 242
    LDI r4, R_SCR
    LDI r6, C_FG
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12
    JMP rh_ln

rh_ln:
    ; Line/col info
    LDI r8, R_SCR
    STRO r8, "Ln:"
    LDI r8, 4
    LDI r7, 250
    LDI r4, R_SCR
    LDI r6, C_GREEN
    LDI r12, C_BAR
    DRAWTEXT r8, r7, r4, r6, r12

    POP r31
    RET

; =========================================
; ENTER SEARCH -- start search prompt mode
; =========================================
enter_search:
    PUSH r31

    ; If already have search string, do find-next instead
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, es_next

    ; Enter prompt mode
    LDI r8, R_PM
    LDI r7, 1
    STORE r8, r7

    ; Clear search string
    LDI r8, R_SLEN
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_SEARCH
    STORE r8, r7

    POP r31
    RET

es_next:
    ; Find next from current position
    CALL do_search
    POP r31
    RET

enter_incsearch:
    PUSH r31

    ; Enter incremental search mode (prompt mode 3)
    LDI r8, R_PM
    LDI r7, 3
    STORE r8, r7

    ; Clear search string
    LDI r8, R_SLEN
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_SEARCH
    STORE r8, r7

    POP r31
    RET

enter_replace:
    PUSH r31

    ; Enter replace mode (prompt mode 4, sub-mode 0 = search input)
    LDI r8, R_PM
    LDI r7, 4
    STORE r8, r7

    ; Clear search string
    LDI r8, R_SLEN
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_SEARCH
    STORE r8, r7

    ; Clear replace string
    LDI r8, R_RLEN
    STORE r8, r7
    LDI r8, R_REPL
    STORE r8, r7

    ; Reset sub-mode
    LDI r8, R_RSM
    STORE r8, r7

    POP r31
    RET

; =========================================
; ENTER GOTO -- start goto prompt mode
; =========================================
enter_goto:
    PUSH r31

    LDI r8, R_PM
    LDI r7, 2
    STORE r8, r7

    ; Clear goto number
    LDI r8, R_GNUM
    LDI r7, 0
    STORE r8, r7

    POP r31
    RET

; =========================================
; DO SEARCH -- find search string in buffer
; Scans forward from cursor position (or from match+1 if searching again)
; =========================================
do_search:
    PUSH r31
    PUSH r10
    PUSH r1
    PUSH r8
    PUSH r7
    PUSH r4
    PUSH r6
    PUSH r12
    PUSH r15
    PUSH r16
    PUSH r17
    PUSH r18
    LDI r10, 1

    ; Get search length
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, ds_done          ; empty string, skip

    ; Start position: cursor_pos + 1 (search forward from after cursor)
    LDI r8, R_CL
    LOAD r8, r8
    LDI r7, LS
    ADD r7, r8
    LOAD r7, r7
    LDI r4, R_CC
    LOAD r4, r4
    ADD r7, r4            ; r7 = cursor offset
    ADD r7, r10             ; start one past cursor

    ; Check bounds
    LDI r6, R_BS
    LOAD r6, r6
    LDI r8, R_SLEN
    LOAD r8, r8

ds_outer:
    ; Check if remaining buffer is long enough
    MOV r12, r7
    ADD r12, r8             ; end of potential match
    CMP r12, r6
    BGE r5, ds_not_found

    ; Try matching at position r7
    LDI r15, 0               ; match offset

ds_inner:
    CMP r15, r8
    BGE r5, ds_found

    ; Load buffer char
    LDI r16, FB
    ADD r16, r7
    ADD r16, r15
    LOAD r16, r16

    ; Load search char
    LDI r17, R_SEARCH
    ADD r17, r15
    LOAD r17, r17

    CMP r16, r17
    JNZ r5, ds_no_match

    ADD r15, r10
    JMP ds_inner

ds_no_match:
    ADD r7, r10
    JMP ds_outer

ds_found:
    ; Found at position r7
    ; Convert offset to line,col
    ; Find which line this offset belongs to
    LDI r4, R_NL
    LOAD r4, r4            ; line count
    LDI r12, 0               ; line index

ds_find_line:
    CMP r12, r4
    BGE r5, ds_not_found

    LDI r15, LS
    ADD r15, r12
    LOAD r15, r15            ; line_starts[line]

    ; Check next line start
    MOV r16, r12
    ADD r16, r10
    CMP r16, r4
    BGE r5, ds_last_line

    LDI r17, LS
    ADD r17, r16
    LOAD r17, r17            ; line_starts[line+1]

    ; r7 >= line_starts[line] AND r7 < line_starts[line+1]
    CMP r7, r15
    BLT r5, ds_fl_next
    CMP r7, r17
    BGE r5, ds_fl_next

    ; Found the line
    ; col = r7 - line_starts[line]
    SUB r7, r15             ; col = offset - line_start
    MOV r8, r12             ; line
    JMP ds_set_match

ds_fl_next:
    ADD r12, r10
    JMP ds_find_line

ds_last_line:
    CMP r7, r15
    BLT r5, ds_not_found
    ; It is on the last line
    SUB r7, r15
    MOV r8, r12
    JMP ds_set_match

ds_set_match:
    ; Set cursor to match position
    LDI r15, R_CL
    STORE r15, r8           ; cursor line
    LDI r15, R_CC
    STORE r15, r7           ; cursor col
    LDI r15, R_SML
    STORE r15, r8           ; match line
    LDI r15, R_SMC
    STORE r15, r7           ; match col

    ; Adjust scroll
    CALL scroll_adj
    JMP ds_done

ds_not_found:
    ; Clear match indicator
    LDI r8, R_SML
    LDI r7, 0xFFFFFFFF
    STORE r8, r7

ds_done:
    POP r18
    POP r17
    POP r16
    POP r15
    POP r12
    POP r6
    POP r4
    POP r7
    POP r8
    POP r1
    POP r10
    POP r31
    RET

; =========================================
; DO REPLACE -- replace all occurrences of search with replace
; Uses: r10-r18, modifies buffer in-place
; Strategy: scan buffer for matches, build new buffer with replacements
; =========================================
do_replace:
    PUSH r31
    PUSH r10
    PUSH r1
    PUSH r8
    PUSH r7
    PUSH r4
    PUSH r6
    PUSH r12
    PUSH r15
    PUSH r16
    PUSH r17
    PUSH r18
    PUSH r19
    PUSH r20
    LDI r10, 1

    ; Get search length
    LDI r8, R_SLEN
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, dr_done          ; empty search, skip

    ; Get replace length
    LDI r7, R_RLEN
    LOAD r7, r7

    ; If replace == search, nothing to do
    CMP r8, r7
    JZ r5, dr_done

    ; Get buffer size
    LDI r6, R_BS
    LOAD r6, r6

    ; Start scanning from position 0
    LDI r12, 0               ; scan position
    LDI r19, 0               ; match count

dr_scan:
    ; Check if remaining buffer is long enough for search
    MOV r15, r12
    ADD r15, r8
    CMP r15, r6
    BGE r5, dr_scan_done

    ; Try matching at position r12
    LDI r16, 0               ; match offset

dr_match:
    CMP r16, r8
    BGE r5, dr_found

    ; Load buffer char
    LDI r17, FB
    ADD r17, r12
    ADD r17, r16
    LOAD r17, r17

    ; Load search char
    LDI r18, R_SEARCH
    ADD r18, r16
    LOAD r18, r18

    CMP r17, r18
    JNZ r5, dr_no_match

    ADD r16, r10
    JMP dr_match

dr_no_match:
    ADD r12, r10
    JMP dr_scan

dr_found:
    ; Found match at r12
    ADD r19, r10              ; match count++

    ; Calculate size delta: replace_len - search_len
    MOV r20, r7
    SUB r20, r8             ; delta (signed)

    ; Case 1: replace shorter or same -- shift left, overwrite
    LDI r15, 0
    CMP r20, r15
    BGE r5, dr_grow

    ; Shrink: move remainder left
    ; Source: FB[r12+search_len] to FB[buf_size]
    ; Dest: FB[r12+replace_len]
    PUSH r12                 ; save match position for write loop
    MOV r16, r12
    ADD r16, r8             ; source start (after match)
    MOV r17, r12
    ADD r17, r7             ; dest start (after replace)
    ; Copy from end to start to avoid overwrite
    ; Remaining = buf_size - (r12 + search_len)
    MOV r18, r6
    SUB r18, r16             ; remaining count

dr_shrink_loop:
    LDI r15, 0
    CMP r18, r15
    JZ r5, dr_shrink_done

    ; Source addr = FB + source_start + (remaining - 1)
    ; i.e. FB + r16 + r18 - 1
    MOV r15, r16
    ADD r15, r18
    SUB r15, r10
    LDI r4, FB
    ADD r4, r15
    LOAD r4, r4           ; r4 = char from source

    ; Dest addr = FB + dest_start + (remaining - 1)
    ; i.e. FB + r17 + r18 - 1
    MOV r15, r17
    ADD r15, r18
    SUB r15, r10
    LDI r12, FB
    ADD r15, r12            ; r15 = dest address
    STORE r15, r4          ; store char

    SUB r18, r10
    JMP dr_shrink_loop

dr_shrink_done:
    POP r12                  ; restore match position
    ; Write replace string
    LDI r16, 0               ; i
dr_write_shrink:
    CMP r16, r7
    BGE r5, dr_after_shrink
    MOV r17, r12
    ADD r17, r16
    LDI r18, FB
    ADD r18, r17
    LDI r17, R_REPL
    ADD r17, r16
    LOAD r17, r17
    STORE r18, r17
    ADD r16, r10
    JMP dr_write_shrink

dr_after_shrink:
    ; Update buffer size
    LDI r16, R_BS
    LOAD r17, r6
    ADD r17, r20             ; buf_size + delta
    STORE r16, r17
    MOV r6, r17             ; update local

    ; Update scan position (past the replacement)
    MOV r12, r16
    ADD r12, r7             ; skip past replace
    JMP dr_scan

dr_grow:
    ; Replace is longer -- check if buffer has room
    ; Max buffer is FB + 2000
    LDI r15, 2000
    CMP r6, r15
    BGE r5, dr_scan_done     ; buffer full, stop

    ; Move remainder right to make room
    ; Source end: FB[buf_size-1], Dest end: FB[buf_size+delta-1]
    PUSH r12                 ; save match position for write loop
    MOV r18, r6             ; remaining count = buf_size
    LDI r15, 0

dr_grow_loop:
    LDI r15, 0
    CMP r18, r15
    JZ r5, dr_grow_done

    ; Source index = buf_size - remaining = r6 - r18
    ; Source addr = FB + r6 - r18
    MOV r15, r6
    SUB r15, r18
    LDI r4, FB
    ADD r4, r15
    LOAD r4, r4           ; r4 = char from source

    ; Dest index = source_index + delta = r6 - r18 + r20
    ; Dest addr = FB + r6 - r18 + r20
    MOV r15, r6
    SUB r15, r18
    ADD r15, r20
    LDI r12, FB
    ADD r15, r12            ; r15 = dest address
    STORE r15, r4          ; store char

    SUB r18, r10
    JMP dr_grow_loop

dr_grow_done:
    POP r12                  ; restore match position
    ; Write replace string
    LDI r16, 0
dr_write_grow:
    CMP r16, r7
    BGE r5, dr_after_grow
    MOV r17, r12
    ADD r17, r16
    LDI r18, FB
    ADD r18, r17
    LDI r17, R_REPL
    ADD r17, r16
    LOAD r17, r17
    STORE r18, r17
    ADD r16, r10
    JMP dr_write_grow

dr_after_grow:
    ; Update buffer size
    LDI r16, R_BS
    LOAD r17, r6
    ADD r17, r20             ; buf_size + delta
    STORE r16, r17
    MOV r6, r17

    ; Update scan position
    MOV r12, r16
    ADD r12, r7
    JMP dr_scan

dr_scan_done:
    ; Rebuild line starts (call insert_newline which rebuilds)
    ; Actually we need to rebuild the line structure
    ; Set dirty flag
    LDI r8, R_DIRTY
    LDI r7, 1
    STORE r8, r7

    ; Rebuild line starts by scanning buffer for newlines
    CALL rebuild_lines

    ; Clamp cursor
    CALL clamp_end
    CALL scroll_adj

dr_done:
    POP r20
    POP r19
    POP r18
    POP r17
    POP r16
    POP r15
    POP r12
    POP r6
    POP r4
    POP r7
    POP r8
    POP r1
    POP r10
    POP r31
    RET

; =========================================
; REBUILD LINES -- rescan buffer for newlines to rebuild line_starts
; Called after replace to fix line structure
; =========================================
rebuild_lines:
    PUSH r31
    PUSH r10
    PUSH r8
    PUSH r7
    PUSH r4
    PUSH r6
    PUSH r12
    LDI r10, 1

    LDI r6, R_BS
    LOAD r6, r6            ; buffer size
    LDI r12, 0               ; position
    LDI r8, 0               ; line count

    ; First line always starts at 0
    LDI r7, LS
    LDI r4, 0
    STORE r7, r4
    ADD r8, r10              ; line count = 1

rl_scan:
    CMP r12, r6
    BGE r5, rl_done

    ; Load char
    LDI r7, FB
    ADD r7, r12
    LOAD r7, r7

    ; Check for newline (10)
    LDI r4, 10
    CMP r7, r4
    JNZ r5, rl_next

    ; Found newline -- next line starts at pos+1
    ADD r12, r10
    ; Store line start
    LDI r7, LS
    ADD r7, r8
    STORE r7, r12
    ADD r8, r10

    JMP rl_scan

rl_next:
    ADD r12, r10
    JMP rl_scan

rl_done:
    ; Store line count
    LDI r7, R_NL
    STORE r7, r8

    POP r12
    POP r6
    POP r4
    POP r7
    POP r8
    POP r10
    POP r31
    RET

; =========================================
; DO GOTO -- jump to line number in R_GNUM
; =========================================
do_goto:
    PUSH r31
    PUSH r10
    PUSH r8
    PUSH r7
    PUSH r4
    LDI r10, 1

    ; Get target line (user enters 1-based, we use 0-based)
    LDI r8, R_GNUM
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JZ r5, dg_done          ; goto line 0 = noop

    ; Convert to 0-based
    SUB r8, r10
    LDI r7, 0
    CMP r8, r7
    BLT r5, dg_done         ; negative, invalid

    ; Clamp to last line
    LDI r4, R_NL
    LOAD r4, r4
    SUB r4, r10             ; last valid line index
    CMP r8, r4
    BLT r5, dg_ok
    MOV r8, r4            ; clamp

dg_ok:
    ; Set cursor line
    LDI r7, R_CL
    STORE r7, r8
    LDI r7, R_CC
    LDI r4, 0
    STORE r7, r4          ; col = 0

    ; Adjust scroll
    CALL scroll_adj

dg_done:
    ; Reset goto number
    LDI r8, R_GNUM
    LDI r7, 0
    STORE r8, r7

    POP r4
    POP r7
    POP r8
    POP r10
    POP r31
    RET

; =========================================
; SWITCH_BUF -- toggle between buffer 0 and 1
; Saves current cursor state, auto-saves if dirty,
; loads the other buffer's file
; =========================================
switch_buf:
    PUSH r31
    PUSH r10
    PUSH r8
    PUSH r7
    PUSH r4
    PUSH r6
    PUSH r12
    PUSH r15
    PUSH r16
    LDI r10, 1

    ; Check buf_count > 1
    LDI r8, R_BCNT
    LOAD r8, r8
    LDI r7, 1
    CMP r8, r7
    JZ r5, sb_done              ; only 1 buffer, no switch

    ; Get current active buffer
    LDI r8, R_BACT
    LOAD r8, r8               ; 0 or 1

    ; Save current cursor state to active buffer's slot
    LDI r7, 0
    CMP r8, r7
    JNZ r5, sb_save1

sb_save0:
    ; Save buf 0 cursor state
    LDI r7, R_CL
    LOAD r7, r7
    LDI r4, R_B0CL
    STORE r4, r7

    LDI r7, R_CC
    LOAD r7, r7
    LDI r4, R_B0CC
    STORE r4, r7

    LDI r7, R_SC
    LOAD r7, r7
    LDI r4, R_B0SC
    STORE r4, r7
    JMP sb_autosave

sb_save1:
    ; Save buf 1 cursor state
    LDI r7, R_CL
    LOAD r7, r7
    LDI r4, R_B1CL
    STORE r4, r7

    LDI r7, R_CC
    LOAD r7, r7
    LDI r4, R_B1CC
    STORE r4, r7

    LDI r7, R_SC
    LOAD r7, r7
    LDI r4, R_B1SC
    STORE r4, r7

sb_autosave:
    ; Auto-save if dirty
    LDI r7, R_DIRTY
    LOAD r7, r7
    LDI r4, 0
    CMP r7, r4
    JZ r5, sb_no_save
    CALL save_file

sb_no_save:
    ; Toggle active buffer
    LDI r8, R_BACT
    LOAD r8, r8
    LDI r7, 1
    XOR r8, r7                ; toggle 0 <-> 1
    LDI r7, R_BACT
    STORE r7, r8              ; save new active

    ; Copy new buffer's filename to R_FN
    LDI r7, 0
    CMP r8, r7
    JNZ r5, sb_fn1

sb_fn0:
    ; Copy buf 0 filename to R_FN
    LDI r15, R_B0FN
    JMP sb_fn_copy

sb_fn1:
    ; Copy buf 1 filename to R_FN
    LDI r15, R_B1FN

sb_fn_copy:
    LDI r16, R_FN
sb_fn_loop:
    LOAD r17, r15
    STORE r16, r17
    LDI r17, 0
    CMP r17, r15
    LOAD r17, r15
    LDI r18, 0
    CMP r17, r18
    JZ r5, sb_fn_done
    ADD r15, r10
    ADD r16, r10
    JMP sb_fn_loop

sb_fn_done:
    ; Load new file
    CALL load_file

    ; Build lines
    CALL build_lines

    ; If line_count == 0, ensure at least 1 line
    LDI r8, R_NL
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, sb_restore

    LDI r8, R_NL
    LDI r7, 1
    STORE r8, r7
    LDI r8, LS
    LDI r7, 0
    STORE r8, r7

sb_restore:
    ; Restore cursor state from new buffer's slot
    LDI r8, R_BACT
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, sb_rest1

sb_rest0:
    LDI r7, R_B0CL
    LOAD r7, r7
    LDI r4, R_CL
    STORE r4, r7

    LDI r7, R_B0CC
    LOAD r7, r7
    LDI r4, R_CC
    STORE r4, r7

    LDI r7, R_B0SC
    LOAD r7, r7
    LDI r4, R_SC
    STORE r4, r7
    JMP sb_done

sb_rest1:
    LDI r7, R_B1CL
    LOAD r7, r7
    LDI r4, R_CL
    STORE r4, r7

    LDI r7, R_B1CC
    LOAD r7, r7
    LDI r4, R_CC
    STORE r4, r7

    LDI r7, R_B1SC
    LOAD r7, r7
    LDI r4, R_SC
    STORE r4, r7

sb_done:
    ; Clear dirty flag
    LDI r8, R_DIRTY
    LDI r7, 0
    STORE r8, r7

    POP r16
    POP r15
    POP r12
    POP r6
    POP r4
    POP r7
    POP r8
    POP r10
    POP r31
    RET

; =========================================
; NEW_BUF -- open a second buffer with default scratch file
; =========================================
new_buf:
    PUSH r31
    PUSH r10
    PUSH r8
    PUSH r7
    PUSH r15
    PUSH r16
    PUSH r17
    PUSH r18
    LDI r10, 1

    ; Check if already have 2 buffers
    LDI r8, R_BCNT
    LOAD r8, r8
    LDI r7, 2
    CMP r8, r7
    BGE r5, nb_switch           ; already 2 buffers, just switch

    ; Save current cursor state to buffer 0 slot
    LDI r7, R_CL
    LOAD r7, r7
    LDI r4, R_B0CL
    STORE r4, r7

    LDI r7, R_CC
    LOAD r7, r7
    LDI r4, R_B0CC
    STORE r4, r7

    LDI r7, R_SC
    LOAD r7, r7
    LDI r4, R_B0SC
    STORE r4, r7

    ; Auto-save current buffer if dirty
    LDI r7, R_DIRTY
    LOAD r7, r7
    LDI r4, 0
    CMP r7, r4
    JZ r5, nb_no_save
    CALL save_file

nb_no_save:
    ; Set buffer 1 filename to scratch file
    LDI r15, R_B1FN
    STRO r15, "~/.geos_scratch.txt"

    ; Set buf_count = 2
    LDI r8, R_BCNT
    LDI r7, 2
    STORE r8, r7

    ; Set active_buf = 1
    LDI r8, R_BACT
    LDI r7, 1
    STORE r8, r7

    ; Copy new filename to R_FN
    LDI r15, R_B1FN
    LDI r16, R_FN
nb_fn_copy:
    LOAD r17, r15
    STORE r16, r17
    LDI r17, 0
    CMP r17, r15
    LOAD r17, r15
    LDI r18, 0
    CMP r17, r18
    JZ r5, nb_fn_done
    ADD r15, r10
    ADD r16, r10
    JMP nb_fn_copy

nb_fn_done:
    ; Clear buffer
    LDI r8, R_BS
    LDI r7, 0
    STORE r8, r7

    ; Load file (may not exist -- that is OK)
    CALL load_file

    ; Build lines
    CALL build_lines

    ; Ensure at least 1 line
    LDI r8, R_NL
    LOAD r8, r8
    LDI r7, 0
    CMP r8, r7
    JNZ r5, nb_reset_cursor

    LDI r8, R_NL
    LDI r7, 1
    STORE r8, r7
    LDI r8, LS
    LDI r7, 0
    STORE r8, r7

nb_reset_cursor:
    ; Reset cursor for new buffer
    LDI r8, R_CL
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_CC
    STORE r8, r7
    LDI r8, R_SC
    STORE r8, r7

    ; Save initial cursor for buffer 1
    LDI r8, R_B1CL
    LDI r7, 0
    STORE r8, r7
    LDI r8, R_B1CC
    STORE r8, r7
    LDI r8, R_B1SC
    STORE r8, r7

    ; Clear dirty flag
    LDI r8, R_DIRTY
    LDI r7, 0
    STORE r8, r7

    JMP nb_done

nb_switch:
    ; Already 2 buffers -- just switch
    CALL switch_buf

nb_done:
    POP r18
    POP r17
    POP r16
    POP r15
    POP r7
    POP r8
    POP r10
    POP r31
    RET
