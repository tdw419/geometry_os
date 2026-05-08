; DESCRIPTION: A colored line centered at the screen with fixed size.

; terminal.asm -- Interactive Terminal for Geometry OS (v7 with self-hosting)
;
; Self-contained GUI app: draw, input, render loop.
; Commands: clear, cls, help, ver, hi, echo, ls, date, cat, sys,
;           colors, whoami, uname, uptime, run, quit,
;           edit <file>, build <file>, reload
; Auto-scrolls when content exceeds 30 rows
;
; RAM Layout:
;   0x4000-0x44EB  Text buffer (42*30 = 1260 u32 cells, row-major)
;   0x4800         Cursor column
;   0x4801         Cursor row
;   0x4802         Blink counter
;   0x5000-0x502A  Scratch line buffer (42 chars + null)
;   0x5200-0x52C8  Cat file buffer (200 u32s for cat command)
;   0x5300         Run filename buffer (null-terminated, for EXEC)
;   0xFF5          HOTRELOAD verb port (0=noop, 1=edit, 2=reload)
;   0xFF6          HOTRELOAD path pointer (RAM addr of filename)

#define COLS 42
#define ROWS 30
#define BUF 0x4000
#define BUF_END 0x44EC
#define CUR_COL 0x4800
#define CUR_ROW 0x4801
#define BLINK 0x4802
#define SCRATCH 0x5000

; =========================================
; INIT
; =========================================
LDI r0, 1
LDI r30, 0xFD00   ; Initialize stack pointer (r30=SP) to high RAM

; Clear screen
LDI r1, 0x0C0C0C
FILL r1

; Clear text buffer to spaces
LDI r20, BUF
LDI r15, 32
clear_buf:
    STORE r20, r15
    ADD r20, r0
    CMPI r20, BUF_END
    BLT r1, clear_buf

; Init cursor and blink to 0
LDI r20, CUR_COL
LDI r1, 0
STORE r20, r1
LDI r20, CUR_ROW
STORE r20, r1
LDI r20, BLINK
STORE r20, r1

; Title bar
LDI r0, 0
LDI r8, 0
LDI r3, 256
LDI r13, 16
LDI r12, 0x333355
RECTF r0, r8, r3, r13, r12

; Title text "GeoTerm" -- use STRO + DRAWTEXT (green on dark title bar)
LDI r20, SCRATCH
STRO r20, "GeoTerm"
LDI r0, 4
LDI r8, 4
LDI r3, SCRATCH
LDI r13, 0x00FF00  ; fg = green
LDI r12, 0x333355  ; bg = match title bar
DRAWTEXT r0, r8, r3, r13, r12

; Close button hit region
LDI r0, 220
LDI r8, 0
LDI r3, 36
LDI r13, 16
HITSET r0, r8, r3, r13, 99

; Restore r0 = 1 before writing prompt!
LDI r0, 1

; Write prompt "$ " at buffer row 0
LDI r20, BUF
LDI r1, 36           ; '$'
STORE r20, r1
ADD r20, r0
LDI r1, 32           ; ' '
STORE r20, r1

; Set cursor to col 2
LDI r20, CUR_COL
LDI r1, 2
STORE r20, r1

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r0, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r1, r20
    ADD r1, r0
    STORE r20, r1

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r12
    JZ r12, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r0, 1

    ; Clear content area
    LDI r0, 0
    LDI r8, 16
    LDI r3, 256
    LDI r13, 240
    LDI r12, 0x0C0C0C
    RECTF r0, r8, r3, r13, r12

    ; Row loop
    LDI r0, 1
    LDI r5, 8            ; CHAR_H
    LDI r11, 6            ; CHAR_W
    LDI r14, 0           ; row counter
    LDI r10, BUF         ; buffer pointer
    LDI r2, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to scratch
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r15, r10
    STORE r16, r15
    ADD r10, r0
    ADD r16, r0
    ADD r17, r0
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r1, 0
    STORE r16, r1

    ; DRAWTEXT x=0, y=r2, addr=SCRATCH, fg=white, bg=0 (transparent)
    LDI r0, 0
    LDI r4, SCRATCH
    LDI r6, 0xCCCCCC  ; fg = light gray
    LDI r9, 0         ; bg = transparent
    DRAWTEXT r0, r2, r4, r6, r9

    LDI r0, 1

    ADD r2, r5          ; y += 8
    ADD r14, r0          ; row++
    CMPI r14, ROWS
    BLT r14, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r1, r20
    LDI r7, 8
    AND r1, r7
    CMPI r1, 4
    BLT r1, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r1, r20
    MUL r1, r11           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r8, r20
    MUL r8, r5           ; row * 8
    LDI r3, 16
    ADD r8, r3           ; y = 16 + row*8
    LDI r3, 6
    LDI r13, 8
    LDI r12, 0x44FF44
    RECTF r1, r8, r3, r13, r12

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r12 = key
; =========================================
handle_key:
    PUSH r31
    LDI r0, 1

    CMPI r12, 13
    JNZ r1, check_bs
    JMP do_enter

check_bs:
    CMPI r12, 8
    JNZ r1, check_del
    JMP do_backspace

check_del:
    CMPI r12, 127
    JNZ r1, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r3, COLS
    MUL r8, r3           ; r8 = row * COLS
    LDI r20, CUR_COL
    LOAD r1, r20
    ADD r8, r1           ; r8 = row*COLS + col
    LDI r20, BUF
    ADD r20, r8          ; r20 = BUF + offset
    STORE r20, r12        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r1, r20
    ADD r1, r0
    STORE r20, r1

    ; If col >= COLS, wrap
    CMPI r1, COLS
    JNZ r1, hk_ret
    CALL do_newline
    JMP hk_ret

; =========================================
; DO_ENTER -- command dispatch
; =========================================
do_enter:
    ; 1. Extract command text from current row into SCRATCH
    CALL extract_cmd

    ; 2. Advance to next row for output
    CALL do_newline

    ; 3. Try matching commands (dispatch_cmd writes output rows)
    CALL dispatch_cmd

    ; 4. Write prompt "$ " on the row after any output
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r3, COLS
    MUL r8, r3
    LDI r20, BUF
    ADD r20, r8
    LDI r1, 36           ; '$'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32           ; ' '
    STORE r20, r1
    LDI r20, CUR_COL
    LDI r1, 2
    STORE r20, r1
    JMP hk_ret

; =========================================
; EXTRACT_CMD
; Copy chars from BUF[row*COLS+2 .. row*COLS+col-1] into SCRATCH
; Null terminate. Skips leading spaces.
; =========================================
extract_cmd:
    PUSH r31
    LDI r0, 1

    ; Compute base = row * COLS
    LDI r20, CUR_ROW
    LOAD r15, r20          ; r15 = row
    LDI r7, COLS
    MUL r15, r7            ; r15 = row * COLS

    ; Source starts at col 2 (skip "$ ")
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS
    ADD r20, r0
    ADD r20, r0           ; r20 = BUF + row*COLS + 2

    ; Destination
    LDI r21, SCRATCH

    ; Get end position (cursor col)
    LDI r20, CUR_COL
    LOAD r7, r20          ; r7 = cursor col

    ; Recompute source pointer
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS
    ADD r20, r0
    ADD r20, r0           ; r20 = BUF + row*COLS + 2

    ; Copy loop: copy chars from col 2 to cursor col
    LDI r22, 2            ; current column index
ec_loop:
    ; If col_index >= cursor_col, done
    CMP r22, r7
    BGE r1, ec_done

    ; Load char from source
    LOAD r1, r20
    ; Store to scratch
    STORE r21, r1

    ADD r20, r0           ; advance source
    ADD r21, r0           ; advance dest
    ADD r22, r0           ; col++
    JMP ec_loop

ec_done:
    ; Null terminate
    LDI r1, 0
    STORE r21, r1

    POP r31
    RET

; =========================================
; DISPATCH_CMD
; Match SCRATCH against builtin commands.
; If match found, write output to current row and newline.
; If no match and input not empty, write "?" and newline.
; =========================================
dispatch_cmd:
    PUSH r31
    LDI r0, 1

    ; --- Try "clear" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r1, try_help
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_help
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_help
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_help
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r1, try_help
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null terminator
    JNZ r1, try_help
    ; MATCH: clear
    JMP cmd_clear

try_help:
    ; --- Try "help" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r1, try_ver
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_ver
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_ver
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r1, try_ver
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_ver
    ; MATCH: help
    JMP cmd_help

try_ver:
    ; --- Try "ver" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 118        ; 'v'
    JNZ r1, try_hi
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_hi
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r1, try_hi
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_hi
    ; MATCH: ver
    JMP cmd_ver

try_hi:
    ; --- Try "hi" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r1, try_echo
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_echo
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_echo
    ; MATCH: hi
    JMP cmd_hi

try_echo:
    ; --- Try "echo " (5 chars: e,c,h,o,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_ls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r1, try_ls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r1, try_ls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r1, try_ls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after echo)
    JNZ r1, try_ls
    JMP cmd_echo

try_ls:
    ; --- Try "ls" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_date
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r1, try_date
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_date
    JMP cmd_ls

try_date:
    ; --- Try "date" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r1, try_cls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_cls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r1, try_cls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_cls
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_cls
    JMP cmd_date

try_cls:
    ; --- Try "cls" (alias for clear) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r1, try_cat
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_cat
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r1, try_cat
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_cat
    JMP cmd_clear

try_cat:
    ; --- Try "cat " (4 chars: c,a,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r1, try_sys
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_sys
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r1, try_sys
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after cat)
    JNZ r1, try_sys
    JMP cmd_cat

try_sys:
    ; --- Try "sys" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r1, try_colors
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 121        ; 'y'
    JNZ r1, try_colors
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r1, try_colors
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_colors
    JMP cmd_sys

try_colors:
    ; --- Try "colors" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r1, try_whoami
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_whoami
    JMP cmd_colors

try_whoami:
    ; --- Try "whoami" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 119        ; 'w'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_uname
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_uname
    JMP cmd_whoami

try_uname:
    ; --- Try "uname" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r1, try_uptime
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r1, try_uptime
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_uptime
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r1, try_uptime
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_uptime
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_uptime
    JMP cmd_uname

try_uptime:
    ; --- Try "uptime" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_unknown
    JMP cmd_uptime

try_run:
    ; --- Try "run " (4 chars: r,u,n,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after run)
    JNZ r1, try_quit
    JMP cmd_run

try_edit:
    ; --- Try "edit " (5 chars: e,d,i,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_build
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r1, try_build
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_build
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r1, try_build
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after edit)
    JNZ r1, try_build
    JMP cmd_edit

try_build:
    ; --- Try "build " (6 chars: b,u,i,l,d,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 98         ; 'b'
    JNZ r1, try_reload
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r1, try_reload
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_reload
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_reload
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r1, try_reload
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after build)
    JNZ r1, try_reload
    JMP cmd_build

try_reload:
    ; --- Try "reload" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r1, try_quit
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_quit
    JMP cmd_reload

try_quit:
    ; --- Try "quit" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 113        ; 'q'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r1, try_unknown
    ADD r20, r0
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r1, try_unknown
    ; MATCH: quit
    JMP cmd_quit

try_unknown:
    ; Check if input is empty (first char is null)
    LDI r20, SCRATCH
    LOAD r22, r20
    JZ r22, dc_ret       ; empty input, no output

    ; Unknown command: write "? <cmd>"
    CALL write_unknown
    JMP dc_ret

; =========================================
; COMMANDS
; =========================================

cmd_clear:
    ; Clear the text buffer to spaces, reset cursor to row 0, col 2
    LDI r0, 1
    LDI r20, BUF
    LDI r15, 32
cc_clear:
    STORE r20, r15
    ADD r20, r0
    CMPI r20, BUF_END
    BLT r1, cc_clear

    ; Reset cursor to row 0, col 2
    LDI r20, CUR_ROW
    LDI r1, 0
    STORE r20, r1
    LDI r20, CUR_COL
    LDI r1, 2
    STORE r20, r1

    ; Write prompt on row 0
    LDI r20, BUF
    LDI r1, 36           ; '$'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32           ; ' '
    STORE r20, r1

    JMP dc_ret

cmd_help:
    ; Write "cmds: clear help ver hi" to current row
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "cmds: clear cls help ver hi echo ls date cat"
    CALL do_newline
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "      sys colors whoami uname uptime run quit"
    CALL do_newline
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "      edit <file> build <file> reload"
    CALL do_newline
    JMP dc_ret

cmd_ver:
    ; Write "GeoTerm v1.0" to current row
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeoTerm v2.0"
    CALL do_newline
    JMP dc_ret

cmd_hi:
    ; Write "hello!" to current row
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "hello!"
    CALL do_newline
    JMP dc_ret

cmd_echo:
    ; Write args (SCRATCH+5 onward, after "echo ") to current row
    PUSH r31
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS

    ; Source is SCRATCH+5 (skip "echo ")
    LDI r21, SCRATCH
    ADD r21, r0           ; +1
    ADD r21, r0           ; +2
    ADD r21, r0           ; +3
    ADD r21, r0           ; +4
    ADD r21, r0           ; +5

echo_loop:
    LOAD r1, r21
    JZ r1, echo_done
    STORE r20, r1
    ADD r20, r0
    ADD r21, r0
    JMP echo_loop

echo_done:
    CALL do_newline
    POP r31
    RET

cmd_ls:
    ; List VFS directory using LS opcode
    PUSH r31
    LDI r0, 1
    LDI r20, 0x5100       ; LS output buffer
    LS r20                ; list files, count in r1
    CMPI r1, 0
    JZ r1, ls_empty

    ; Read entries from buffer, write one per row
    LDI r21, 0x5100
ls_next:
    LOAD r1, r21
    JZ r1, ls_done        ; end of entries

    ; Write entry to current row
    LDI r22, CUR_ROW
    LOAD r15, r22
    LDI r7, COLS
    MUL r15, r7
    LDI r23, BUF
    ADD r23, r15

    ; Copy string from r21 to r23
ls_copy:
    LOAD r1, r21
    JZ r1, ls_copied
    STORE r23, r1
    ADD r21, r0
    ADD r23, r0
    JMP ls_copy

ls_copied:
    ADD r21, r0           ; skip null terminator
    CALL do_newline
    JMP ls_next

ls_empty:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(empty)"
    CALL do_newline
    POP r31
    RET

ls_done:
    POP r31
    RET

cmd_date:
    ; Display date string
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "2026-04-20"
    CALL do_newline
    JMP dc_ret

write_unknown:
    ; Write "? " followed by the command text from SCRATCH to current row
    PUSH r31
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS (destination)

    ; Write "? "
    LDI r1, 63            ; '?'
    STORE r20, r1
    ADD r20, r0
    LDI r1, 32            ; ' '
    STORE r20, r1
    ADD r20, r0

    ; Copy SCRATCH to rest of row
    LDI r21, SCRATCH
wu_loop:
    LOAD r1, r21
    JZ r1, wu_done
    STORE r20, r1
    ADD r20, r0
    ADD r21, r0
    JMP wu_loop

wu_done:
    CALL do_newline
    POP r31
    RET

; =========================================
; CAT command -- read VFS file and display
; Uses OPEN/READ/CLOSE opcodes
; File path is in SCRATCH+4 (after "cat ")
; =========================================
cmd_cat:
    PUSH r31
    LDI r0, 1

    ; Build filename address: SCRATCH+4 points to filename
    LDI r21, SCRATCH
    ADD r21, r0
    ADD r21, r0
    ADD r21, r0
    ADD r21, r0           ; r21 = SCRATCH+4 (filename)

    ; OPEN filename (r21), flags=0 (read), mode=0
    ; OPEN takes (path_reg, flags_reg, mode_reg)
    LDI r20, 0
    OPEN r21, r20, r20
    ; fd returned in r1
    MOV r18, r1           ; r18 = fd
    CMPI r1, 0xFFFFFFFF
    JNZ r1, cat_read      ; if not -1, file opened OK

    ; Error: file not found
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(file not found)"
    CALL do_newline
    POP r31
    RET

cat_read:
    ; Read file content into buffer at 0x5200
    ; READ fd(r18), buf(r22=0x5200), len(r23=200)
    LDI r22, 0x5200       ; CAT_BUF
    LDI r23, 200          ; max words to read
    READ r18, r22, r23
    ; r1 = bytes read (0 = EOF, 0xFFFFFFFF = error)
    CMPI r1, 0
    JZ r1, cat_close      ; EOF or empty
    CMPI r1, 0xFFFFFFFF
    JNZ r1, cat_close     ; error

    ; Write chars from buffer until null or 200 chars
    LDI r22, 0x5200
    LDI r24, 0            ; word counter
cat_write_loop:
    CMPI r24, 200
    BGE r1, cat_close
    LOAD r1, r22
    JZ r1, cat_close      ; null terminator
    ; Write char to current terminal row
    CALL cat_write_char
    ADD r22, r0
    ADD r24, r0
    JMP cat_write_loop

cat_close:
    CLOSE r18
    POP r31
    RET

cat_write_char:
    ; Write r1 (char) at current cursor position in buffer
    ; Advance cursor, handle line wrapping via do_newline
    PUSH r31
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r7, COLS
    MUL r8, r7
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r8, r3
    LDI r20, BUF
    ADD r20, r8
    STORE r20, r1

    ; Advance cursor col
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r3, r0
    CMPI r3, COLS
    JNZ r1, cwc_done      ; branch if not equal (r1 = CMPI result)
    CALL do_newline
    JMP cwc_ret
cwc_done:
    LDI r20, CUR_COL
    STORE r20, r3
cwc_ret:
    POP r31
    RET

; =========================================
; SYS command -- show system info
; =========================================
cmd_sys:
    LDI r0, 1
    ; Line 1: "Geometry OS v2.0"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Geometry OS v2.0"
    CALL do_newline
    ; Line 2: "Opcodes: 113"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Opcodes: 113  Programs: 72"
    CALL do_newline
    ; Line 3: "Tests: 1795"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Tests: 1795  Canvas: 256x256"
    CALL do_newline
    JMP dc_ret

; =========================================
; COLORS command -- display color swatches
; Draws colored rectangles on the canvas
; =========================================
cmd_colors:
    LDI r0, 1
    ; Row 1 label
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Color swatches drawn:"
    CALL do_newline
    ; Draw 6 color swatches across the screen
    ; Red
    LDI r0, 0
    LDI r8, 0
    LDI r3, 42
    LDI r13, 42
    LDI r12, 0xFF0000
    RECTF r0, r8, r3, r13, r12
    ; Green
    LDI r0, 43
    LDI r12, 0x00FF00
    RECTF r0, r8, r3, r13, r12
    ; Blue
    LDI r0, 86
    LDI r12, 0x0000FF
    RECTF r0, r8, r3, r13, r12
    ; Yellow
    LDI r0, 129
    LDI r12, 0xFFFF00
    RECTF r0, r8, r3, r13, r12
    ; Cyan
    LDI r0, 172
    LDI r12, 0x00FFFF
    RECTF r0, r8, r3, r13, r12
    ; Magenta
    LDI r0, 215
    LDI r3, 41
    LDI r12, 0xFF00FF
    RECTF r0, r8, r3, r13, r12
    JMP dc_ret

; =========================================
; WHOAMI command
; =========================================
cmd_whoami:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeoOS User"
    CALL do_newline
    JMP dc_ret

; =========================================
; UNAME command
; =========================================
cmd_uname:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeometryOS 2.0 rv32imac"
    CALL do_newline
    JMP dc_ret

; =========================================
; UPTIME command -- show frame count as uptime
; =========================================
cmd_uptime:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "uptime: "
    ; Blink counter doubles as a rough tick counter
    ; Show the value at BLINK address as a simple number
    LDI r20, BLINK
    LOAD r1, r20
    ; Write a few digits (just show raw value is too complex)
    ; Instead just show "running" indicator
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0           ; advance past "uptime: "
    STRO r20, "running"
    CALL do_newline
    JMP dc_ret

; =========================================
; RUN command -- execute an external program
; Argument: filename after "run " in SCRATCH+4
; Uses EXEC (0x66) + WAITPID (0x69) opcodes
; =========================================
cmd_run:
    PUSH r31
    LDI r0, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+4
    LDI r21, SCRATCH
    ADD r21, r0       ; +1
    ADD r21, r0       ; +2
    ADD r21, r0       ; +3
    ADD r21, r0       ; +4 = SCRATCH+4 (start of filename)
    LDI r22, 0x5300   ; dest buffer
run_copy:
    LOAD r1, r21
    STORE r22, r1
    ADD r21, r0
    ADD r22, r0
    JZ r1, run_exec   ; stop at null terminator

run_exec:
    ; EXEC takes a register pointing to the filename
    LDI r0, 0x5300
    EXEC r0            ; r1 = PID or 0xFFFFFFFF on error
    CMPI r1, 0xFFFFFFFF
    JZ r1, run_err

    ; Save PID
    MOV r8, r1

run_wait:
    WAITPID r8         ; r1 = 0 still running, 1 done
    JZ r1, run_wait

    ; Child done -- print "done" and return to prompt
    ; Redraw prompt area
    CALL do_newline
    POP r31
    JMP dc_ret

run_err:
    ; Print error message
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(program not found)"
    CALL do_newline
    POP r31
    JMP dc_ret

; =========================================
; EDIT command -- open a file in the canvas editor
; Argument: filename after "edit " in SCRATCH+5
; Signals host via HOTRELOAD_PORT (0xFF5 = 1, 0xFF6 = path addr)
; =========================================
cmd_edit:
    PUSH r31
    LDI r0, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+5
    LDI r21, SCRATCH
    ADD r21, r0       ; +1
    ADD r21, r0       ; +2
    ADD r21, r0       ; +3
    ADD r21, r0       ; +4
    ADD r21, r0       ; +5 = SCRATCH+5 (start of filename)
    LDI r22, 0x5300   ; dest buffer
edit_copy:
    LOAD r1, r21
    STORE r22, r1
    ADD r21, r0
    ADD r22, r0
    JZ r1, edit_fire   ; stop at null terminator

edit_fire:
    ; Check if filename is empty
    LDI r20, 0x5300
    LOAD r1, r20
    JZ r1, edit_err

    ; Write path address to HOTRELOAD_PATH_PORT (0xFF6)
    LDI r20, 0xFF6
    LDI r1, 0x5300
    STORE r20, r1

    ; Write verb 1 (edit) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r1, 1
    STORE r20, r1

    ; Print message and halt -- host will take over
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "opening editor..."
    CALL do_newline
    HALT

edit_err:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(usage: edit <filename>)"
    CALL do_newline
    POP r31
    JMP dc_ret

; =========================================
; BUILD command -- assemble a file from VFS
; Argument: filename after "build " in SCRATCH+6
; Uses OPEN/READ to get source, then ASM (0x4B) opcode
; =========================================
cmd_build:
    PUSH r31
    LDI r0, 1

    ; Build "programs/<filename>.asm" path at 0x5300
    ; First write "programs/" prefix
    LDI r22, 0x5300
    LDI r1, 112        ; 'p'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 114        ; 'r'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 111        ; 'o'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 103        ; 'g'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 114        ; 'r'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 97         ; 'a'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 109        ; 'm'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 115        ; 's'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 47         ; '/'
    STORE r22, r1
    ADD r22, r0        ; r22 = 0x5309, pointing after "programs/"

    ; Copy filename from SCRATCH+6
    LDI r21, SCRATCH
    ADD r21, r0       ; +1
    ADD r21, r0       ; +2
    ADD r21, r0       ; +3
    ADD r21, r0       ; +4
    ADD r21, r0       ; +5
    ADD r21, r0       ; +6 = SCRATCH+6 (start of filename)

build_copy:
    LOAD r1, r21
    STORE r22, r1
    ADD r21, r0
    ADD r22, r0
    JZ r1, build_open   ; stop at null

build_open:
    ; Append ".asm" extension
    LDI r1, 46         ; '.'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 97         ; 'a'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 115        ; 's'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 109        ; 'm'
    STORE r22, r1
    ADD r22, r0
    LDI r1, 0          ; null terminator
    STORE r22, r1

    ; Now OPEN the file at path 0x5300
    LDI r21, 0x5300
    LDI r20, 0
    OPEN r21, r20, r20  ; fd in r1
    MOV r18, r1         ; r18 = fd
    CMPI r1, 0xFFFFFFFF
    JZ r1, build_fopen_err

    ; READ source into buffer at 0x8000
    ; VFS READ returns u32 words, low byte = char
    LDI r22, 0x8000     ; source buffer
    LDI r23, 4096       ; max words to read (plenty for any .asm)
    READ r18, r22, r23  ; r1 = bytes read
    MOV r19, r1         ; r19 = bytes read

    ; CLOSE the file
    LDI r20, 0
    CLOSE r18

    ; Check if we read anything
    CMPI r19, 0
    JZ r1, build_empty

    ; Convert u32 VFS words to packed byte string at 0x9000
    ; Each VFS word has the character in the low byte
    LDI r21, 0x8000     ; source (VFS words)
    LDI r22, 0x9000     ; dest (packed bytes)
    MOV r24, r19        ; counter
build_pack:
    CMPI r24, 0
    JZ r1, build_asm
    LOAD r1, r21
    STORE r22, r1       ; store the word (low byte has the char)
    ADD r21, r0
    ADD r22, r0
    SUB r24, r0
    JMP build_pack

build_asm:
    ; Null-terminate the source string
    LDI r1, 0
    STORE r22, r1

    ; Call ASM opcode (0x4B): ASM src_reg, dest_reg
    LDI r0, 0x9000      ; source address
    LDI r8, 0xC000      ; dest address for bytecode
    ASM r0, r8

    ; Check result at RAM[0xFFD]
    LDI r20, 0xFFD
    LOAD r1, r20
    CMPI r1, 0xFFFFFFFF
    JZ r1, build_err

    ; Success: print "ok: N words"
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "ok: "
    ; We'd need int-to-string to show the word count.
    ; For now just say "ok" -- the word count is in RAM[0xFFD]
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    ADD r20, r0
    STRO r20, "assembled"
    CALL do_newline
    POP r31
    JMP dc_ret

build_err:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(build error)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_fopen_err:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(file not found)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_empty:
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(file is empty)"
    CALL do_newline
    POP r31
    JMP dc_ret

; =========================================
; RELOAD command -- reassemble terminal from disk and restart
; Signals host via HOTRELOAD_PORT (0xFF5 = 2)
; =========================================
cmd_reload:
    PUSH r31

    ; Print "reloading..." then signal host
    LDI r0, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "reloading..."
    CALL do_newline

    ; Write verb 2 (reload) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r1, 2
    STORE r20, r1

    ; Halt -- host will reassemble terminal.asm and restart
    HALT

; =========================================
; QUIT command -- halt the terminal
; =========================================
cmd_quit:
    HALT

dc_ret:
    POP r31
    RET

; =========================================
; DO_BACKSPACE
; =========================================
do_backspace:
    LDI r20, CUR_COL
    LOAD r1, r20
    JZ r1, hk_ret
    SUB r1, r0
    STORE r20, r1
    ; Clear char
    LDI r20, CUR_ROW
    LOAD r8, r20
    LDI r3, COLS
    MUL r8, r3
    LDI r20, CUR_COL
    LOAD r1, r20
    ADD r8, r1
    LDI r20, BUF
    ADD r20, r8
    LDI r1, 32
    STORE r20, r1
    JMP hk_ret

do_newline:
    LDI r0, 1
    LDI r20, CUR_COL
    LDI r1, 0
    STORE r20, r1
    LDI r20, CUR_ROW
    LOAD r15, r20          ; r15 = current row
    ADD r15, r0            ; r15 = new row
    CMPI r15, ROWS
    BLT r1, dn_store      ; branch if new row < ROWS (r1 = CMPI result)
    PUSH r31              ; save return address across scroll call
    CALL scroll_up
    POP r31               ; restore return address
    LDI r20, CUR_ROW      ; reload after scroll clobbers r20
    LDI r15, 29            ; clamp to last row
dn_store:
    STORE r20, r15
    RET

; =========================================
; SCROLL_UP
; Shift all text rows up by 1, clear last row
; =========================================
scroll_up:
    PUSH r31
    LDI r0, 1
    LDI r14, 0            ; row counter
scroll_loop:
    CMPI r14, 29
    BGE r1, scroll_clear

    ; Source ptr: BUF + (row+1)*COLS
    LDI r20, BUF
    LDI r1, 0
    ADD r1, r14
    ADD r1, r0
    LDI r10, COLS
    MUL r1, r10
    ADD r20, r1

    ; Dest ptr: BUF + row*COLS
    LDI r21, BUF
    LDI r1, 0
    ADD r1, r14
    LDI r10, COLS
    MUL r1, r10
    ADD r21, r1

    ; Copy COLS words
    LDI r22, 0
scroll_copy:
    LOAD r1, r20
    STORE r21, r1
    ADD r20, r0
    ADD r21, r0
    ADD r22, r0
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r14, r0
    JMP scroll_loop

scroll_clear:
    ; Clear last row (row 29) to spaces
    LDI r20, BUF
    LDI r15, 29
    LDI r10, COLS
    MUL r15, r10
    ADD r20, r15           ; r20 = BUF + 29*42
    LDI r15, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r15
    ADD r20, r0
    ADD r22, r0
    CMPI r22, COLS
    BLT r1, scroll_clr_loop

    POP r31
    RET

hk_ret:
    POP r31
    RET
