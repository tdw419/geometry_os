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
LDI r4, 1
LDI r30, 0xFD00   ; Initialize stack pointer (r30=SP) to high RAM

; Clear screen
LDI r0, 0x0C0C0C
FILL r0

; Clear text buffer to spaces
LDI r20, BUF
LDI r15, 32
clear_buf:
    STORE r20, r15
    ADD r20, r4
    CMPI r20, BUF_END
    BLT r0, clear_buf

; Init cursor and blink to 0
LDI r20, CUR_COL
LDI r0, 0
STORE r20, r0
LDI r20, CUR_ROW
STORE r20, r0
LDI r20, BLINK
STORE r20, r0

; Title bar
LDI r4, 0
LDI r11, 0
LDI r3, 256
LDI r6, 16
LDI r10, 0x333355
RECTF r4, r11, r3, r6, r10

; Title text "GeoTerm" -- use STRO + DRAWTEXT (green on dark title bar)
LDI r20, SCRATCH
STRO r20, "GeoTerm"
LDI r4, 4
LDI r11, 4
LDI r3, SCRATCH
LDI r6, 0x00FF00  ; fg = green
LDI r10, 0x333355  ; bg = match title bar
DRAWTEXT r4, r11, r3, r6, r10

; Close button hit region
LDI r4, 220
LDI r11, 0
LDI r3, 36
LDI r6, 16
HITSET r4, r11, r3, r6, 99

; Restore r4 = 1 before writing prompt!
LDI r4, 1

; Write prompt "$ " at buffer row 0
LDI r20, BUF
LDI r0, 36           ; '$'
STORE r20, r0
ADD r20, r4
LDI r0, 32           ; ' '
STORE r20, r0

; Set cursor to col 2
LDI r20, CUR_COL
LDI r0, 2
STORE r20, r0

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r4, 1

    ; Blink counter
    LDI r20, BLINK
    LOAD r0, r20
    ADD r0, r4
    STORE r20, r0

    ; Render
    CALL render

    FRAME

    ; Read key
    IKEY r10
    JZ r10, main_loop

    ; Handle key
    CALL handle_key
    JMP main_loop

; =========================================
; RENDER
; =========================================
render:
    PUSH r31
    LDI r4, 1

    ; Clear content area
    LDI r4, 0
    LDI r11, 16
    LDI r3, 256
    LDI r6, 240
    LDI r10, 0x0C0C0C
    RECTF r4, r11, r3, r6, r10

    ; Row loop
    LDI r4, 1
    LDI r5, 8            ; CHAR_H
    LDI r12, 6            ; CHAR_W
    LDI r7, 0           ; row counter
    LDI r2, BUF         ; buffer pointer
    LDI r1, 16          ; y = TITLE_H

render_row:
    ; Copy COLS chars from buffer to scratch
    LDI r16, SCRATCH
    LDI r17, 0
copy_col:
    LOAD r15, r2
    STORE r16, r15
    ADD r2, r4
    ADD r16, r4
    ADD r17, r4
    CMPI r17, COLS
    BLT r17, copy_col

    ; Null terminate
    LDI r0, 0
    STORE r16, r0

    ; DRAWTEXT x=0, y=r1, addr=SCRATCH, fg=white, bg=0 (transparent)
    LDI r4, 0
    LDI r13, SCRATCH
    LDI r14, 0xCCCCCC  ; fg = light gray
    LDI r9, 0         ; bg = transparent
    DRAWTEXT r4, r1, r13, r14, r9

    LDI r4, 1

    ADD r1, r5          ; y += 8
    ADD r7, r4          ; row++
    CMPI r7, ROWS
    BLT r7, render_row

    ; Cursor (blink)
    LDI r20, BLINK
    LOAD r0, r20
    LDI r8, 8
    AND r0, r8
    CMPI r0, 4
    BLT r0, draw_cursor
    JMP cursor_done

draw_cursor:
    LDI r20, CUR_COL
    LOAD r0, r20
    MUL r0, r12           ; x = col * 6
    LDI r20, CUR_ROW
    LOAD r11, r20
    MUL r11, r5           ; row * 8
    LDI r3, 16
    ADD r11, r3           ; y = 16 + row*8
    LDI r3, 6
    LDI r6, 8
    LDI r10, 0x44FF44
    RECTF r0, r11, r3, r6, r10

cursor_done:
    POP r31
    RET

; =========================================
; HANDLE_KEY
; r10 = key
; =========================================
handle_key:
    PUSH r31
    LDI r4, 1

    CMPI r10, 13
    JNZ r0, check_bs
    JMP do_enter

check_bs:
    CMPI r10, 8
    JNZ r0, check_del
    JMP do_backspace

check_del:
    CMPI r10, 127
    JNZ r0, do_char
    JMP do_backspace

do_char:
    ; buf[row*COLS + col] = key
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r3, COLS
    MUL r11, r3           ; r11 = row * COLS
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r11, r0           ; r11 = row*COLS + col
    LDI r20, BUF
    ADD r20, r11          ; r20 = BUF + offset
    STORE r20, r10        ; write char

    ; col++
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r0, r4
    STORE r20, r0

    ; If col >= COLS, wrap
    CMPI r0, COLS
    JNZ r0, hk_ret
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
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r3, COLS
    MUL r11, r3
    LDI r20, BUF
    ADD r20, r11
    LDI r0, 36           ; '$'
    STORE r20, r0
    ADD r20, r4
    LDI r0, 32           ; ' '
    STORE r20, r0
    LDI r20, CUR_COL
    LDI r0, 2
    STORE r20, r0
    JMP hk_ret

; =========================================
; EXTRACT_CMD
; Copy chars from BUF[row*COLS+2 .. row*COLS+col-1] into SCRATCH
; Null terminate. Skips leading spaces.
; =========================================
extract_cmd:
    PUSH r31
    LDI r4, 1

    ; Compute base = row * COLS
    LDI r20, CUR_ROW
    LOAD r15, r20          ; r15 = row
    LDI r8, COLS
    MUL r15, r8            ; r15 = row * COLS

    ; Source starts at col 2 (skip "$ ")
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS
    ADD r20, r4
    ADD r20, r4           ; r20 = BUF + row*COLS + 2

    ; Destination
    LDI r21, SCRATCH

    ; Get end position (cursor col)
    LDI r20, CUR_COL
    LOAD r8, r20          ; r8 = cursor col

    ; Recompute source pointer
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS
    ADD r20, r4
    ADD r20, r4           ; r20 = BUF + row*COLS + 2

    ; Copy loop: copy chars from col 2 to cursor col
    LDI r22, 2            ; current column index
ec_loop:
    ; If col_index >= cursor_col, done
    CMP r22, r8
    BGE r0, ec_done

    ; Load char from source
    LOAD r0, r20
    ; Store to scratch
    STORE r21, r0

    ADD r20, r4           ; advance source
    ADD r21, r4           ; advance dest
    ADD r22, r4           ; col++
    JMP ec_loop

ec_done:
    ; Null terminate
    LDI r0, 0
    STORE r21, r0

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
    LDI r4, 1

    ; --- Try "clear" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_help
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_help
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_help
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_help
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_help
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null terminator
    JNZ r0, try_help
    ; MATCH: clear
    JMP cmd_clear

try_help:
    ; --- Try "help" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r0, try_ver
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_ver
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_ver
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r0, try_ver
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_ver
    ; MATCH: help
    JMP cmd_help

try_ver:
    ; --- Try "ver" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 118        ; 'v'
    JNZ r0, try_hi
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_hi
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_hi
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_hi
    ; MATCH: ver
    JMP cmd_ver

try_hi:
    ; --- Try "hi" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r0, try_echo
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_echo
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_echo
    ; MATCH: hi
    JMP cmd_hi

try_echo:
    ; --- Try "echo " (5 chars: e,c,h,o,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_ls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_ls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r0, try_ls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_ls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after echo)
    JNZ r0, try_ls
    JMP cmd_echo

try_ls:
    ; --- Try "ls" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_date
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_date
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_date
    JMP cmd_ls

try_date:
    ; --- Try "date" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r0, try_cls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_cls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_cls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_cls
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_cls
    JMP cmd_date

try_cls:
    ; --- Try "cls" (alias for clear) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_cat
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_cat
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_cat
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_cat
    JMP cmd_clear

try_cat:
    ; --- Try "cat " (4 chars: c,a,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_sys
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_sys
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_sys
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after cat)
    JNZ r0, try_sys
    JMP cmd_cat

try_sys:
    ; --- Try "sys" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_colors
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 121        ; 'y'
    JNZ r0, try_colors
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_colors
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_colors
    JMP cmd_sys

try_colors:
    ; --- Try "colors" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 99         ; 'c'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 115        ; 's'
    JNZ r0, try_whoami
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_whoami
    JMP cmd_colors

try_whoami:
    ; --- Try "whoami" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 119        ; 'w'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 104        ; 'h'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_uname
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_uname
    JMP cmd_whoami

try_uname:
    ; --- Try "uname" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_uptime
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r0, try_uptime
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_uptime
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r0, try_uptime
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_uptime
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_uptime
    JMP cmd_uname

try_uptime:
    ; --- Try "uptime" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 112        ; 'p'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 109        ; 'm'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_unknown
    JMP cmd_uptime

try_run:
    ; --- Try "run " (4 chars: r,u,n,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 110        ; 'n'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after run)
    JNZ r0, try_quit
    JMP cmd_run

try_edit:
    ; --- Try "edit " (5 chars: e,d,i,t,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_build
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r0, try_build
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_build
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_build
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after edit)
    JNZ r0, try_build
    JMP cmd_edit

try_build:
    ; --- Try "build " (6 chars: b,u,i,l,d,space) ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 98         ; 'b'
    JNZ r0, try_reload
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_reload
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_reload
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_reload
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r0, try_reload
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 32         ; ' ' (space after build)
    JNZ r0, try_reload
    JMP cmd_build

try_reload:
    ; --- Try "reload" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 114        ; 'r'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 101        ; 'e'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 108        ; 'l'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 111        ; 'o'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 97         ; 'a'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 100        ; 'd'
    JNZ r0, try_quit
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_quit
    JMP cmd_reload

try_quit:
    ; --- Try "quit" ---
    LDI r20, SCRATCH
    LOAD r22, r20
    CMPI r22, 113        ; 'q'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 117        ; 'u'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 105        ; 'i'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 116        ; 't'
    JNZ r0, try_unknown
    ADD r20, r4
    LOAD r22, r20
    CMPI r22, 0          ; null
    JNZ r0, try_unknown
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
    LDI r4, 1
    LDI r20, BUF
    LDI r15, 32
cc_clear:
    STORE r20, r15
    ADD r20, r4
    CMPI r20, BUF_END
    BLT r0, cc_clear

    ; Reset cursor to row 0, col 2
    LDI r20, CUR_ROW
    LDI r0, 0
    STORE r20, r0
    LDI r20, CUR_COL
    LDI r0, 2
    STORE r20, r0

    ; Write prompt on row 0
    LDI r20, BUF
    LDI r0, 36           ; '$'
    STORE r20, r0
    ADD r20, r4
    LDI r0, 32           ; ' '
    STORE r20, r0

    JMP dc_ret

cmd_help:
    ; Write "cmds: clear help ver hi" to current row
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "cmds: clear cls help ver hi echo ls date cat"
    CALL do_newline
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "      sys colors whoami uname uptime run quit"
    CALL do_newline
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "      edit <file> build <file> reload"
    CALL do_newline
    JMP dc_ret

cmd_ver:
    ; Write "GeoTerm v1.0" to current row
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeoTerm v2.0"
    CALL do_newline
    JMP dc_ret

cmd_hi:
    ; Write "hello!" to current row
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "hello!"
    CALL do_newline
    JMP dc_ret

cmd_echo:
    ; Write args (SCRATCH+5 onward, after "echo ") to current row
    PUSH r31
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS

    ; Source is SCRATCH+5 (skip "echo ")
    LDI r21, SCRATCH
    ADD r21, r4           ; +1
    ADD r21, r4           ; +2
    ADD r21, r4           ; +3
    ADD r21, r4           ; +4
    ADD r21, r4           ; +5

echo_loop:
    LOAD r0, r21
    JZ r0, echo_done
    STORE r20, r0
    ADD r20, r4
    ADD r21, r4
    JMP echo_loop

echo_done:
    CALL do_newline
    POP r31
    RET

cmd_ls:
    ; List VFS directory using LS opcode
    PUSH r31
    LDI r4, 1
    LDI r20, 0x5100       ; LS output buffer
    LS r20                ; list files, count in r0
    CMPI r0, 0
    JZ r0, ls_empty

    ; Read entries from buffer, write one per row
    LDI r21, 0x5100
ls_next:
    LOAD r0, r21
    JZ r0, ls_done        ; end of entries

    ; Write entry to current row
    LDI r22, CUR_ROW
    LOAD r15, r22
    LDI r8, COLS
    MUL r15, r8
    LDI r23, BUF
    ADD r23, r15

    ; Copy string from r21 to r23
ls_copy:
    LOAD r0, r21
    JZ r0, ls_copied
    STORE r23, r0
    ADD r21, r4
    ADD r23, r4
    JMP ls_copy

ls_copied:
    ADD r21, r4           ; skip null terminator
    CALL do_newline
    JMP ls_next

ls_empty:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "2026-04-20"
    CALL do_newline
    JMP dc_ret

write_unknown:
    ; Write "? " followed by the command text from SCRATCH to current row
    PUSH r31
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15           ; r20 = BUF + row*COLS (destination)

    ; Write "? "
    LDI r0, 63            ; '?'
    STORE r20, r0
    ADD r20, r4
    LDI r0, 32            ; ' '
    STORE r20, r0
    ADD r20, r4

    ; Copy SCRATCH to rest of row
    LDI r21, SCRATCH
wu_loop:
    LOAD r0, r21
    JZ r0, wu_done
    STORE r20, r0
    ADD r20, r4
    ADD r21, r4
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
    LDI r4, 1

    ; Build filename address: SCRATCH+4 points to filename
    LDI r21, SCRATCH
    ADD r21, r4
    ADD r21, r4
    ADD r21, r4
    ADD r21, r4           ; r21 = SCRATCH+4 (filename)

    ; OPEN filename (r21), flags=0 (read), mode=0
    ; OPEN takes (path_reg, flags_reg, mode_reg)
    LDI r20, 0
    OPEN r21, r20, r20
    ; fd returned in r0
    MOV r18, r0           ; r18 = fd
    CMPI r0, 0xFFFFFFFF
    JNZ r0, cat_read      ; if not -1, file opened OK

    ; Error: file not found
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    ; r0 = bytes read (0 = EOF, 0xFFFFFFFF = error)
    CMPI r0, 0
    JZ r0, cat_close      ; EOF or empty
    CMPI r0, 0xFFFFFFFF
    JNZ r0, cat_close     ; error

    ; Write chars from buffer until null or 200 chars
    LDI r22, 0x5200
    LDI r24, 0            ; word counter
cat_write_loop:
    CMPI r24, 200
    BGE r0, cat_close
    LOAD r0, r22
    JZ r0, cat_close      ; null terminator
    ; Write char to current terminal row
    CALL cat_write_char
    ADD r22, r4
    ADD r24, r4
    JMP cat_write_loop

cat_close:
    CLOSE r18
    POP r31
    RET

cat_write_char:
    ; Write r0 (char) at current cursor position in buffer
    ; Advance cursor, handle line wrapping via do_newline
    PUSH r31
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r8, COLS
    MUL r11, r8
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r11, r3
    LDI r20, BUF
    ADD r20, r11
    STORE r20, r0

    ; Advance cursor col
    LDI r20, CUR_COL
    LOAD r3, r20
    ADD r3, r4
    CMPI r3, COLS
    JNZ r0, cwc_done      ; branch if not equal (r0 = CMPI result)
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
    LDI r4, 1
    ; Line 1: "Geometry OS v2.0"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Geometry OS v2.0"
    CALL do_newline
    ; Line 2: "Opcodes: 113"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Opcodes: 113  Programs: 72"
    CALL do_newline
    ; Line 3: "Tests: 1795"
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    LDI r4, 1
    ; Row 1 label
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "Color swatches drawn:"
    CALL do_newline
    ; Draw 6 color swatches across the screen
    ; Red
    LDI r4, 0
    LDI r11, 0
    LDI r3, 42
    LDI r6, 42
    LDI r10, 0xFF0000
    RECTF r4, r11, r3, r6, r10
    ; Green
    LDI r4, 43
    LDI r10, 0x00FF00
    RECTF r4, r11, r3, r6, r10
    ; Blue
    LDI r4, 86
    LDI r10, 0x0000FF
    RECTF r4, r11, r3, r6, r10
    ; Yellow
    LDI r4, 129
    LDI r10, 0xFFFF00
    RECTF r4, r11, r3, r6, r10
    ; Cyan
    LDI r4, 172
    LDI r10, 0x00FFFF
    RECTF r4, r11, r3, r6, r10
    ; Magenta
    LDI r4, 215
    LDI r3, 41
    LDI r10, 0xFF00FF
    RECTF r4, r11, r3, r6, r10
    JMP dc_ret

; =========================================
; WHOAMI command
; =========================================
cmd_whoami:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeoOS User"
    CALL do_newline
    JMP dc_ret

; =========================================
; UNAME command
; =========================================
cmd_uname:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "GeometryOS 2.0 rv32imac"
    CALL do_newline
    JMP dc_ret

; =========================================
; UPTIME command -- show frame count as uptime
; =========================================
cmd_uptime:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "uptime: "
    ; Blink counter doubles as a rough tick counter
    ; Show the value at BLINK address as a simple number
    LDI r20, BLINK
    LOAD r0, r20
    ; Write a few digits (just show raw value is too complex)
    ; Instead just show "running" indicator
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4           ; advance past "uptime: "
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
    LDI r4, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+4
    LDI r21, SCRATCH
    ADD r21, r4       ; +1
    ADD r21, r4       ; +2
    ADD r21, r4       ; +3
    ADD r21, r4       ; +4 = SCRATCH+4 (start of filename)
    LDI r22, 0x5300   ; dest buffer
run_copy:
    LOAD r0, r21
    STORE r22, r0
    ADD r21, r4
    ADD r22, r4
    JZ r0, run_exec   ; stop at null terminator

run_exec:
    ; EXEC takes a register pointing to the filename
    LDI r4, 0x5300
    EXEC r4            ; r0 = PID or 0xFFFFFFFF on error
    CMPI r0, 0xFFFFFFFF
    JZ r0, run_err

    ; Save PID
    MOV r11, r0

run_wait:
    WAITPID r11         ; r0 = 0 still running, 1 done
    JZ r0, run_wait

    ; Child done -- print "done" and return to prompt
    ; Redraw prompt area
    CALL do_newline
    POP r31
    JMP dc_ret

run_err:
    ; Print error message
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    LDI r4, 1

    ; Build null-terminated filename at 0x5300 from SCRATCH+5
    LDI r21, SCRATCH
    ADD r21, r4       ; +1
    ADD r21, r4       ; +2
    ADD r21, r4       ; +3
    ADD r21, r4       ; +4
    ADD r21, r4       ; +5 = SCRATCH+5 (start of filename)
    LDI r22, 0x5300   ; dest buffer
edit_copy:
    LOAD r0, r21
    STORE r22, r0
    ADD r21, r4
    ADD r22, r4
    JZ r0, edit_fire   ; stop at null terminator

edit_fire:
    ; Check if filename is empty
    LDI r20, 0x5300
    LOAD r0, r20
    JZ r0, edit_err

    ; Write path address to HOTRELOAD_PATH_PORT (0xFF6)
    LDI r20, 0xFF6
    LDI r0, 0x5300
    STORE r20, r0

    ; Write verb 1 (edit) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r0, 1
    STORE r20, r0

    ; Print message and halt -- host will take over
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "opening editor..."
    CALL do_newline
    HALT

edit_err:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    LDI r4, 1

    ; Build "programs/<filename>.asm" path at 0x5300
    ; First write "programs/" prefix
    LDI r22, 0x5300
    LDI r0, 112        ; 'p'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 114        ; 'r'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 111        ; 'o'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 103        ; 'g'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 114        ; 'r'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 97         ; 'a'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 109        ; 'm'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 115        ; 's'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 47         ; '/'
    STORE r22, r0
    ADD r22, r4        ; r22 = 0x5309, pointing after "programs/"

    ; Copy filename from SCRATCH+6
    LDI r21, SCRATCH
    ADD r21, r4       ; +1
    ADD r21, r4       ; +2
    ADD r21, r4       ; +3
    ADD r21, r4       ; +4
    ADD r21, r4       ; +5
    ADD r21, r4       ; +6 = SCRATCH+6 (start of filename)

build_copy:
    LOAD r0, r21
    STORE r22, r0
    ADD r21, r4
    ADD r22, r4
    JZ r0, build_open   ; stop at null

build_open:
    ; Append ".asm" extension
    LDI r0, 46         ; '.'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 97         ; 'a'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 115        ; 's'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 109        ; 'm'
    STORE r22, r0
    ADD r22, r4
    LDI r0, 0          ; null terminator
    STORE r22, r0

    ; Now OPEN the file at path 0x5300
    LDI r21, 0x5300
    LDI r20, 0
    OPEN r21, r20, r20  ; fd in r0
    MOV r18, r0         ; r18 = fd
    CMPI r0, 0xFFFFFFFF
    JZ r0, build_fopen_err

    ; READ source into buffer at 0x8000
    ; VFS READ returns u32 words, low byte = char
    LDI r22, 0x8000     ; source buffer
    LDI r23, 4096       ; max words to read (plenty for any .asm)
    READ r18, r22, r23  ; r0 = bytes read
    MOV r19, r0         ; r19 = bytes read

    ; CLOSE the file
    LDI r20, 0
    CLOSE r18

    ; Check if we read anything
    CMPI r19, 0
    JZ r0, build_empty

    ; Convert u32 VFS words to packed byte string at 0x9000
    ; Each VFS word has the character in the low byte
    LDI r21, 0x8000     ; source (VFS words)
    LDI r22, 0x9000     ; dest (packed bytes)
    MOV r24, r19        ; counter
build_pack:
    CMPI r24, 0
    JZ r0, build_asm
    LOAD r0, r21
    STORE r22, r0       ; store the word (low byte has the char)
    ADD r21, r4
    ADD r22, r4
    SUB r24, r4
    JMP build_pack

build_asm:
    ; Null-terminate the source string
    LDI r0, 0
    STORE r22, r0

    ; Call ASM opcode (0x4B): ASM src_reg, dest_reg
    LDI r4, 0x9000      ; source address
    LDI r11, 0xC000      ; dest address for bytecode
    ASM r4, r11

    ; Check result at RAM[0xFFD]
    LDI r20, 0xFFD
    LOAD r0, r20
    CMPI r0, 0xFFFFFFFF
    JZ r0, build_err

    ; Success: print "ok: N words"
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "ok: "
    ; We'd need int-to-string to show the word count.
    ; For now just say "ok" -- the word count is in RAM[0xFFD]
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    ADD r20, r4
    STRO r20, "assembled"
    CALL do_newline
    POP r31
    JMP dc_ret

build_err:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(build error)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_fopen_err:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "(file not found)"
    CALL do_newline
    POP r31
    JMP dc_ret

build_empty:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
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
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    STRO r20, "reloading..."
    CALL do_newline

    ; Write verb 2 (reload) to HOTRELOAD_VERB_PORT (0xFF5)
    LDI r20, 0xFF5
    LDI r0, 2
    STORE r20, r0

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
    LOAD r0, r20
    JZ r0, hk_ret
    SUB r0, r4
    STORE r20, r0
    ; Clear char
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r3, COLS
    MUL r11, r3
    LDI r20, CUR_COL
    LOAD r0, r20
    ADD r11, r0
    LDI r20, BUF
    ADD r20, r11
    LDI r0, 32
    STORE r20, r0
    JMP hk_ret

do_newline:
    LDI r4, 1
    LDI r20, CUR_COL
    LDI r0, 0
    STORE r20, r0
    LDI r20, CUR_ROW
    LOAD r15, r20          ; r15 = current row
    ADD r15, r4            ; r15 = new row
    CMPI r15, ROWS
    BLT r0, dn_store      ; branch if new row < ROWS (r0 = CMPI result)
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
    LDI r4, 1
    LDI r7, 0            ; row counter
scroll_loop:
    CMPI r7, 29
    BGE r0, scroll_clear

    ; Source ptr: BUF + (row+1)*COLS
    LDI r20, BUF
    LDI r0, 0
    ADD r0, r7
    ADD r0, r4
    LDI r2, COLS
    MUL r0, r2
    ADD r20, r0

    ; Dest ptr: BUF + row*COLS
    LDI r21, BUF
    LDI r0, 0
    ADD r0, r7
    LDI r2, COLS
    MUL r0, r2
    ADD r21, r0

    ; Copy COLS words
    LDI r22, 0
scroll_copy:
    LOAD r0, r20
    STORE r21, r0
    ADD r20, r4
    ADD r21, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r22, scroll_copy

    ADD r7, r4
    JMP scroll_loop

scroll_clear:
    ; Clear last row (row 29) to spaces
    LDI r20, BUF
    LDI r15, 29
    LDI r2, COLS
    MUL r15, r2
    ADD r20, r15           ; r20 = BUF + 29*42
    LDI r15, 32
    LDI r22, 0
scroll_clr_loop:
    STORE r20, r15
    ADD r20, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r0, scroll_clr_loop

    POP r31
    RET

hk_ret:
    POP r31
    RET
