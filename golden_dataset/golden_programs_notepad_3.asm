; DESCRIPTION: This GeOS assembly code implements a basic multi-line text editor with features such as typing, backspace, newline insertion, cursor navigation (using arrow keys), line numbers, a title bar, blinking cursor, and character/line count display. The editor operates within a 256x256 pixel screen area, using a RAM-based buffer for storing text content and maintaining state information like cursor position and blink counter.

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
LDI r2, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r12, 32
LDI r4, COLS
LDI r11, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r12
    ADD r20, r2
    ADD r21, r2
    CMP r21, r4
    BLT r3, clear_buf_col
    ; next row
    SUB r11, r2
    JZ r11, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r0, 0
STORE r20, r0
LDI r20, CUR_ROW
STORE r20, r0

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r0, 1
STORE r20, r0

; Init blink counter
LDI r20, BLINK
STORE r20, r0

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r2, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r6
    JZ r6, main_loop

    ; Handle special keys
    CMPI r6, 8
    JZ r3, do_backspace
    CMPI r6, 13
    JZ r3, do_enter
    CMPI r6, 37
    JZ r3, do_left
    CMPI r6, 38
    JZ r3, do_up
    CMPI r6, 39
    JZ r3, do_right
    CMPI r6, 40
    JZ r3, do_down

    ; Printable character (32-126)?
    CMPI r6, 32
    BLT r3, main_loop
    CMPI r6, 127
    BGE r3, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r2, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r4, COLS
    MUL r12, r4
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12

    ; Store the character
    STORE r20, r6

    ; Advance cursor column
    ADD r11, r2
    CMPI r11, COLS
    BLT r3, no_wrap
    ; Wrap to next line
    LDI r11, 0
    LDI r20, CUR_COL
    STORE r20, r11
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r12, r20
    ADD r12, r2
    CMPI r12, ROWS
    BLT r3, no_wrap_row_limit
    LDI r12, ROWS
    SUB r12, r2
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
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r20, CUR_ROW
    LOAD r4, r20

    ; If col > 0, just move back and clear
    CMPI r12, 0
    JZ r12, bs_at_line_start

    ; Move cursor left
    SUB r12, r2
    LDI r20, CUR_COL
    STORE r20, r12

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r4, 0
    JZ r4, bs_done

    ; Move to end of previous line
    SUB r4, r2
    LDI r20, CUR_ROW
    STORE r20, r4

    ; Find last non-space character on previous line
    LDI r11, COLS
    SUB r11, r2           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r15, COLS
    MUL r12, r15
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12
    LOAD r10, r20        ; load char
    CMPI r10, 32
    JNZ r3, found_end   ; non-space = end of content
    CMPI r11, 0
    JZ r11, found_end     ; at col 0 = empty line
    SUB r11, r2
    JMP find_end

found_end:
    ADD r11, r2           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r11
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r20, CUR_COL
    LOAD r4, r20

    ; If at last row, don't advance
    LDI r11, ROWS
    SUB r11, r2
    CMP r12, r11
    BGE r3, enter_done

    ; Move to start of next row
    ADD r12, r2
    LDI r20, CUR_ROW
    STORE r20, r12

    ; Clear cursor column
    LDI r4, 0
    LDI r20, CUR_COL
    STORE r20, r4

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r15, COLS
    MUL r12, r15
    LDI r20, BUF
    ADD r20, r12
    LDI r21, 0
clear_new_line:
    LDI r10, 32
    STORE r20, r10
    ADD r20, r2
    ADD r21, r2
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
    LDI r2, 1
    LDI r20, CUR_COL
    LOAD r12, r20
    CMPI r12, 0
    JZ r12, left_done
    SUB r12, r2
    STORE r20, r12
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r2, 1
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r11, COLS
    SUB r11, r2
    CMP r12, r11
    BGE r3, right_done
    ADD r12, r2
    STORE r20, r12
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r12, r20
    CMPI r12, 0
    JZ r12, up_done
    SUB r12, r2
    STORE r20, r12
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r11, ROWS
    SUB r11, r2
    CMP r12, r11
    BGE r3, down_done
    ADD r12, r2
    STORE r20, r12
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r2 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r12, r20
    LDI r4, COLS
    MUL r12, r4
    LDI r20, CUR_COL
    LOAD r11, r20
    ADD r12, r11
    LDI r20, BUF
    ADD r20, r12
    LDI r10, 32
    STORE r20, r10
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r2 = 1
    LDI r12, 0            ; count = 0
    LDI r4, ROWS
    SUB r4, r2           ; start from last row
count_lines:
    ; Compute buf addr for row r4
    LDI r20, 0
    ADD r20, r4
    LDI r11, COLS
    MUL r20, r11
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r3, line_has_content
    ADD r21, r2
    ADD r22, r2
    CMPI r22, COLS
    BLT r3, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r12, 0
    JNZ r12, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r4, r2
    CMPI r4, 0
    BGE r3, count_lines
    JMP count_done

line_has_content:
    ADD r12, r2
    SUB r4, r2
    CMPI r4, 0
    BGE r3, count_lines

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
    LDI r2, 1

    ; ── Title bar ──
    LDI r0, 0x16213E
    FILL r0

    ; Title bar background
    LDI r2, 0
    LDI r0, 0
    LDI r13, 256
    LDI r5, TITLE_H
    LDI r6, 0x16213E
    RECTF r2, r0, r13, r5, r6

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r0, 0
    STORE r20, r0
    LDI r2, 8
    LDI r0, 4
    LDI r13, SCRATCH
    TEXT r2, r0, r13

    ; ── Text area background ──
    LDI r2, 0
    LDI r0, TITLE_H
    LDI r13, 256
    LDI r5, 240
    LDI r6, 0x1A1A2E
    RECTF r2, r0, r13, r5, r6

    ; ── Line number margin ──
    LDI r2, 0
    LDI r0, TITLE_H
    LDI r13, MARGIN_W
    LDI r5, 240
    LDI r6, 0x141428
    RECTF r2, r0, r13, r5, r6

    ; ── Render text lines ──
    LDI r2, 1             ; restore r2 (RECTF clobbers it to 0)
    LDI r10, 0           ; row counter
    LDI r14, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r9,r8 for intermediate math to preserve r14 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r10) to 2-char decimal string
    LDI r12, 10
    LDI r1, 0
    ADD r1, r10
    ADD r1, r2           ; r1 = row+1 (1-indexed)
    DIV r1, r12           ; r1 = (row+1) / 10 (tens digit)
    LDI r0, 48
    ADD r0, r1
    STORE r20, r0         ; LNSCR[0] = '0' + tens
    ADD r20, r2
    LDI r9, 0
    ADD r9, r1          ; r9 = tens digit
    LDI r0, 10
    MUL r9, r0           ; r9 = tens * 10
    LDI r7, 0
    ADD r7, r10
    ADD r7, r2           ; r7 = row+1
    SUB r7, r9          ; r7 = (row+1) % 10 (ones digit)
    LDI r0, 48
    ADD r0, r7
    STORE r20, r0         ; LNSCR[1] = '0' + ones
    ADD r20, r2
    LDI r0, 32            ; space separator
    STORE r20, r0         ; LNSCR[2] = ' '
    ADD r20, r2
    LDI r0, 0
    STORE r20, r0         ; LNSCR[3] = null

    ; Render line number at x=2, y=r14
    LDI r2, 2
    LDI r13, LNSCR
    TEXT r2, r14, r13

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r2, 1             ; restore r2 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r10
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r12, r22
    STORE r20, r12
    ADD r22, r2
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r3, copy_line

    ; Null terminate
    LDI r0, 0
    STORE r20, r0         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r14
    LDI r2, MARGIN_W
    LDI r13, SCRATCH
    TEXT r2, r14, r13

    ; Advance y
    LDI r2, 1
    LDI r0, CHAR_H
    ADD r14, r0

    ; Next row
    ADD r10, r2
    CMPI r10, ROWS
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
    ; Expects r2 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r12, r20
    ADD r12, r2
    STORE r20, r12

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r4, 30
    LDI r11, 0
    ADD r11, r12
    DIV r11, r4
    MOD r11, r4
    CMPI r11, 0
    JNZ r11, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r12, r20
    LDI r20, CUR_ROW
    LOAD r4, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r2, 1
    LDI r0, CHAR_W
    MUL r12, r0
    LDI r13, MARGIN_W
    ADD r12, r13           ; r12 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r0, CHAR_H
    MUL r4, r0
    LDI r13, TITLE_H
    ADD r4, r13           ; r4 = base y
    LDI r13, CHAR_H
    SUB r13, r2
    SUB r13, r2           ; CHAR_H - 2
    ADD r4, r13           ; r4 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r5, CHAR_W
    LDI r6, 2
    LDI r11, 0xFFFFFF
    RECTF r12, r4, r5, r6, r11

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r2 = 1
    ; Status bar at bottom of screen
    LDI r2, 0
    LDI r0, 248
    LDI r13, 256
    LDI r5, 8
    LDI r6, 0x0D0D1A
    RECTF r2, r0, r13, r5, r6
    LDI r2, 1             ; restore r2 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r2

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r12, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " R:"
    ADD r20, r2
    ADD r20, r2

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r12, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " C:"
    ADD r20, r2
    ADD r20, r2

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r12, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    LDI r0, 0
    STORE r20, r0

    ; Render at x=4, y=250
    LDI r2, 4
    LDI r0, 250
    LDI r13, SCRATCH
    TEXT r2, r0, r13

    RET

; =========================================
; TWO_DIGIT: Convert r12 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r12 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r2 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r12
    DIV r22, r21          ; tens
    LDI r0, 48
    ADD r0, r22
    STORE r20, r0
    ADD r20, r2

    LDI r23, 0
    ADD r23, r12
    MOD r23, r21          ; ones
    LDI r0, 48
    ADD r0, r23
    STORE r20, r0
    RET
