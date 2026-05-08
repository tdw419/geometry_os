; DESCRIPTION: Draws a colored line at the screen with fixed size.

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
LDI r6, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r0, 32
LDI r13, COLS
LDI r2, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r0
    ADD r20, r6
    ADD r21, r6
    CMP r21, r13
    BLT r3, clear_buf_col
    ; next row
    SUB r2, r6
    JZ r2, clear_buf_done
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
    LDI r6, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r11
    JZ r11, main_loop

    ; Handle special keys
    CMPI r11, 8
    JZ r3, do_backspace
    CMPI r11, 13
    JZ r3, do_enter
    CMPI r11, 37
    JZ r3, do_left
    CMPI r11, 38
    JZ r3, do_up
    CMPI r11, 39
    JZ r3, do_right
    CMPI r11, 40
    JZ r3, do_down

    ; Printable character (32-126)?
    CMPI r11, 32
    BLT r3, main_loop
    CMPI r11, 127
    BGE r3, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r6, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r13, COLS
    MUL r0, r13
    LDI r20, CUR_COL
    LOAD r2, r20
    ADD r0, r2
    LDI r20, BUF
    ADD r20, r0

    ; Store the character
    STORE r20, r11

    ; Advance cursor column
    ADD r2, r6
    CMPI r2, COLS
    BLT r3, no_wrap
    ; Wrap to next line
    LDI r2, 0
    LDI r20, CUR_COL
    STORE r20, r2
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r0, r20
    ADD r0, r6
    CMPI r0, ROWS
    BLT r3, no_wrap_row_limit
    LDI r0, ROWS
    SUB r0, r6
no_wrap_row_limit:
    STORE r20, r0
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r2
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r6, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r20, CUR_ROW
    LOAD r13, r20

    ; If col > 0, just move back and clear
    CMPI r0, 0
    JZ r0, bs_at_line_start

    ; Move cursor left
    SUB r0, r6
    LDI r20, CUR_COL
    STORE r20, r0

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r13, 0
    JZ r13, bs_done

    ; Move to end of previous line
    SUB r13, r6
    LDI r20, CUR_ROW
    STORE r20, r13

    ; Find last non-space character on previous line
    LDI r2, COLS
    SUB r2, r6           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r9, COLS
    MUL r0, r9
    ADD r0, r2
    LDI r20, BUF
    ADD r20, r0
    LOAD r15, r20        ; load char
    CMPI r15, 32
    JNZ r3, found_end   ; non-space = end of content
    CMPI r2, 0
    JZ r2, found_end     ; at col 0 = empty line
    SUB r2, r6
    JMP find_end

found_end:
    ADD r2, r6           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r2
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r6, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r20, CUR_COL
    LOAD r13, r20

    ; If at last row, don't advance
    LDI r2, ROWS
    SUB r2, r6
    CMP r0, r2
    BGE r3, enter_done

    ; Move to start of next row
    ADD r0, r6
    LDI r20, CUR_ROW
    STORE r20, r0

    ; Clear cursor column
    LDI r13, 0
    LDI r20, CUR_COL
    STORE r20, r13

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r9, COLS
    MUL r0, r9
    LDI r20, BUF
    ADD r20, r0
    LDI r21, 0
clear_new_line:
    LDI r15, 32
    STORE r20, r15
    ADD r20, r6
    ADD r21, r6
    CMPI r21, COLS
    BLT r3, clear_new_line

    ; Update lines count
    CALL update_lines
enter_done:
    JMP main_loop

; =========================================
; DO LEFT
; =========================================
do_left:
    LDI r6, 1
    LDI r20, CUR_COL
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, left_done
    SUB r0, r6
    STORE r20, r0
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r6, 1
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r2, COLS
    SUB r2, r6
    CMP r0, r2
    BGE r3, right_done
    ADD r0, r6
    STORE r20, r0
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r6, 1
    LDI r20, CUR_ROW
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, up_done
    SUB r0, r6
    STORE r20, r0
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r6, 1
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r2, ROWS
    SUB r2, r6
    CMP r0, r2
    BGE r3, down_done
    ADD r0, r6
    STORE r20, r0
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r6 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r13, COLS
    MUL r0, r13
    LDI r20, CUR_COL
    LOAD r2, r20
    ADD r0, r2
    LDI r20, BUF
    ADD r20, r0
    LDI r15, 32
    STORE r20, r15
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r6 = 1
    LDI r0, 0            ; count = 0
    LDI r13, ROWS
    SUB r13, r6           ; start from last row
count_lines:
    ; Compute buf addr for row r13
    LDI r20, 0
    ADD r20, r13
    LDI r2, COLS
    MUL r20, r2
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r3, line_has_content
    ADD r21, r6
    ADD r22, r6
    CMPI r22, COLS
    BLT r3, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r0, 0
    JNZ r0, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r13, r6
    CMPI r13, 0
    BGE r3, count_lines
    JMP count_done

line_has_content:
    ADD r0, r6
    SUB r13, r6
    CMPI r13, 0
    BGE r3, count_lines

count_done:
    CMPI r0, 0
    JNZ r0, has_lines
    LDI r0, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r0
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r6, 1

    ; ── Title bar ──
    LDI r12, 0x16213E
    FILL r12

    ; Title bar background
    LDI r6, 0
    LDI r12, 0
    LDI r5, 256
    LDI r10, TITLE_H
    LDI r11, 0x16213E
    RECTF r6, r12, r5, r10, r11

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r12, 0
    STORE r20, r12
    LDI r6, 8
    LDI r12, 4
    LDI r5, SCRATCH
    TEXT r6, r12, r5

    ; ── Text area background ──
    LDI r6, 0
    LDI r12, TITLE_H
    LDI r5, 256
    LDI r10, 240
    LDI r11, 0x1A1A2E
    RECTF r6, r12, r5, r10, r11

    ; ── Line number margin ──
    LDI r6, 0
    LDI r12, TITLE_H
    LDI r5, MARGIN_W
    LDI r10, 240
    LDI r11, 0x141428
    RECTF r6, r12, r5, r10, r11

    ; ── Render text lines ──
    LDI r6, 1             ; restore r6 (RECTF clobbers it to 0)
    LDI r15, 0           ; row counter
    LDI r1, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r4,r8 for intermediate math to preserve r1 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r15) to 2-char decimal string
    LDI r0, 10
    LDI r7, 0
    ADD r7, r15
    ADD r7, r6           ; r7 = row+1 (1-indexed)
    DIV r7, r0           ; r7 = (row+1) / 10 (tens digit)
    LDI r12, 48
    ADD r12, r7
    STORE r20, r12         ; LNSCR[0] = '0' + tens
    ADD r20, r6
    LDI r4, 0
    ADD r4, r7          ; r4 = tens digit
    LDI r12, 10
    MUL r4, r12           ; r4 = tens * 10
    LDI r14, 0
    ADD r14, r15
    ADD r14, r6           ; r14 = row+1
    SUB r14, r4          ; r14 = (row+1) % 10 (ones digit)
    LDI r12, 48
    ADD r12, r14
    STORE r20, r12         ; LNSCR[1] = '0' + ones
    ADD r20, r6
    LDI r12, 32            ; space separator
    STORE r20, r12         ; LNSCR[2] = ' '
    ADD r20, r6
    LDI r12, 0
    STORE r20, r12         ; LNSCR[3] = null

    ; Render line number at x=2, y=r1
    LDI r6, 2
    LDI r5, LNSCR
    TEXT r6, r1, r5

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r6, 1             ; restore r6 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r15
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r0, r22
    STORE r20, r0
    ADD r22, r6
    ADD r20, r6
    ADD r21, r6
    CMPI r21, COLS
    BLT r3, copy_line

    ; Null terminate
    LDI r12, 0
    STORE r20, r12         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r1
    LDI r6, MARGIN_W
    LDI r5, SCRATCH
    TEXT r6, r1, r5

    ; Advance y
    LDI r6, 1
    LDI r12, CHAR_H
    ADD r1, r12

    ; Next row
    ADD r15, r6
    CMPI r15, ROWS
    BLT r3, render_row

    ; ── Draw cursor ──
    CALL draw_cursor

    ; ── Status bar ──
    CALL draw_status

    RET

; =========================================
; DRAW CURSOR (blinking underline)
; =========================================
draw_cursor:
    ; Expects r6 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r0, r20
    ADD r0, r6
    STORE r20, r0

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r13, 30
    LDI r2, 0
    ADD r2, r0
    DIV r2, r13
    MOD r2, r13
    CMPI r2, 0
    JNZ r2, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r20, CUR_ROW
    LOAD r13, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r6, 1
    LDI r12, CHAR_W
    MUL r0, r12
    LDI r5, MARGIN_W
    ADD r0, r5           ; r0 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r12, CHAR_H
    MUL r13, r12
    LDI r5, TITLE_H
    ADD r13, r5           ; r13 = base y
    LDI r5, CHAR_H
    SUB r5, r6
    SUB r5, r6           ; CHAR_H - 2
    ADD r13, r5           ; r13 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r10, CHAR_W
    LDI r11, 2
    LDI r2, 0xFFFFFF
    RECTF r0, r13, r10, r11, r2

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r6 = 1
    ; Status bar at bottom of screen
    LDI r6, 0
    LDI r12, 248
    LDI r5, 256
    LDI r10, 8
    LDI r11, 0x0D0D1A
    RECTF r6, r12, r5, r10, r11
    LDI r6, 1             ; restore r6 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r6

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r0, r25
    CALL two_digit
    ADD r20, r6
    ADD r20, r6

    STRO r20, " R:"
    ADD r20, r6
    ADD r20, r6

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r0, r25
    CALL two_digit
    ADD r20, r6
    ADD r20, r6

    STRO r20, " C:"
    ADD r20, r6
    ADD r20, r6

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r0, r25
    CALL two_digit
    ADD r20, r6
    ADD r20, r6

    LDI r12, 0
    STORE r20, r12

    ; Render at x=4, y=250
    LDI r6, 4
    LDI r12, 250
    LDI r5, SCRATCH
    TEXT r6, r12, r5

    RET

; =========================================
; TWO_DIGIT: Convert r0 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r0 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r6 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r0
    DIV r22, r21          ; tens
    LDI r12, 48
    ADD r12, r22
    STORE r20, r12
    ADD r20, r6

    LDI r23, 0
    ADD r23, r0
    MOD r23, r21          ; ones
    LDI r12, 48
    ADD r12, r23
    STORE r20, r12
    RET
