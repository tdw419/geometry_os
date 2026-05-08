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
LDI r0, 32
LDI r12, COLS
LDI r1, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r0
    ADD r20, r2
    ADD r21, r2
    CMP r21, r12
    BLT r10, clear_buf_col
    ; next row
    SUB r1, r2
    JZ r1, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r13, 0
STORE r20, r13
LDI r20, CUR_ROW
STORE r20, r13

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r13, 1
STORE r20, r13

; Init blink counter
LDI r20, BLINK
STORE r20, r13

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
    IKEY r4
    JZ r4, main_loop

    ; Handle special keys
    CMPI r4, 8
    JZ r10, do_backspace
    CMPI r4, 13
    JZ r10, do_enter
    CMPI r4, 37
    JZ r10, do_left
    CMPI r4, 38
    JZ r10, do_up
    CMPI r4, 39
    JZ r10, do_right
    CMPI r4, 40
    JZ r10, do_down

    ; Printable character (32-126)?
    CMPI r4, 32
    BLT r10, main_loop
    CMPI r4, 127
    BGE r10, main_loop

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
    LOAD r0, r20
    LDI r12, COLS
    MUL r0, r12
    LDI r20, CUR_COL
    LOAD r1, r20
    ADD r0, r1
    LDI r20, BUF
    ADD r20, r0

    ; Store the character
    STORE r20, r4

    ; Advance cursor column
    ADD r1, r2
    CMPI r1, COLS
    BLT r10, no_wrap
    ; Wrap to next line
    LDI r1, 0
    LDI r20, CUR_COL
    STORE r20, r1
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r0, r20
    ADD r0, r2
    CMPI r0, ROWS
    BLT r10, no_wrap_row_limit
    LDI r0, ROWS
    SUB r0, r2
no_wrap_row_limit:
    STORE r20, r0
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r1
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r20, CUR_ROW
    LOAD r12, r20

    ; If col > 0, just move back and clear
    CMPI r0, 0
    JZ r0, bs_at_line_start

    ; Move cursor left
    SUB r0, r2
    LDI r20, CUR_COL
    STORE r20, r0

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r12, 0
    JZ r12, bs_done

    ; Move to end of previous line
    SUB r12, r2
    LDI r20, CUR_ROW
    STORE r20, r12

    ; Find last non-space character on previous line
    LDI r1, COLS
    SUB r1, r2           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r7, COLS
    MUL r0, r7
    ADD r0, r1
    LDI r20, BUF
    ADD r20, r0
    LOAD r5, r20        ; load char
    CMPI r5, 32
    JNZ r10, found_end   ; non-space = end of content
    CMPI r1, 0
    JZ r1, found_end     ; at col 0 = empty line
    SUB r1, r2
    JMP find_end

found_end:
    ADD r1, r2           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r1
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r20, CUR_COL
    LOAD r12, r20

    ; If at last row, don't advance
    LDI r1, ROWS
    SUB r1, r2
    CMP r0, r1
    BGE r10, enter_done

    ; Move to start of next row
    ADD r0, r2
    LDI r20, CUR_ROW
    STORE r20, r0

    ; Clear cursor column
    LDI r12, 0
    LDI r20, CUR_COL
    STORE r20, r12

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r7, COLS
    MUL r0, r7
    LDI r20, BUF
    ADD r20, r0
    LDI r21, 0
clear_new_line:
    LDI r5, 32
    STORE r20, r5
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r10, clear_new_line

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
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, left_done
    SUB r0, r2
    STORE r20, r0
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r2, 1
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r1, COLS
    SUB r1, r2
    CMP r0, r1
    BGE r10, right_done
    ADD r0, r2
    STORE r20, r0
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r0, r20
    CMPI r0, 0
    JZ r0, up_done
    SUB r0, r2
    STORE r20, r0
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r1, ROWS
    SUB r1, r2
    CMP r0, r1
    BGE r10, down_done
    ADD r0, r2
    STORE r20, r0
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r2 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r0, r20
    LDI r12, COLS
    MUL r0, r12
    LDI r20, CUR_COL
    LOAD r1, r20
    ADD r0, r1
    LDI r20, BUF
    ADD r20, r0
    LDI r5, 32
    STORE r20, r5
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r2 = 1
    LDI r0, 0            ; count = 0
    LDI r12, ROWS
    SUB r12, r2           ; start from last row
count_lines:
    ; Compute buf addr for row r12
    LDI r20, 0
    ADD r20, r12
    LDI r1, COLS
    MUL r20, r1
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r10, line_has_content
    ADD r21, r2
    ADD r22, r2
    CMPI r22, COLS
    BLT r10, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r0, 0
    JNZ r0, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r12, r2
    CMPI r12, 0
    BGE r10, count_lines
    JMP count_done

line_has_content:
    ADD r0, r2
    SUB r12, r2
    CMPI r12, 0
    BGE r10, count_lines

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
    LDI r2, 1

    ; ── Title bar ──
    LDI r13, 0x16213E
    FILL r13

    ; Title bar background
    LDI r2, 0
    LDI r13, 0
    LDI r6, 256
    LDI r11, TITLE_H
    LDI r4, 0x16213E
    RECTF r2, r13, r6, r11, r4

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r13, 0
    STORE r20, r13
    LDI r2, 8
    LDI r13, 4
    LDI r6, SCRATCH
    TEXT r2, r13, r6

    ; ── Text area background ──
    LDI r2, 0
    LDI r13, TITLE_H
    LDI r6, 256
    LDI r11, 240
    LDI r4, 0x1A1A2E
    RECTF r2, r13, r6, r11, r4

    ; ── Line number margin ──
    LDI r2, 0
    LDI r13, TITLE_H
    LDI r6, MARGIN_W
    LDI r11, 240
    LDI r4, 0x141428
    RECTF r2, r13, r6, r11, r4

    ; ── Render text lines ──
    LDI r2, 1             ; restore r2 (RECTF clobbers it to 0)
    LDI r5, 0           ; row counter
    LDI r8, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r9,r14 for intermediate math to preserve r8 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r5) to 2-char decimal string
    LDI r0, 10
    LDI r3, 0
    ADD r3, r5
    ADD r3, r2           ; r3 = row+1 (1-indexed)
    DIV r3, r0           ; r3 = (row+1) / 10 (tens digit)
    LDI r13, 48
    ADD r13, r3
    STORE r20, r13         ; LNSCR[0] = '0' + tens
    ADD r20, r2
    LDI r9, 0
    ADD r9, r3          ; r9 = tens digit
    LDI r13, 10
    MUL r9, r13           ; r9 = tens * 10
    LDI r15, 0
    ADD r15, r5
    ADD r15, r2           ; r15 = row+1
    SUB r15, r9          ; r15 = (row+1) % 10 (ones digit)
    LDI r13, 48
    ADD r13, r15
    STORE r20, r13         ; LNSCR[1] = '0' + ones
    ADD r20, r2
    LDI r13, 32            ; space separator
    STORE r20, r13         ; LNSCR[2] = ' '
    ADD r20, r2
    LDI r13, 0
    STORE r20, r13         ; LNSCR[3] = null

    ; Render line number at x=2, y=r8
    LDI r2, 2
    LDI r6, LNSCR
    TEXT r2, r8, r6

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r2, 1             ; restore r2 (TEXT x-pos set it to 2)
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
    LOAD r0, r22
    STORE r20, r0
    ADD r22, r2
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r10, copy_line

    ; Null terminate
    LDI r13, 0
    STORE r20, r13         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r8
    LDI r2, MARGIN_W
    LDI r6, SCRATCH
    TEXT r2, r8, r6

    ; Advance y
    LDI r2, 1
    LDI r13, CHAR_H
    ADD r8, r13

    ; Next row
    ADD r5, r2
    CMPI r5, ROWS
    BLT r10, render_row

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
    LOAD r0, r20
    ADD r0, r2
    STORE r20, r0

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r12, 30
    LDI r1, 0
    ADD r1, r0
    DIV r1, r12
    MOD r1, r12
    CMPI r1, 0
    JNZ r1, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r0, r20
    LDI r20, CUR_ROW
    LOAD r12, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r2, 1
    LDI r13, CHAR_W
    MUL r0, r13
    LDI r6, MARGIN_W
    ADD r0, r6           ; r0 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r13, CHAR_H
    MUL r12, r13
    LDI r6, TITLE_H
    ADD r12, r6           ; r12 = base y
    LDI r6, CHAR_H
    SUB r6, r2
    SUB r6, r2           ; CHAR_H - 2
    ADD r12, r6           ; r12 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r11, CHAR_W
    LDI r4, 2
    LDI r1, 0xFFFFFF
    RECTF r0, r12, r11, r4, r1

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r2 = 1
    ; Status bar at bottom of screen
    LDI r2, 0
    LDI r13, 248
    LDI r6, 256
    LDI r11, 8
    LDI r4, 0x0D0D1A
    RECTF r2, r13, r6, r11, r4
    LDI r2, 1             ; restore r2 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r2

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r0, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " R:"
    ADD r20, r2
    ADD r20, r2

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r0, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " C:"
    ADD r20, r2
    ADD r20, r2

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r0, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    LDI r13, 0
    STORE r20, r13

    ; Render at x=4, y=250
    LDI r2, 4
    LDI r13, 250
    LDI r6, SCRATCH
    TEXT r2, r13, r6

    RET

; =========================================
; TWO_DIGIT: Convert r0 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r0 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r2 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r0
    DIV r22, r21          ; tens
    LDI r13, 48
    ADD r13, r22
    STORE r20, r13
    ADD r20, r2

    LDI r23, 0
    ADD r23, r0
    MOD r23, r21          ; ones
    LDI r13, 48
    ADD r13, r23
    STORE r20, r13
    RET
