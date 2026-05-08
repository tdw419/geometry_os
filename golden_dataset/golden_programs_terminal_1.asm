; DESCRIPTION: This GeOS assembly code implements an interactive terminal for Geometry OS (v7 with self-hosting), providing a GUI-based interface with a text buffer and command-line functionality. It supports commands such as `clear`, `cls`, `help`, `ver`, `hi`, `echo`, `ls`, `date`, `cat`, `sys`, `colors`, `whoami`, `uname`, `uptime`, `run`, `quit`, `edit <file>`, `build <file>`, and `reload`. The terminal handles user input, command execution, rendering of text and graphics on a 42x30 character display, and includes features like auto-scrolling when the content exceeds 30 rows.

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
LDI r8, 1
LDI r30, 0xFD00   ; Initialize stack pointer (r30=SP) to high RAM

; Clear screen
LDI r5, 0x0C0C0C
FILL r5

; Clear text buffer to spaces
LDI r20, BUF
LDI r6, 32
clear_buf:
    STORE r20, r6
    ADD r20, r8
    CMPI r20, BUF_END
    BLT r5, clear_buf

; Init cursor and blink to 0
LDI r20, CUR_COL
LDI r5, 0
STORE r20, r5
LDI r20, CUR_ROW
STORE r20, r5
LDI r20, BLINK
STORE r20, r5

; Title bar
LDI r8, 0
LDI r9, 0
LDI r13, 256
LDI r2, 16
LDI r15, 0x333355
RECTF r8, r9, r13, r2, r15

; Title text "GeoTerm" -- use STRO + DRAWTEXT (green on dark title bar)
LDI r20, SCRATCH
STRO r20, "GeoTerm"
LDI r8, 4
LDI r9, 4
LDI r13, SCRATCH
LDI r2, 0x00FF00  ; fg = green
LDI r15, 0x333355  ; bg = match title bar
DRAWTEXT r8, r9, r13, r2, r15

; Close button hit region
LDI r8, 220
LDI r9, 0
LDI r13, 36
LDI r2, 16
HITSET r8, r9, r13, r2, 99

; Restore r8 = 1 before writing prompt!
LDI r8, 1

; Write prompt "$ " at buffer row 0
LDI r20, BUF
LDI r5, 36           ; '$'
STORE r20, r5
ADD r20, r8
LDI r5, 32           ; ' '
STORE r20, r5

; Set cursor to col 2
LDI r20, CUR_COL
LDI r5, 2
STORE r20, r5

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r8, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r15
    JZ r15, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r8, 1

    ; Clear content area
    LDI r8, 0
    LDI r9, 16
    LDI r13, 256
    LDI r2, 240
    LDI r15, 0x0C0C0C
    RECTF r8, r9, r13, r2, r15

    ; Row loop
    LDI r8, 1
    LDI r3, 8            ; CHAR_H
    LDI r1, 6            ; CHAR_W
    LDI r12, 0           ; row counter
    LDI r7, BUF         ; buffer pointer
    LDI r14, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to scratch
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r6, r7
    STORE r16, r6
    ADD r7, r8
    ADD r16, r8
    ADD r17, r8
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r5, 0
    STORE r16, r5

    ; DRAWTEXT x=0, y=r14, addr=SCRATCH, fg=white, bg=0 (transparent)
    LDI r8, 0
    LDI r0, SCRATCH
    LDI r11, 0xCCCCCC  ; fg = light gray
    LDI r10, 0         ; bg = transparent
    DRAWTEXT r8, r14, r0, r11, r10

    LDI r8, 1

    ADD r14, r3          ; y += 8
    ADD r12, r8          ; row++
    CMPI r12, ROWS
    BLT r12, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r5, r20
    LDI r4, 8
    AND r5, r4
    CMPI r5, 4
    BLT r5, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r5, r20
    MUL r5, r1           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r9, r20
    MUL r9, r3           ; row * 8
    LDI r13, 16
    ADD r9, r13           ; y = 16 + row*8
    LDI r13, 6
    LDI r2, 8
    LDI r15, 0x44FF44
    RECTF r5, r9, r13, r2, r15

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r15 = key
; =========================================
handle_key:
    PUSH r31
    LDI r8, 1

    CMPI r15, 13
    JNZ r5, check_bs
    JMP do_enter

check_bs:
    CMPI r15, 8
    JNZ r5, check_del
    JMP do_backspace

check_del:
    CMPI r15, 127
    JNZ r5, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r13, COLS
    MUL r9, r13           ; r9 = row * COLS
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r9, r5           ; r9 = row*COLS + col
    LDI r20, BUF
    ADD r20, r9          ; r20 = BUF + offset
    STORE r20, r15        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r5, r8
    STORE r20, r5

    ; If col >= COLS, wrap
    CMPI r5, COLS
    JNZ r5, hk_ret
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
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r13, COLS
    MUL r9, r13
    LDI r20, BUF
    ADD r20, r9
    LDI r5, 36           ; '$'
    STORE r20, r5
    ADD r20, r8
    LDI r5, 32           ; ' '
    STORE r20, r5
    LDI r20, CUR_COL
    LDI r5, 2
    STORE r20, r5
    JMP hk_ret

; =========================================
; EXTRACT_CMD
; Copy chars from BUF[row*COLS+2 .. row*COLS+col-1] into SCRATCH
; Null terminate. Skips leading spaces.
; =========================================
extract_cmd:
    PUSH r31
    LDI r8, 1

    ; Compute base = row * COLS
    LDI r20, CUR_ROW
    LOAD r6, r20          ; r6 = row
    LDI r4, COLS
    MUL r6, r4            ; r6 = row * COLS

    ; Source starts at col 2 (skip "$ ")
    LDI r20, BUF
    ADD r20, r6           ; r20 = BUF + row*COLS
    ADD r20, r8
    ADD r20, r8           ; r20 = BUF + row*COLS + 2

    ; Destination
    LDI r21, SCRATCH

    ; Get end position (cursor col)
    LDI r20, CUR_COL
    LOAD r4, r20          ; r4 = cursor col

    ; Recompute source pointer
    LDI r20, BUF
    ADD r20, r6           ; r20 = BUF + row*COLS
    ADD r20, r8
    ADD r20, r8           ; r20 = BUF + row*COLS + 2

    ; Copy loop: copy chars from col 2 to cursor col
    LDI r22, 2            ; current column index
ec_loop:
    ; If col_index >= cursor_col, done
    CMP r22, r4
    BGE r5, ec_done

    ; Load char from source
    LOAD r5, r20
    ; Store to scratch
    STORE r21, r5

    ADD r20, r8           ; advance source
    ADD r21, r8           ; advance dest
    ADD r22, r8           ; col++
    JMP ec_loop

ec_done:
    ; Null terminate
    LDI r5, 0
    STORE r21, r5

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
    LDI r8, 1

    ; --- Try "clear" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, try_help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, try_help
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null terminator
    JNZ r5, try_help
    ; MATCH: clear
    JMP cmd_clear

try_help:
    ; --- Try "help" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r5, try_ver
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_ver
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_ver
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r5, try_ver
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_ver
    ; MATCH: help
    JMP cmd_help

try_ver:
    ; --- Try "ver" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 118        ; 'v'
    JNZ r5, try_hi
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_hi
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, try_hi
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_hi
    ; MATCH: ver
    JMP cmd_ver

try_hi:
    ; --- Try "hi" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r5, try_echo
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_echo
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_echo
    ; MATCH: hi
    JMP cmd_hi

try_echo:
    ; --- Try "echo " (5 chars: e,c,h,o,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_ls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, try_ls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r5, try_ls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r5, try_ls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after echo)
    JNZ r5, try_ls
    JMP cmd_echo

try_ls:
    ; --- Try "ls" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_date
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r5, try_date
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_date
    JMP cmd_ls

try_date:
    ; --- Try "date" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r5, try_cls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_cls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r5, try_cls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_cls
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_cls
    JMP cmd_date

try_cls:
    ; --- Try "cls" (alias for clear) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, try_cat
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_cat
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r5, try_cat
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_cat
    JMP cmd_clear

try_cat:
    ; --- Try "cat " (4 chars: c,a,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, try_sys
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_sys
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r5, try_sys
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after cat)
    JNZ r5, try_sys
    JMP cmd_cat

try_sys:
    ; --- Try "sys" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r5, try_colors
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 121        ; 'y'
    JNZ r5, try_colors
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r5, try_colors
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_colors
    JMP cmd_sys

try_colors:
    ; --- Try "colors" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r5, try_whoami
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_whoami
    JMP cmd_colors

try_whoami:
    ; --- Try "whoami" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 119        ; 'w'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_uname
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_uname
    JMP cmd_whoami

try_uname:
    ; --- Try "uname" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r5, try_uptime
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r5, try_uptime
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_uptime
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r5, try_uptime
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_uptime
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_uptime
    JMP cmd_uname

try_uptime:
    ; --- Try "uptime" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_unknown
    JMP cmd_uptime

try_run:
    ; --- Try "run " (4 chars: r,u,n,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after run)
    JNZ r5, try_quit
    JMP cmd_run

try_edit:
    ; --- Try "edit " (5 chars: e,d,i,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_build
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r5, try_build
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_build
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r5, try_build
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after edit)
    JNZ r5, try_build
    JMP cmd_edit

try_build:
    ; --- Try "build " (6 chars: b,u,i,l,d,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 98         ; 'b'
    JNZ r5, try_reload
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r5, try_reload
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_reload
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_reload
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r5, try_reload
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after build)
    JNZ r5, try_reload
    JMP cmd_build

try_reload:
    ; --- Try "reload" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r5, try_quit
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_quit
    JMP cmd_reload

try_quit:
    ; --- Try "quit" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 113        ; 'q'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r5, try_unknown
    ADD r20, r8
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r5, try_unknown
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
    LDI r8, 1
    LDI r20, BUF
    LDI r6, 32
cc_clear:
    STORE r20, r6
    ADD r20, r8
    CMPI r20, BUF_END
    BLT r5, cc_clear

    ; Reset cursor to row 0, col 2
    LDI r20, CUR_ROW
    LDI r5, 0
    STORE r20, r5
    LDI r20, CUR_COL
    LDI r5, 2
    STORE r20, r5

    ; Write prompt on row 0
    LDI r20, BUF
    LDI r5, 36           ; '$'
    STORE r20, r5
    ADD r20, r8
    LDI r5, 32           ; ' '
    STORE r20, r5

    JMP dc_ret

cmd_help:
    ; Write "cmds: clear help ver hi" to current row
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "cmds: clear cls help ver hi echo ls date cat"
    CALL do_newline
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "      sys colors whoami uname uptime run quit"
    CALL do_newline
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "      edit <file> build <file> reload"
    CALL do_newline
    JMP dc_ret

cmd_ver:
    ; Write "GeoTerm v1.0" to current row
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "GeoTerm v2.0"
    CALL do_newline
    JMP dc_ret

cmd_hi:
    ; Write "hello!" to current row
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "hello!"
    CALL do_newline
    JMP dc_ret

cmd_echo:
    ; Write args (SCRATCH+5 onward, after "echo ") to current row
    PUSH r31
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6           ; r20 = BUF + row*COLS

    ; Source is SCRATCH+5 (skip "echo ")
    LDI r21, SCRATCH
    ADD r21, r8           ; +1
    ADD r21, r8           ; +2
    ADD r21, r8           ; +3
    ADD r21, r8           ; +4
    ADD r21, r8           ; +5

echo_loop:
    LOAD r5, r21
    JZ r5, echo_done
    STORE r20, r5
    ADD r20, r8
    ADD r21, r8
    JMP echo_loop

echo_done:
    CALL do_newline
    POP r31
    RET

cmd_ls:
    ; List VFS directory using LS opcode
    PUSH r31
    LDI r8, 1
    LDI r20, 0x5100       ; LS output buffer
    LS r20                ; list files, count in r5
    CMPI r5, 0
    JZ r5, ls_empty

    ; Read entries from buffer, write one per row
    LDI r21, 0x5100
ls_next:
    LOAD r5, r21
    JZ r5, ls_done        ; end of entries

    ; Write entry to current row
    LDI r22, CUR_ROW
    LOAD r6, r22
    LDI r4, COLS
    MUL r6, r4
    LDI r23, BUF
    ADD r23, r6

    ; Copy string from r21 to r23
ls_copy:
    LOAD r5, r21
    JZ r5, ls_copied
    STORE r23, r5
    ADD r21, r8
    ADD r23, r8
    JMP ls_copy

ls_copied:
    ADD r21, r8           ; skip null terminator
    CALL do_newline
    JMP ls_next

ls_empty:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "(empty)"
    CALL do_newline
    POP r31
    RET

ls_done:
    POP r31
    RET

cmd_date:
    ; Display date string
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "2026-04-20"
    CALL do_newline
    JMP dc_ret

write_unknown:
    ; Write "? " followed by the command text from SCRATCH to current row
    PUSH r31
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6           ; r20 = BUF + row*COLS (destination)

    ; Write "? "
    LDI r5, 63            ; '?'
    STORE r20, r5
    ADD r20, r8
    LDI r5, 32            ; ' '
    STORE r20, r5
    ADD r20, r8

    ; Copy SCRATCH to rest of row
    LDI r21, SCRATCH
wu_loop:
    LOAD r5, r21
    JZ r5, wu_done
    STORE r20, r5
    ADD r20, r8
    ADD r21, r8
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
    LDI r8, 1

    ; Build filename address: SCRATCH+4 points to filename
    LDI r21, SCRATCH
    ADD r21, r8
    ADD r21, r8
    ADD r21, r8
    ADD r21, r8           ; r21 = SCRATCH+4 (filename)

    ; OPEN filename (r21), flags=0 (read), mode=0
    ; OPEN takes (path_reg, flags_reg, mode_reg)
    LDI r20, 0
    OPEN r21, r20, r20
    ; fd returned in r5
    MOV r18, r5           ; r18 = fd
    CMPI r5, 0xFFFFFFFF
    JNZ r5, cat_read      ; if not -1, file opened OK

    ; Error: file not found
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
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
    ; r5 = bytes read (0 = EOF, 0xFFFFFFFF = error)
    CMPI r5, 0
    JZ r5, cat_close      ; EOF or empty
    CMPI r5, 0xFFFFFFFF
    JNZ r5, cat_close     ; error

    ; Write chars from buffer until null or 200 chars
    LDI r22, 0x5200
    LDI r24, 0            ; word counter
cat_write_loop:
    CMPI r24, 200
    BGE r5, cat_close
    LOAD r5, r22
    JZ r5, cat_close      ; null terminator
    ; Write char to current terminal row
    CALL cat_write_char
    ADD r22, r8
    ADD r24, r8
    JMP cat_write_loop

cat_close:
    CLOSE r18
    POP r31
    RET

cat_write_char:
    ; Write r5 (char) at current cursor position in buffer
    ; Advance cursor, handle line wrapping via do_newline
    PUSH r31
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r4, COLS
    MUL r9, r4
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r9, r13
    LDI r20, BUF
    ADD r20, r9
    STORE r20, r5

    ; Advance cursor col
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r13, r8
    CMPI r13, COLS
    JNZ r5, cwc_done      ; branch if not equal (r5 = CMPI result)
    CALL do_newline
    JMP cwc_ret
cwc_done:
    LDI r20, CUR_COL
    STORE r20, r13
cwc_ret:
    POP r31
    RET

; =========================================
; SYS command -- show system info
; =========================================
cmd_sys:
    LDI r8, 1
    ; Line 1: "Geometry OS v2.0"
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "Geometry OS v2.0"
    CALL do_newline
    ; Line 2: "Opcodes: 113"
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "Opcodes: 113  Programs: 72"
    CALL do_newline
    ; Line 3: "Tests: 1795"
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "Tests: 1795  Canvas: 256x256"
    CALL do_newline
    JMP dc_ret

; =========================================
; COLORS command -- display color swatches
; Draws colored rectangles on the canvas
; =========================================
cmd_colors:
    LDI r8, 1
    ; Row 1 label
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "Color swatches drawn:"
    CALL do_newline
    ; Draw 6 color swatches across the screen
    ; Red
    LDI r8, 0
    LDI r9, 0
    LDI r13, 42
    LDI r2, 42
    LDI r15, 0xFF0000
    RECTF r8, r9, r13, r2, r15
    ; Green
    LDI r8, 43
    LDI r15, 0x00FF00
    RECTF r8, r9, r13, r2, r15
    ; Blue
    LDI r8, 86
    LDI r15, 0x0000FF
    RECTF r8, r9, r13, r2, r15
    ; Yellow
    LDI r8, 129
    LDI r15, 0xFFFF00
    RECTF r8, r9, r13, r2, r15
    ; Cyan
    LDI r8, 172
    LDI r15, 0x00FFFF
    RECTF r8, r9, r13, r2, r15
    ; Magenta
    LDI r8, 215
    LDI r13, 41
    LDI r15, 0xFF00FF
    RECTF r8, r9, r13, r2, r15
    JMP dc_ret

; =========================================
; WHOAMI command
; =========================================
cmd_whoami:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "GeoOS User"
    CALL do_newline
    JMP dc_ret

; =========================================
; UNAME command
; =========================================
cmd_uname:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "GeometryOS 2.0 rv32imac"
    CALL do_newline
    JMP dc_ret

; =========================================
; UPTIME command -- show frame count as uptime
; =========================================
cmd_uptime:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "uptime: "
    ; Blink counter doubles as a rough tick counter
    ; Show the value at BLINK address as a simple number
    LDI r20, BLINK
    LOAD r5, r20
    ; Write a few digits (just show raw value is too complex)
    ; Instead just show "running" indicator
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8           ; advance past "uptime: "
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
    LDI r8, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+4
    LDI r21, SCRATCH
    ADD r21, r8       ; +1
    ADD r21, r8       ; +2
    ADD r21, r8       ; +3
    ADD r21, r8       ; +4 = SCRATCH+4 (start of filename)
    LDI r22, 0x5300   ; dest buffer
run_copy:
    LOAD r5, r21
    STORE r22, r5
    ADD r21, r8
    ADD r22, r8
    JZ r5, run_exec   ; stop at null terminator

run_exec:
    ; EXEC takes a register pointing to the filename
    LDI r8, 0x5300
    EXEC r8            ; r5 = PID or 0xFFFFFFFF on error
    CMPI r5, 0xFFFFFFFF
    JZ r5, run_err

    ; Save PID
    MOV r9, r5

run_wait:
    WAITPID r9         ; r5 = 0 still running, 1 done
    JZ r5, run_wait

    ; Child done -- print "done" and return to prompt
    ; Redraw prompt area
    CALL do_newline
    POP r31
    JMP dc_ret

run_err:
    ; Print error message
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
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
    LDI r8, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+5
    LDI r21, SCRATCH
    ADD r21, r8       ; +1
    ADD r21, r8       ; +2
    ADD r21, r8       ; +3
    ADD r21, r8       ; +4
    ADD r21, r8       ; +5 = SCRATCH+5 (start of filename)
    LDI r22, 0x5300   ; dest buffer
edit_copy:
    LOAD r5, r21
    STORE r22, r5
    ADD r21, r8
    ADD r22, r8
    JZ r5, edit_fire   ; stop at null terminator

edit_fire:
    ; Check if filename is empty
    LDI r20, 0x5300
    LOAD r5, r20
    JZ r5, edit_err

    ; Write path address to HOTRELOAD_PATH_PORT (0xFF6)
    LDI r20, 0xFF6
    LDI r5, 0x5300
    STORE r20, r5

    ; Write verb 1 (edit) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r5, 1
    STORE r20, r5

    ; Print message and halt -- host will take over
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "opening editor..."
    CALL do_newline
    HALT

edit_err:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
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
    LDI r8, 1

    ; Build "programs/<filename>.asm" path at 0x5300
    ; First write "programs/" prefix
    LDI r22, 0x5300
    LDI r5, 112        ; 'p'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 114        ; 'r'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 111        ; 'o'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 103        ; 'g'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 114        ; 'r'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 97         ; 'a'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 109        ; 'm'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 115        ; 's'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 47         ; '/'
    STORE r22, r5
    ADD r22, r8        ; r22 = 0x5309, pointing after "programs/"

    ; Copy filename from SCRATCH+6
    LDI r21, SCRATCH
    ADD r21, r8       ; +1
    ADD r21, r8       ; +2
    ADD r21, r8       ; +3
    ADD r21, r8       ; +4
    ADD r21, r8       ; +5
    ADD r21, r8       ; +6 = SCRATCH+6 (start of filename)

build_copy:
    LOAD r5, r21
    STORE r22, r5
    ADD r21, r8
    ADD r22, r8
    JZ r5, build_open   ; stop at null

build_open:
    ; Append ".asm" extension
    LDI r5, 46         ; '.'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 97         ; 'a'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 115        ; 's'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 109        ; 'm'
    STORE r22, r5
    ADD r22, r8
    LDI r5, 0          ; null terminator
    STORE r22, r5

    ; Now OPEN the file at path 0x5300
    LDI r21, 0x5300
    LDI r20, 0
    OPEN r21, r20, r20  ; fd in r5
    MOV r18, r5         ; r18 = fd
    CMPI r5, 0xFFFFFFFF
    JZ r5, build_fopen_err

    ; READ source into buffer at 0x8000
    ; VFS READ returns u32 words, low byte = char
    LDI r22, 0x8000     ; source buffer
    LDI r23, 4096       ; max words to read (plenty for any .asm)
    READ r18, r22, r23  ; r5 = bytes read
    MOV r19, r5         ; r19 = bytes read

    ; CLOSE the file
    LDI r20, 0
    CLOSE r18

    ; Check if we read anything
    CMPI r19, 0
    JZ r5, build_empty

    ; Convert u32 VFS words to packed byte string at 0x9000
    ; Each VFS word has the character in the low byte
    LDI r21, 0x8000     ; source (VFS words)
    LDI r22, 0x9000     ; dest (packed bytes)
    MOV r24, r19        ; counter
build_pack:
    CMPI r24, 0
    JZ r5, build_asm
    LOAD r5, r21
    STORE r22, r5       ; store the word (low byte has the char)
    ADD r21, r8
    ADD r22, r8
    SUB r24, r8
    JMP build_pack

build_asm:
    ; Null-terminate the source string
    LDI r5, 0
    STORE r22, r5

    ; Call ASM opcode (0x4B): ASM src_reg, dest_reg
    LDI r8, 0x9000      ; source address
    LDI r9, 0xC000      ; dest address for bytecode
    ASM r8, r9

    ; Check result at RAM[0xFFD]
    LDI r20, 0xFFD
    LOAD r5, r20
    CMPI r5, 0xFFFFFFFF
    JZ r5, build_err

    ; Success: print "ok: N words"
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "ok: "
    ; We'd need int-to-string to show the word count.
    ; For now just say "ok" -- the word count is in RAM[0xFFD]
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    ADD r20, r8
    STRO r20, "assembled"
    CALL do_newline
    POP r31
    JMP dc_ret

build_err:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "(build error)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_fopen_err:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "(file not found)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_empty:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
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
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r6, r20
    LDI r4, COLS
    MUL r6, r4
    LDI r20, BUF
    ADD r20, r6
    STRO r20, "reloading..."
    CALL do_newline

    ; Write verb 2 (reload) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r5, 2
    STORE r20, r5

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
    LOAD r5, r20
    JZ r5, hk_ret
    SUB r5, r8
    STORE r20, r5
    ; Clear char
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r13, COLS
    MUL r9, r13
    LDI r20, CUR_COL
    LOAD r5, r20
    ADD r9, r5
    LDI r20, BUF
    ADD r20, r9
    LDI r5, 32
    STORE r20, r5
    JMP hk_ret

do_newline:
    LDI r8, 1
    LDI r20, CUR_COL
    LDI r5, 0
    STORE r20, r5
    LDI r20, CUR_ROW
    LOAD r6, r20          ; r6 = current row
    ADD r6, r8            ; r6 = new row
    CMPI r6, ROWS
    BLT r5, dn_store      ; branch if new row < ROWS (r5 = CMPI result)
    PUSH r31              ; save return address across scroll call
    CALL scroll_up
    POP r31               ; restore return address
    LDI r20, CUR_ROW      ; reload after scroll clobbers r20
    LDI r6, 29            ; clamp to last row
dn_store:
    STORE r20, r6
    RET

; =========================================
; SCROLL_UP
; Shift all text rows up by 1, clear last row
; =========================================
scroll_up:
    PUSH r31
    LDI r8, 1
    LDI r12, 0            ; row counter
scroll_loop:
    CMPI r12, 29
    BGE r5, scroll_clear

    ; Source ptr: BUF + (row+1)*COLS
    LDI r20, BUF
    LDI r5, 0
    ADD r5, r12
    ADD r5, r8
    LDI r7, COLS
    MUL r5, r7
    ADD r20, r5

    ; Dest ptr: BUF + row*COLS
    LDI r21, BUF
    LDI r5, 0
    ADD r5, r12
    LDI r7, COLS
    MUL r5, r7
    ADD r21, r5

    ; Copy COLS words
    LDI r22, 0
scroll_copy:
    LOAD r5, r20
    STORE r21, r5
    ADD r20, r8
    ADD r21, r8
    ADD r22, r8
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r12, r8
    JMP scroll_loop

scroll_clear:
    ; Clear last row (row 29) to spaces
    LDI r20, BUF
    LDI r6, 29
    LDI r7, COLS
    MUL r6, r7
    ADD r20, r6           ; r20 = BUF + 29*42
    LDI r6, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r6
    ADD r20, r8
    ADD r22, r8
    CMPI r22, COLS
    BLT r5, scroll_clr_loop

    POP r31
    RET

hk_ret:
    POP r31
    RET
