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
LDI r13, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r10, 32
LDI r5, COLS
LDI r9, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r10
    ADD r20, r13
    ADD r21, r13
    CMP r21, r5
    BLT r0, clear_buf_col
    ; next row
    SUB r9, r13
    JZ r9, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r2, 0
STORE r20, r2
LDI r20, CUR_ROW
STORE r20, r2

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r2, 1
STORE r20, r2

; Init blink counter
LDI r20, BLINK
STORE r20, r2

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
    IKEY r8
    JZ r8, main_loop

    ; Handle special keys
    CMPI r8, 8
    JZ r0, do_backspace
    CMPI r8, 13
    JZ r0, do_enter
    CMPI r8, 37
    JZ r0, do_left
    CMPI r8, 38
    JZ r0, do_up
    CMPI r8, 39
    JZ r0, do_right
    CMPI r8, 40
    JZ r0, do_down

    ; Printable character (32-126)?
    CMPI r8, 32
    BLT r0, main_loop
    CMPI r8, 127
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
    LOAD r10, r20
    LDI r5, COLS
    MUL r10, r5
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r10, r9
    LDI r20, BUF
    ADD r20, r10

    ; Store the character
    STORE r20, r8

    ; Advance cursor column
    ADD r9, r13
    CMPI r9, COLS
    BLT r0, no_wrap
    ; Wrap to next line
    LDI r9, 0
    LDI r20, CUR_COL
    STORE r20, r9
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r10, r20
    ADD r10, r13
    CMPI r10, ROWS
    BLT r0, no_wrap_row_limit
    LDI r10, ROWS
    SUB r10, r13
no_wrap_row_limit:
    STORE r20, r10
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r9
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r13, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r10, r20
    LDI r20, CUR_ROW
    LOAD r5, r20

    ; If col > 0, just move back and clear
    CMPI r10, 0
    JZ r10, bs_at_line_start

    ; Move cursor left
    SUB r10, r13
    LDI r20, CUR_COL
    STORE r20, r10

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r5, 0
    JZ r5, bs_done

    ; Move to end of previous line
    SUB r5, r13
    LDI r20, CUR_ROW
    STORE r20, r5

    ; Find last non-space character on previous line
    LDI r9, COLS
    SUB r9, r13           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r1, COLS
    MUL r10, r1
    ADD r10, r9
    LDI r20, BUF
    ADD r20, r10
    LOAD r6, r20        ; load char
    CMPI r6, 32
    JNZ r0, found_end   ; non-space = end of content
    CMPI r9, 0
    JZ r9, found_end     ; at col 0 = empty line
    SUB r9, r13
    JMP find_end

found_end:
    ADD r9, r13           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r9
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r13, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r20, CUR_COL
    LOAD r5, r20

    ; If at last row, don't advance
    LDI r9, ROWS
    SUB r9, r13
    CMP r10, r9
    BGE r0, enter_done

    ; Move to start of next row
    ADD r10, r13
    LDI r20, CUR_ROW
    STORE r20, r10

    ; Clear cursor column
    LDI r5, 0
    LDI r20, CUR_COL
    STORE r20, r5

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r1, COLS
    MUL r10, r1
    LDI r20, BUF
    ADD r20, r10
    LDI r21, 0
clear_new_line:
    LDI r6, 32
    STORE r20, r6
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
    LOAD r10, r20
    CMPI r10, 0
    JZ r10, left_done
    SUB r10, r13
    STORE r20, r10
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r13, 1
    LDI r20, CUR_COL
    LOAD r10, r20
    LDI r9, COLS
    SUB r9, r13
    CMP r10, r9
    BGE r0, right_done
    ADD r10, r13
    STORE r20, r10
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r13, 1
    LDI r20, CUR_ROW
    LOAD r10, r20
    CMPI r10, 0
    JZ r10, up_done
    SUB r10, r13
    STORE r20, r10
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r13, 1
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r9, ROWS
    SUB r9, r13
    CMP r10, r9
    BGE r0, down_done
    ADD r10, r13
    STORE r20, r10
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r13 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r10, r20
    LDI r5, COLS
    MUL r10, r5
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r10, r9
    LDI r20, BUF
    ADD r20, r10
    LDI r6, 32
    STORE r20, r6
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r13 = 1
    LDI r10, 0            ; count = 0
    LDI r5, ROWS
    SUB r5, r13           ; start from last row
count_lines:
    ; Compute buf addr for row r5
    LDI r20, 0
    ADD r20, r5
    LDI r9, COLS
    MUL r20, r9
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
    CMPI r10, 0
    JNZ r10, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r5, r13
    CMPI r5, 0
    BGE r0, count_lines
    JMP count_done

line_has_content:
    ADD r10, r13
    SUB r5, r13
    CMPI r5, 0
    BGE r0, count_lines

count_done:
    CMPI r10, 0
    JNZ r10, has_lines
    LDI r10, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r10
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r13, 1

    ; ── Title bar ──
    LDI r2, 0x16213E
    FILL r2

    ; Title bar background
    LDI r13, 0
    LDI r2, 0
    LDI r11, 256
    LDI r12, TITLE_H
    LDI r8, 0x16213E
    RECTF r13, r2, r11, r12, r8

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r2, 0
    STORE r20, r2
    LDI r13, 8
    LDI r2, 4
    LDI r11, SCRATCH
    TEXT r13, r2, r11

    ; ── Text area background ──
    LDI r13, 0
    LDI r2, TITLE_H
    LDI r11, 256
    LDI r12, 240
    LDI r8, 0x1A1A2E
    RECTF r13, r2, r11, r12, r8

    ; ── Line number margin ──
    LDI r13, 0
    LDI r2, TITLE_H
    LDI r11, MARGIN_W
    LDI r12, 240
    LDI r8, 0x141428
    RECTF r13, r2, r11, r12, r8

    ; ── Render text lines ──
    LDI r13, 1             ; restore r13 (RECTF clobbers it to 0)
    LDI r6, 0           ; row counter
    LDI r7, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r4,r14 for intermediate math to preserve r7 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r6) to 2-char decimal string
    LDI r10, 10
    LDI r15, 0
    ADD r15, r6
    ADD r15, r13           ; r15 = row+1 (1-indexed)
    DIV r15, r10           ; r15 = (row+1) / 10 (tens digit)
    LDI r2, 48
    ADD r2, r15
    STORE r20, r2         ; LNSCR[0] = '0' + tens
    ADD r20, r13
    LDI r4, 0
    ADD r4, r15          ; r4 = tens digit
    LDI r2, 10
    MUL r4, r2           ; r4 = tens * 10
    LDI r3, 0
    ADD r3, r6
    ADD r3, r13           ; r3 = row+1
    SUB r3, r4          ; r3 = (row+1) % 10 (ones digit)
    LDI r2, 48
    ADD r2, r3
    STORE r20, r2         ; LNSCR[1] = '0' + ones
    ADD r20, r13
    LDI r2, 32            ; space separator
    STORE r20, r2         ; LNSCR[2] = ' '
    ADD r20, r13
    LDI r2, 0
    STORE r20, r2         ; LNSCR[3] = null

    ; Render line number at x=2, y=r7
    LDI r13, 2
    LDI r11, LNSCR
    TEXT r13, r7, r11

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r13, 1             ; restore r13 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r6
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r10, r22
    STORE r20, r10
    ADD r22, r13
    ADD r20, r13
    ADD r21, r13
    CMPI r21, COLS
    BLT r0, copy_line

    ; Null terminate
    LDI r2, 0
    STORE r20, r2         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r7
    LDI r13, MARGIN_W
    LDI r11, SCRATCH
    TEXT r13, r7, r11

    ; Advance y
    LDI r13, 1
    LDI r2, CHAR_H
    ADD r7, r2

    ; Next row
    ADD r6, r13
    CMPI r6, ROWS
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
    LOAD r10, r20
    ADD r10, r13
    STORE r20, r10

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r5, 30
    LDI r9, 0
    ADD r9, r10
    DIV r9, r5
    MOD r9, r5
    CMPI r9, 0
    JNZ r9, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r10, r20
    LDI r20, CUR_ROW
    LOAD r5, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r13, 1
    LDI r2, CHAR_W
    MUL r10, r2
    LDI r11, MARGIN_W
    ADD r10, r11           ; r10 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r2, CHAR_H
    MUL r5, r2
    LDI r11, TITLE_H
    ADD r5, r11           ; r5 = base y
    LDI r11, CHAR_H
    SUB r11, r13
    SUB r11, r13           ; CHAR_H - 2
    ADD r5, r11           ; r5 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r12, CHAR_W
    LDI r8, 2
    LDI r9, 0xFFFFFF
    RECTF r10, r5, r12, r8, r9

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r13 = 1
    ; Status bar at bottom of screen
    LDI r13, 0
    LDI r2, 248
    LDI r11, 256
    LDI r12, 8
    LDI r8, 0x0D0D1A
    RECTF r13, r2, r11, r12, r8
    LDI r13, 1             ; restore r13 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r13

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r10, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    STRO r20, " R:"
    ADD r20, r13
    ADD r20, r13

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r10, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    STRO r20, " C:"
    ADD r20, r13
    ADD r20, r13

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r10, r25
    CALL two_digit
    ADD r20, r13
    ADD r20, r13

    LDI r2, 0
    STORE r20, r2

    ; Render at x=4, y=250
    LDI r13, 4
    LDI r2, 250
    LDI r11, SCRATCH
    TEXT r13, r2, r11

    RET

; =========================================
; TWO_DIGIT: Convert r10 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r10 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r13 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r10
    DIV r22, r21          ; tens
    LDI r2, 48
    ADD r2, r22
    STORE r20, r2
    ADD r20, r13

    LDI r23, 0
    ADD r23, r10
    MOD r23, r21          ; ones
    LDI r2, 48
    ADD r2, r23
    STORE r20, r2
    RET
