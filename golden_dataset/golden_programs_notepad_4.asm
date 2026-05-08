; DESCRIPTION: Draw line: pos=the screen, color=colored, size=fixed size.

; notepad.asm -- Multi-line Text Editor for Geometry OS
;
; Proves: TEXT rendering, IKEY keyboard input, cursor management,
;         RECTF UI elements, RAM-based state, FRAME loop, HITSET.
;
; Features:
;   - Type text characters (printable ASCII 32-126)
;   - Backspace to delete characters
;   - Enter to insert new lines
;   - Arrow keys to navigate cursor (left/right/up/down)
;   - Line numbers on the left margin
;   - Title bar with "GeoPad" header
;   - Blinking cursor indicator
;   - Character and line count display
;
; RAM Layout:
;   0x4000-0x5AFF  Text buffer (48*32 = 1536 u32 cells, row-major)
;                   48 cols x 32 rows of editable text
;   0x6000         Cursor column (0-47)
;   0x6001         Cursor row (0-31)
;   0x6002         Total lines used (count of non-empty lines)
;   0x6003         Blink counter (for cursor blink)
;   0x6100-0x6130  Scratch buffer for rendering one line (48 chars + null)
;   0x6200-0x6230  Scratch buffer for line number text (4 chars + null)
;
; Key codes:
;   8  = Backspace
;   13 = Enter
;   37 = Left arrow
;   38 = Up arrow
;   39 = Right arrow
;   40 = Down arrow
;   32-126 = Printable ASCII
;
; Screen layout (256x256):
;   Row 0-15:    Title bar (dark blue background)
;   Row 16-255:  Text editing area (dark gray background)
;   Col 0-39:    Line numbers margin (darker gray)
;   Col 42-255:  Text area

#define COLS    36         ; editable columns per line
#define ROWS    30         ; visible text rows
#define BUF     0x4000     ; text buffer start
#define CUR_COL 0x6000     ; cursor column
#define CUR_ROW 0x6001     ; cursor row
#define LINES   0x6002     ; total lines count
#define BLINK   0x6003     ; blink counter
#define SCRATCH 0x6100     ; line render scratch
#define LNSCR   0x6200     ; line number scratch
#define CHAR_H  8          ; character height in pixels
#define CHAR_W  6          ; character width in pixels
#define TITLE_H 16         ; title bar height
#define MARGIN_W 42        ; line number margin width

; =========================================
; INIT
; =========================================
LDI r4, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r9, 32
LDI r7, COLS
LDI r14, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r9
    ADD r20, r4
    ADD r21, r4
    CMP r21, r7
    BLT r6, clear_buf_col
    ; next row
    SUB r14, r4
    JZ r14, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r12, 0
STORE r20, r12
LDI r20, CUR_ROW
STORE r20, r12

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r12, 1
STORE r20, r12

; Init blink counter
LDI r20, BLINK
STORE r20, r12

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r4, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r3
    JZ r3, main_loop

    ; Handle special keys
    CMPI r3, 8
    JZ r6, do_backspace
    CMPI r3, 13
    JZ r6, do_enter
    CMPI r3, 37
    JZ r6, do_left
    CMPI r3, 38
    JZ r6, do_up
    CMPI r3, 39
    JZ r6, do_right
    CMPI r3, 40
    JZ r6, do_down

    ; Printable character (32-126)?
    CMPI r3, 32
    BLT r6, main_loop
    CMPI r3, 127
    BGE r6, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r4, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r7, COLS
    MUL r9, r7
    LDI r20, CUR_COL
    LOAD r14, r20
    ADD r9, r14
    LDI r20, BUF
    ADD r20, r9

    ; Store the character
    STORE r20, r3

    ; Advance cursor column
    ADD r14, r4
    CMPI r14, COLS
    BLT r6, no_wrap
    ; Wrap to next line
    LDI r14, 0
    LDI r20, CUR_COL
    STORE r20, r14
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r9, r20
    ADD r9, r4
    CMPI r9, ROWS
    BLT r6, no_wrap_row_limit
    LDI r9, ROWS
    SUB r9, r4
no_wrap_row_limit:
    STORE r20, r9
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r14
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r4, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r9, r20
    LDI r20, CUR_ROW
    LOAD r7, r20

    ; If col > 0, just move back and clear
    CMPI r9, 0
    JZ r9, bs_at_line_start

    ; Move cursor left
    SUB r9, r4
    LDI r20, CUR_COL
    STORE r20, r9

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r7, 0
    JZ r7, bs_done

    ; Move to end of previous line
    SUB r7, r4
    LDI r20, CUR_ROW
    STORE r20, r7

    ; Find last non-space character on previous line
    LDI r14, COLS
    SUB r14, r4           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0
    ADD r9, r14
    LDI r20, BUF
    ADD r20, r9
    LOAD r8, r20        ; load char
    CMPI r8, 32
    JNZ r6, found_end   ; non-space = end of content
    CMPI r14, 0
    JZ r14, found_end     ; at col 0 = empty line
    SUB r14, r4
    JMP find_end

found_end:
    ADD r14, r4           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r14
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r4, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r20, CUR_COL
    LOAD r7, r20

    ; If at last row, don't advance
    LDI r14, ROWS
    SUB r14, r4
    CMP r9, r14
    BGE r6, enter_done

    ; Move to start of next row
    ADD r9, r4
    LDI r20, CUR_ROW
    STORE r20, r9

    ; Clear cursor column
    LDI r7, 0
    LDI r20, CUR_COL
    STORE r20, r7

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r0, COLS
    MUL r9, r0
    LDI r20, BUF
    ADD r20, r9
    LDI r21, 0
clear_new_line:
    LDI r8, 32
    STORE r20, r8
    ADD r20, r4
    ADD r21, r4
    CMPI r21, COLS
    BLT r6, clear_new_line

    ; Update lines count
    CALL update_lines
enter_done:
    JMP main_loop

; =========================================
; DO LEFT
; =========================================
do_left:
    LDI r4, 1
    LDI r20, CUR_COL
    LOAD r9, r20
    CMPI r9, 0
    JZ r9, left_done
    SUB r9, r4
    STORE r20, r9
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r4, 1
    LDI r20, CUR_COL
    LOAD r9, r20
    LDI r14, COLS
    SUB r14, r4
    CMP r9, r14
    BGE r6, right_done
    ADD r9, r4
    STORE r20, r9
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    CMPI r9, 0
    JZ r9, up_done
    SUB r9, r4
    STORE r20, r9
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r4, 1
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r14, ROWS
    SUB r14, r4
    CMP r9, r14
    BGE r6, down_done
    ADD r9, r4
    STORE r20, r9
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r4 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r9, r20
    LDI r7, COLS
    MUL r9, r7
    LDI r20, CUR_COL
    LOAD r14, r20
    ADD r9, r14
    LDI r20, BUF
    ADD r20, r9
    LDI r8, 32
    STORE r20, r8
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r4 = 1
    LDI r9, 0            ; count = 0
    LDI r7, ROWS
    SUB r7, r4           ; start from last row
count_lines:
    ; Compute buf addr for row r7
    LDI r20, 0
    ADD r20, r7
    LDI r14, COLS
    MUL r20, r14
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r6, line_has_content
    ADD r21, r4
    ADD r22, r4
    CMPI r22, COLS
    BLT r6, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r9, 0
    JNZ r9, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r7, r4
    CMPI r7, 0
    BGE r6, count_lines
    JMP count_done

line_has_content:
    ADD r9, r4
    SUB r7, r4
    CMPI r7, 0
    BGE r6, count_lines

count_done:
    CMPI r9, 0
    JNZ r9, has_lines
    LDI r9, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r9
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r4, 1

    ; ── Title bar ──
    LDI r12, 0x16213E
    FILL r12

    ; Title bar background
    LDI r4, 0
    LDI r12, 0
    LDI r15, 256
    LDI r5, TITLE_H
    LDI r3, 0x16213E
    RECTF r4, r12, r15, r5, r3

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r12, 0
    STORE r20, r12
    LDI r4, 8
    LDI r12, 4
    LDI r15, SCRATCH
    TEXT r4, r12, r15

    ; ── Text area background ──
    LDI r4, 0
    LDI r12, TITLE_H
    LDI r15, 256
    LDI r5, 240
    LDI r3, 0x1A1A2E
    RECTF r4, r12, r15, r5, r3

    ; ── Line number margin ──
    LDI r4, 0
    LDI r12, TITLE_H
    LDI r15, MARGIN_W
    LDI r5, 240
    LDI r3, 0x141428
    RECTF r4, r12, r15, r5, r3

    ; ── Render text lines ──
    LDI r4, 1             ; restore r4 (RECTF clobbers it to 0)
    LDI r8, 0           ; row counter
    LDI r13, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r10,r11 for intermediate math to preserve r13 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r8) to 2-char decimal string
    LDI r9, 10
    LDI r1, 0
    ADD r1, r8
    ADD r1, r4           ; r1 = row+1 (1-indexed)
    DIV r1, r9           ; r1 = (row+1) / 10 (tens digit)
    LDI r12, 48
    ADD r12, r1
    STORE r20, r12         ; LNSCR[0] = '0' + tens
    ADD r20, r4
    LDI r10, 0
    ADD r10, r1          ; r10 = tens digit
    LDI r12, 10
    MUL r10, r12           ; r10 = tens * 10
    LDI r2, 0
    ADD r2, r8
    ADD r2, r4           ; r2 = row+1
    SUB r2, r10          ; r2 = (row+1) % 10 (ones digit)
    LDI r12, 48
    ADD r12, r2
    STORE r20, r12         ; LNSCR[1] = '0' + ones
    ADD r20, r4
    LDI r12, 32            ; space separator
    STORE r20, r12         ; LNSCR[2] = ' '
    ADD r20, r4
    LDI r12, 0
    STORE r20, r12         ; LNSCR[3] = null

    ; Render line number at x=2, y=r13
    LDI r4, 2
    LDI r15, LNSCR
    TEXT r4, r13, r15

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r4, 1             ; restore r4 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r8
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r9, r22
    STORE r20, r9
    ADD r22, r4
    ADD r20, r4
    ADD r21, r4
    CMPI r21, COLS
    BLT r6, copy_line

    ; Null terminate
    LDI r12, 0
    STORE r20, r12         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r13
    LDI r4, MARGIN_W
    LDI r15, SCRATCH
    TEXT r4, r13, r15

    ; Advance y
    LDI r4, 1
    LDI r12, CHAR_H
    ADD r13, r12

    ; Next row
    ADD r8, r4
    CMPI r8, ROWS
    BLT r6, render_row

    ; ── Draw cursor ──
    CALL draw_cursor

    ; ── Status bar ──
    CALL draw_status

    RET

; =========================================
; DRAW CURSOR (blinking underline)
; =========================================
draw_cursor:
    ; Expects r4 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r9, r20
    ADD r9, r4
    STORE r20, r9

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r7, 30
    LDI r14, 0
    ADD r14, r9
    DIV r14, r7
    MOD r14, r7
    CMPI r14, 0
    JNZ r14, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r9, r20
    LDI r20, CUR_ROW
    LOAD r7, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r4, 1
    LDI r12, CHAR_W
    MUL r9, r12
    LDI r15, MARGIN_W
    ADD r9, r15           ; r9 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r12, CHAR_H
    MUL r7, r12
    LDI r15, TITLE_H
    ADD r7, r15           ; r7 = base y
    LDI r15, CHAR_H
    SUB r15, r4
    SUB r15, r4           ; CHAR_H - 2
    ADD r7, r15           ; r7 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r5, CHAR_W
    LDI r3, 2
    LDI r14, 0xFFFFFF
    RECTF r9, r7, r5, r3, r14

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r4 = 1
    ; Status bar at bottom of screen
    LDI r4, 0
    LDI r12, 248
    LDI r15, 256
    LDI r5, 8
    LDI r3, 0x0D0D1A
    RECTF r4, r12, r15, r5, r3
    LDI r4, 1             ; restore r4 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r4

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r9, r25
    CALL two_digit
    ADD r20, r4
    ADD r20, r4

    STRO r20, " R:"
    ADD r20, r4
    ADD r20, r4

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r9, r25
    CALL two_digit
    ADD r20, r4
    ADD r20, r4

    STRO r20, " C:"
    ADD r20, r4
    ADD r20, r4

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r9, r25
    CALL two_digit
    ADD r20, r4
    ADD r20, r4

    LDI r12, 0
    STORE r20, r12

    ; Render at x=4, y=250
    LDI r4, 4
    LDI r12, 250
    LDI r15, SCRATCH
    TEXT r4, r12, r15

    RET

; =========================================
; TWO_DIGIT: Convert r9 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r9 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r4 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r9
    DIV r22, r21          ; tens
    LDI r12, 48
    ADD r12, r22
    STORE r20, r12
    ADD r20, r4

    LDI r23, 0
    ADD r23, r9
    MOD r23, r21          ; ones
    LDI r12, 48
    ADD r12, r23
    STORE r20, r12
    RET
