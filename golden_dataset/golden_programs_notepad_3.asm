; DESCRIPTION: Display a line using color colored at the screen.

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
LDI r13, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r12, 32
LDI r1, COLS
LDI r11, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r12
    ADD r20, r13
    ADD r21, r13
    CMP r21, r1
    BLT r0, clear_buf_col
    ; next row
    SUB r11, r13
    JZ r11, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r10, 0
STORE r20, r10
LDI r20, CUR_ROW
STORE r20, r10

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r10, 1
STORE r20, r10

; Init blink counter
LDI r20, BLINK
STORE r20, r10

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r13, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r7
    JZ r7, main_loop

    ; Handle special keys
    CMPI r7, 8
    JZ r0, do_backspace
    CMPI r7, 13
    JZ r0, do_enter
    CMPI r7, 37
    JZ r0, do_left
    CMPI r7, 38
    JZ r0, do_up
    CMPI r7, 39
    JZ r0, do_right
    CMPI r7, 40
    JZ r0, do_down

    ; Printable character (32-126)?
    CMPI r7, 32
    BLT r0, main_loop
    CMPI r7, 127
    BGE r0, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r13, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r1, COLS
    MUL r12, r1
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12

    ; Store the character
    STORE r20, r7

    ; Advance cursor column
    ADD r11, r13
    CMPI r11, COLS
    BLT r0, no_wrap
    ; Wrap to next line
    LDI r11, 0
    LDI r20, CUR_COL
    STORE r20, r11
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r12, r20
    ADD r12, r13
    CMPI r12, ROWS
    BLT r0, no_wrap_row_limit
    LDI r12, ROWS
    SUB r12, r13
no_wrap_row_limit:
    STORE r20, r12
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r11
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r13, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r20, CUR_ROW
    LOAD r1, r20

    ; If col > 0, just move back and clear
    CMPI r12, 0
    JZ r12, bs_at_line_start

    ; Move cursor left
    SUB r12, r13
    LDI r20, CUR_COL
    STORE r20, r12

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r1, 0
    JZ r1, bs_done

    ; Move to end of previous line
    SUB r1, r13
    LDI r20, CUR_ROW
    STORE r20, r1

    ; Find last non-space character on previous line
    LDI r11, COLS
    SUB r11, r13           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r2, COLS
    MUL r12, r2
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12
    LOAD r3, r20        ; load char
    CMPI r3, 32
    JNZ r0, found_end   ; non-space = end of content
    CMPI r11, 0
    JZ r11, found_end     ; at col 0 = empty line
    SUB r11, r13
    JMP find_end

found_end:
    ADD r11, r13           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r11
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r13, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r20, CUR_COL
    LOAD r1, r20

    ; If at last row, don't advance
    LDI r11, ROWS
    SUB r11, r13
    CMP r12, r11
    BGE r0, enter_done

    ; Move to start of next row
    ADD r12, r13
    LDI r20, CUR_ROW
    STORE r20, r12

    ; Clear cursor column
    LDI r1, 0
    LDI r20, CUR_COL
    STORE r20, r1

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r2, COLS
    MUL r12, r2
    LDI r20, BUF
    ADD r20, r12
    LDI r21, 0
clear_new_line:
    LDI r3, 32
    STORE r20, r3
    ADD r20, r13
    ADD r21, r13
    CMPI r21, COLS
    BLT r0, clear_new_line

    ; Update lines count
    CALL update_lines
enter_done:
    JMP main_loop

; =========================================
; DO LEFT
; =========================================
do_left:
    LDI r13, 1
    LDI r20, CUR_COL
    LOAD r12, r20
    CMPI r12, 0
    JZ r12, left_done
    SUB r12, r13
    STORE r20, r12
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r13, 1
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r11, COLS
    SUB r11, r13
    CMP r12, r11
    BGE r0, right_done
    ADD r12, r13
    STORE r20, r12
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r13, 1
    LDI r20, CUR_ROW
    LOAD r12, r20
    CMPI r12, 0
    JZ r12, up_done
    SUB r12, r13
    STORE r20, r12
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r13, 1
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r11, ROWS
    SUB r11, r13
    CMP r12, r11
    BGE r0, down_done
    ADD r12, r13
    STORE r20, r12
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r13 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r1, COLS
    MUL r12, r1
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12
    LDI r3, 32
    STORE r20, r3
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r13 = 1
    LDI r12, 0            ; count = 0
    LDI r1, ROWS
    SUB r1, r13           ; start from last row
count_lines:
    ; Compute buf addr for row r1
    LDI r20, 0
    ADD r20, r1
    LDI r11, COLS
    MUL r20, r11
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r0, line_has_content
    ADD r21, r13
    ADD r22, r13
    CMPI r22, COLS
    BLT r0, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r12, 0
    JNZ r12, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r1, r13
    CMPI r1, 0
    BGE r0, count_lines
    JMP count_done

line_has_content:
    ADD r12, r13
    SUB r1, r13
    CMPI r1, 0
    BGE r0, count_lines

count_done:
    CMPI r12, 0
    JNZ r12, has_lines
    LDI r12, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r12
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r13, 1

    ; ── Title bar ──
    LDI r10, 0x16213E
    FILL r10

    ; Title bar background
    LDI r13, 0
    LDI r10, 0
    LDI r4, 256
    LDI r5, TITLE_H
    LDI r7, 0x16213E
    RECTF r13, r10, r4, r5, r7

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r10, 0
    STORE r20, r10
    LDI r13, 8
    LDI r10, 4
    LDI r4, SCRATCH
    TEXT r13, r10, r4

    ; ── Text area background ──
    LDI r13, 0
    LDI r10, TITLE_H
    LDI r4, 256
    LDI r5, 240
    LDI r7, 0x1A1A2E
    RECTF r13, r10, r4, r5, r7

    ; ── Line number margin ──
    LDI r13, 0
    LDI r10, TITLE_H
    LDI r4, MARGIN_W
    LDI r5, 240
    LDI r7, 0x141428
    RECTF r13, r10, r4, r5, r7

    ; ── Render text lines ──
    LDI r13, 1             ; restore r13 (RECTF clobbers it to 0)
    LDI r3, 0           ; row counter
    LDI r14, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r8,r9 for intermediate math to preserve r14 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r3) to 2-char decimal string
    LDI r12, 10
    LDI r6, 0
    ADD r6, r3
    ADD r6, r13           ; r6 = row+1 (1-indexed)
    DIV r6, r12           ; r6 = (row+1) / 10 (tens digit)
    LDI r10, 48
    ADD r10, r6
    STORE r20, r10         ; LNSCR[0] = '0' + tens
    ADD r20, r13
    LDI r8, 0
    ADD r8, r6          ; r8 = tens digit
    LDI r10, 10
    MUL r8, r10           ; r8 = tens * 10
    LDI r15, 0
    ADD r15, r3
    ADD r15, r13           ; r15 = row+1
    SUB r15, r8          ; r15 = (row+1) % 10 (ones digit)
    LDI r10, 48
    ADD r10, r15
    STORE r20, r10         ; LNSCR[1] = '0' + ones
    ADD r20, r13
    LDI r10, 32            ; space separator
    STORE r20, r10         ; LNSCR[2] = ' '
    ADD r20, r13
    LDI r10, 0
    STORE r20, r10         ; LNSCR[3] = null

    ; Render line number at x=2, y=r14
    LDI r13, 2
    LDI r4, LNSCR
    TEXT r13, r14, r4

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r13, 1             ; restore r13 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r3
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r12, r22
    STORE r20, r12
    ADD r22, r13
    ADD r20, r13
    ADD r21, r13
    CMPI r21, COLS
    BLT r0, copy_line

    ; Null terminate
    LDI r10, 0
    STORE r20, r10         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r14
    LDI r13, MARGIN_W
    LDI r4, SCRATCH
    TEXT r13, r14, r4

    ; Advance y
    LDI r13, 1
    LDI r10, CHAR_H
    ADD r14, r10

    ; Next row
    ADD r3, r13
    CMPI r3, ROWS
    BLT r0, render_row

    ; ── Draw cursor ──
    CALL draw_cursor

    ; ── Status bar ──
    CALL draw_status

    RET

; =========================================
; DRAW CURSOR (blinking underline)
; =========================================
draw_cursor:
    ; Expects r13 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r12, r20
    ADD r12, r13
    STORE r20, r12

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r1, 30
    LDI r11, 0
    ADD r11, r12
    DIV r11, r1
    MOD r11, r1
    CMPI r11, 0
    JNZ r11, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r20, CUR_ROW
    LOAD r1, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r13, 1
    LDI r10, CHAR_W
    MUL r12, r10
    LDI r4, MARGIN_W
    ADD r12, r4           ; r12 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r10, CHAR_H
    MUL r1, r10
    LDI r4, TITLE_H
    ADD r1, r4           ; r1 = base y
    LDI r4, CHAR_H
    SUB r4, r13
    SUB r4, r13           ; CHAR_H - 2
    ADD r1, r4           ; r1 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r5, CHAR_W
    LDI r7, 2
    LDI r11, 0xFFFFFF
    RECTF r12, r1, r5, r7, r11

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r13 = 1
    ; Status bar at bottom of screen
    LDI r13, 0
    LDI r10, 248
    LDI r4, 256
    LDI r5, 8
    LDI r7, 0x0D0D1A
    RECTF r13, r10, r4, r5, r7
    LDI r13, 1             ; restore r13 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r13

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r12, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    STRO r20, " R:"
    ADD r20, r13
    ADD r20, r13

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r12, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    STRO r20, " C:"
    ADD r20, r13
    ADD r20, r13

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r12, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    LDI r10, 0
    STORE r20, r10

    ; Render at x=4, y=250
    LDI r13, 4
    LDI r10, 250
    LDI r4, SCRATCH
    TEXT r13, r10, r4

    RET

; =========================================
; TWO_DIGIT: Convert r12 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r12 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r13 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r12
    DIV r22, r21          ; tens
    LDI r10, 48
    ADD r10, r22
    STORE r20, r10
    ADD r20, r13

    LDI r23, 0
    ADD r23, r12
    MOD r23, r21          ; ones
    LDI r10, 48
    ADD r10, r23
    STORE r20, r10
    RET
