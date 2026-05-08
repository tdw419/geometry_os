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
LDI r11, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r15, 32
LDI r12, COLS
LDI r6, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r15
    ADD r20, r11
    ADD r21, r11
    CMP r21, r12
    BLT r2, clear_buf_col
    ; next row
    SUB r6, r11
    JZ r6, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r4, 0
STORE r20, r4
LDI r20, CUR_ROW
STORE r20, r4

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r4, 1
STORE r20, r4

; Init blink counter
LDI r20, BLINK
STORE r20, r4

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r11, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r13
    JZ r13, main_loop

    ; Handle special keys
    CMPI r13, 8
    JZ r2, do_backspace
    CMPI r13, 13
    JZ r2, do_enter
    CMPI r13, 37
    JZ r2, do_left
    CMPI r13, 38
    JZ r2, do_up
    CMPI r13, 39
    JZ r2, do_right
    CMPI r13, 40
    JZ r2, do_down

    ; Printable character (32-126)?
    CMPI r13, 32
    BLT r2, main_loop
    CMPI r13, 127
    BGE r2, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r11, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12
    LDI r20, CUR_COL
    LOAD r6, r20
    ADD r15, r6
    LDI r20, BUF
    ADD r20, r15

    ; Store the character
    STORE r20, r13

    ; Advance cursor column
    ADD r6, r11
    CMPI r6, COLS
    BLT r2, no_wrap
    ; Wrap to next line
    LDI r6, 0
    LDI r20, CUR_COL
    STORE r20, r6
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r11
    CMPI r15, ROWS
    BLT r2, no_wrap_row_limit
    LDI r15, ROWS
    SUB r15, r11
no_wrap_row_limit:
    STORE r20, r15
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r6
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r11, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r20, CUR_ROW
    LOAD r12, r20

    ; If col > 0, just move back and clear
    CMPI r15, 0
    JZ r15, bs_at_line_start

    ; Move cursor left
    SUB r15, r11
    LDI r20, CUR_COL
    STORE r20, r15

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r12, 0
    JZ r12, bs_done

    ; Move to end of previous line
    SUB r12, r11
    LDI r20, CUR_ROW
    STORE r20, r12

    ; Find last non-space character on previous line
    LDI r6, COLS
    SUB r6, r11           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r3, COLS
    MUL r15, r3
    ADD r15, r6
    LDI r20, BUF
    ADD r20, r15
    LOAD r5, r20        ; load char
    CMPI r5, 32
    JNZ r2, found_end   ; non-space = end of content
    CMPI r6, 0
    JZ r6, found_end     ; at col 0 = empty line
    SUB r6, r11
    JMP find_end

found_end:
    ADD r6, r11           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r6
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r11, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r20, CUR_COL
    LOAD r12, r20

    ; If at last row, don't advance
    LDI r6, ROWS
    SUB r6, r11
    CMP r15, r6
    BGE r2, enter_done

    ; Move to start of next row
    ADD r15, r11
    LDI r20, CUR_ROW
    STORE r20, r15

    ; Clear cursor column
    LDI r12, 0
    LDI r20, CUR_COL
    STORE r20, r12

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r3, COLS
    MUL r15, r3
    LDI r20, BUF
    ADD r20, r15
    LDI r21, 0
clear_new_line:
    LDI r5, 32
    STORE r20, r5
    ADD r20, r11
    ADD r21, r11
    CMPI r21, COLS
    BLT r2, clear_new_line

    ; Update lines count
    CALL update_lines
enter_done:
    JMP main_loop

; =========================================
; DO LEFT
; =========================================
do_left:
    LDI r11, 1
    LDI r20, CUR_COL
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, left_done
    SUB r15, r11
    STORE r20, r15
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r11, 1
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r6, COLS
    SUB r6, r11
    CMP r15, r6
    BGE r2, right_done
    ADD r15, r11
    STORE r20, r15
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r11, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, up_done
    SUB r15, r11
    STORE r20, r15
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r11, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r6, ROWS
    SUB r6, r11
    CMP r15, r6
    BGE r2, down_done
    ADD r15, r11
    STORE r20, r15
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r11 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r12, COLS
    MUL r15, r12
    LDI r20, CUR_COL
    LOAD r6, r20
    ADD r15, r6
    LDI r20, BUF
    ADD r20, r15
    LDI r5, 32
    STORE r20, r5
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r11 = 1
    LDI r15, 0            ; count = 0
    LDI r12, ROWS
    SUB r12, r11           ; start from last row
count_lines:
    ; Compute buf addr for row r12
    LDI r20, 0
    ADD r20, r12
    LDI r6, COLS
    MUL r20, r6
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r2, line_has_content
    ADD r21, r11
    ADD r22, r11
    CMPI r22, COLS
    BLT r2, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r15, 0
    JNZ r15, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r12, r11
    CMPI r12, 0
    BGE r2, count_lines
    JMP count_done

line_has_content:
    ADD r15, r11
    SUB r12, r11
    CMPI r12, 0
    BGE r2, count_lines

count_done:
    CMPI r15, 0
    JNZ r15, has_lines
    LDI r15, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r15
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r11, 1

    ; ── Title bar ──
    LDI r4, 0x16213E
    FILL r4

    ; Title bar background
    LDI r11, 0
    LDI r4, 0
    LDI r9, 256
    LDI r0, TITLE_H
    LDI r13, 0x16213E
    RECTF r11, r4, r9, r0, r13

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r4, 0
    STORE r20, r4
    LDI r11, 8
    LDI r4, 4
    LDI r9, SCRATCH
    TEXT r11, r4, r9

    ; ── Text area background ──
    LDI r11, 0
    LDI r4, TITLE_H
    LDI r9, 256
    LDI r0, 240
    LDI r13, 0x1A1A2E
    RECTF r11, r4, r9, r0, r13

    ; ── Line number margin ──
    LDI r11, 0
    LDI r4, TITLE_H
    LDI r9, MARGIN_W
    LDI r0, 240
    LDI r13, 0x141428
    RECTF r11, r4, r9, r0, r13

    ; ── Render text lines ──
    LDI r11, 1             ; restore r11 (RECTF clobbers it to 0)
    LDI r5, 0           ; row counter
    LDI r8, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r1,r14 for intermediate math to preserve r8 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r5) to 2-char decimal string
    LDI r15, 10
    LDI r10, 0
    ADD r10, r5
    ADD r10, r11           ; r10 = row+1 (1-indexed)
    DIV r10, r15           ; r10 = (row+1) / 10 (tens digit)
    LDI r4, 48
    ADD r4, r10
    STORE r20, r4         ; LNSCR[0] = '0' + tens
    ADD r20, r11
    LDI r1, 0
    ADD r1, r10          ; r1 = tens digit
    LDI r4, 10
    MUL r1, r4           ; r1 = tens * 10
    LDI r7, 0
    ADD r7, r5
    ADD r7, r11           ; r7 = row+1
    SUB r7, r1          ; r7 = (row+1) % 10 (ones digit)
    LDI r4, 48
    ADD r4, r7
    STORE r20, r4         ; LNSCR[1] = '0' + ones
    ADD r20, r11
    LDI r4, 32            ; space separator
    STORE r20, r4         ; LNSCR[2] = ' '
    ADD r20, r11
    LDI r4, 0
    STORE r20, r4         ; LNSCR[3] = null

    ; Render line number at x=2, y=r8
    LDI r11, 2
    LDI r9, LNSCR
    TEXT r11, r8, r9

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r11, 1             ; restore r11 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r5
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r15, r22
    STORE r20, r15
    ADD r22, r11
    ADD r20, r11
    ADD r21, r11
    CMPI r21, COLS
    BLT r2, copy_line

    ; Null terminate
    LDI r4, 0
    STORE r20, r4         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r8
    LDI r11, MARGIN_W
    LDI r9, SCRATCH
    TEXT r11, r8, r9

    ; Advance y
    LDI r11, 1
    LDI r4, CHAR_H
    ADD r8, r4

    ; Next row
    ADD r5, r11
    CMPI r5, ROWS
    BLT r2, render_row

    ; ── Draw cursor ──
    CALL draw_cursor

    ; ── Status bar ──
    CALL draw_status

    RET

; =========================================
; DRAW CURSOR (blinking underline)
; =========================================
draw_cursor:
    ; Expects r11 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r15, r20
    ADD r15, r11
    STORE r20, r15

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r12, 30
    LDI r6, 0
    ADD r6, r15
    DIV r6, r12
    MOD r6, r12
    CMPI r6, 0
    JNZ r6, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r20, CUR_ROW
    LOAD r12, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r11, 1
    LDI r4, CHAR_W
    MUL r15, r4
    LDI r9, MARGIN_W
    ADD r15, r9           ; r15 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r4, CHAR_H
    MUL r12, r4
    LDI r9, TITLE_H
    ADD r12, r9           ; r12 = base y
    LDI r9, CHAR_H
    SUB r9, r11
    SUB r9, r11           ; CHAR_H - 2
    ADD r12, r9           ; r12 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r0, CHAR_W
    LDI r13, 2
    LDI r6, 0xFFFFFF
    RECTF r15, r12, r0, r13, r6

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r11 = 1
    ; Status bar at bottom of screen
    LDI r11, 0
    LDI r4, 248
    LDI r9, 256
    LDI r0, 8
    LDI r13, 0x0D0D1A
    RECTF r11, r4, r9, r0, r13
    LDI r11, 1             ; restore r11 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r11

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r15, r25
    CALL two_digit
    ADD r20, r11
    ADD r20, r11

    STRO r20, " R:"
    ADD r20, r11
    ADD r20, r11

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r15, r25
    CALL two_digit
    ADD r20, r11
    ADD r20, r11

    STRO r20, " C:"
    ADD r20, r11
    ADD r20, r11

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r15, r25
    CALL two_digit
    ADD r20, r11
    ADD r20, r11

    LDI r4, 0
    STORE r20, r4

    ; Render at x=4, y=250
    LDI r11, 4
    LDI r4, 250
    LDI r9, SCRATCH
    TEXT r11, r4, r9

    RET

; =========================================
; TWO_DIGIT: Convert r15 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r15 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r11 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r15
    DIV r22, r21          ; tens
    LDI r4, 48
    ADD r4, r22
    STORE r20, r4
    ADD r20, r11

    LDI r23, 0
    ADD r23, r15
    MOD r23, r21          ; ones
    LDI r4, 48
    ADD r4, r23
    STORE r20, r4
    RET
