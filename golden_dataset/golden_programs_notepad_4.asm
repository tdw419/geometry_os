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
LDI r11, 32
LDI r15, COLS
LDI r13, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r11
    ADD r20, r2
    ADD r21, r2
    CMP r21, r15
    BLT r10, clear_buf_col
    ; next row
    SUB r13, r2
    JZ r13, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r14, 0
STORE r20, r14
LDI r20, CUR_ROW
STORE r20, r14

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r14, 1
STORE r20, r14

; Init blink counter
LDI r20, BLINK
STORE r20, r14

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
    IKEY r9
    JZ r9, main_loop

    ; Handle special keys
    CMPI r9, 8
    JZ r10, do_backspace
    CMPI r9, 13
    JZ r10, do_enter
    CMPI r9, 37
    JZ r10, do_left
    CMPI r9, 38
    JZ r10, do_up
    CMPI r9, 39
    JZ r10, do_right
    CMPI r9, 40
    JZ r10, do_down

    ; Printable character (32-126)?
    CMPI r9, 32
    BLT r10, main_loop
    CMPI r9, 127
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
    LOAD r11, r20
    LDI r15, COLS
    MUL r11, r15
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r11, r13
    LDI r20, BUF
    ADD r20, r11

    ; Store the character
    STORE r20, r9

    ; Advance cursor column
    ADD r13, r2
    CMPI r13, COLS
    BLT r10, no_wrap
    ; Wrap to next line
    LDI r13, 0
    LDI r20, CUR_COL
    STORE r20, r13
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r11, r20
    ADD r11, r2
    CMPI r11, ROWS
    BLT r10, no_wrap_row_limit
    LDI r11, ROWS
    SUB r11, r2
no_wrap_row_limit:
    STORE r20, r11
    ; Update lines count if needed
    CALL update_lines
    RET
no_wrap:
    LDI r20, CUR_COL
    STORE r20, r13
    RET

; =========================================
; DO BACKSPACE
; =========================================
do_backspace:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r11, r20
    LDI r20, CUR_ROW
    LOAD r15, r20

    ; If col > 0, just move back and clear
    CMPI r11, 0
    JZ r11, bs_at_line_start

    ; Move cursor left
    SUB r11, r2
    LDI r20, CUR_COL
    STORE r20, r11

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r15, 0
    JZ r15, bs_done

    ; Move to end of previous line
    SUB r15, r2
    LDI r20, CUR_ROW
    STORE r20, r15

    ; Find last non-space character on previous line
    LDI r13, COLS
    SUB r13, r2           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r0, COLS
    MUL r11, r0
    ADD r11, r13
    LDI r20, BUF
    ADD r20, r11
    LOAD r8, r20        ; load char
    CMPI r8, 32
    JNZ r10, found_end   ; non-space = end of content
    CMPI r13, 0
    JZ r13, found_end     ; at col 0 = empty line
    SUB r13, r2
    JMP find_end

found_end:
    ADD r13, r2           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r13
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r20, CUR_COL
    LOAD r15, r20

    ; If at last row, don't advance
    LDI r13, ROWS
    SUB r13, r2
    CMP r11, r13
    BGE r10, enter_done

    ; Move to start of next row
    ADD r11, r2
    LDI r20, CUR_ROW
    STORE r20, r11

    ; Clear cursor column
    LDI r15, 0
    LDI r20, CUR_COL
    STORE r20, r15

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r0, COLS
    MUL r11, r0
    LDI r20, BUF
    ADD r20, r11
    LDI r21, 0
clear_new_line:
    LDI r8, 32
    STORE r20, r8
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
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, left_done
    SUB r11, r2
    STORE r20, r11
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r2, 1
    LDI r20, CUR_COL
    LOAD r11, r20
    LDI r13, COLS
    SUB r13, r2
    CMP r11, r13
    BGE r10, right_done
    ADD r11, r2
    STORE r20, r11
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r11, r20
    CMPI r11, 0
    JZ r11, up_done
    SUB r11, r2
    STORE r20, r11
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r13, ROWS
    SUB r13, r2
    CMP r11, r13
    BGE r10, down_done
    ADD r11, r2
    STORE r20, r11
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r2 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r11, r20
    LDI r15, COLS
    MUL r11, r15
    LDI r20, CUR_COL
    LOAD r13, r20
    ADD r11, r13
    LDI r20, BUF
    ADD r20, r11
    LDI r8, 32
    STORE r20, r8
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r2 = 1
    LDI r11, 0            ; count = 0
    LDI r15, ROWS
    SUB r15, r2           ; start from last row
count_lines:
    ; Compute buf addr for row r15
    LDI r20, 0
    ADD r20, r15
    LDI r13, COLS
    MUL r20, r13
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
    CMPI r11, 0
    JNZ r11, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r15, r2
    CMPI r15, 0
    BGE r10, count_lines
    JMP count_done

line_has_content:
    ADD r11, r2
    SUB r15, r2
    CMPI r15, 0
    BGE r10, count_lines

count_done:
    CMPI r11, 0
    JNZ r11, has_lines
    LDI r11, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r11
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r2, 1

    ; ── Title bar ──
    LDI r14, 0x16213E
    FILL r14

    ; Title bar background
    LDI r2, 0
    LDI r14, 0
    LDI r3, 256
    LDI r6, TITLE_H
    LDI r9, 0x16213E
    RECTF r2, r14, r3, r6, r9

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r14, 0
    STORE r20, r14
    LDI r2, 8
    LDI r14, 4
    LDI r3, SCRATCH
    TEXT r2, r14, r3

    ; ── Text area background ──
    LDI r2, 0
    LDI r14, TITLE_H
    LDI r3, 256
    LDI r6, 240
    LDI r9, 0x1A1A2E
    RECTF r2, r14, r3, r6, r9

    ; ── Line number margin ──
    LDI r2, 0
    LDI r14, TITLE_H
    LDI r3, MARGIN_W
    LDI r6, 240
    LDI r9, 0x141428
    RECTF r2, r14, r3, r6, r9

    ; ── Render text lines ──
    LDI r2, 1             ; restore r2 (RECTF clobbers it to 0)
    LDI r8, 0           ; row counter
    LDI r1, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r4,r7 for intermediate math to preserve r1 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r8) to 2-char decimal string
    LDI r11, 10
    LDI r12, 0
    ADD r12, r8
    ADD r12, r2           ; r12 = row+1 (1-indexed)
    DIV r12, r11           ; r12 = (row+1) / 10 (tens digit)
    LDI r14, 48
    ADD r14, r12
    STORE r20, r14         ; LNSCR[0] = '0' + tens
    ADD r20, r2
    LDI r4, 0
    ADD r4, r12          ; r4 = tens digit
    LDI r14, 10
    MUL r4, r14           ; r4 = tens * 10
    LDI r5, 0
    ADD r5, r8
    ADD r5, r2           ; r5 = row+1
    SUB r5, r4          ; r5 = (row+1) % 10 (ones digit)
    LDI r14, 48
    ADD r14, r5
    STORE r20, r14         ; LNSCR[1] = '0' + ones
    ADD r20, r2
    LDI r14, 32            ; space separator
    STORE r20, r14         ; LNSCR[2] = ' '
    ADD r20, r2
    LDI r14, 0
    STORE r20, r14         ; LNSCR[3] = null

    ; Render line number at x=2, y=r1
    LDI r2, 2
    LDI r3, LNSCR
    TEXT r2, r1, r3

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r2, 1             ; restore r2 (TEXT x-pos set it to 2)
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
    LOAD r11, r22
    STORE r20, r11
    ADD r22, r2
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r10, copy_line

    ; Null terminate
    LDI r14, 0
    STORE r20, r14         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r1
    LDI r2, MARGIN_W
    LDI r3, SCRATCH
    TEXT r2, r1, r3

    ; Advance y
    LDI r2, 1
    LDI r14, CHAR_H
    ADD r1, r14

    ; Next row
    ADD r8, r2
    CMPI r8, ROWS
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
    LOAD r11, r20
    ADD r11, r2
    STORE r20, r11

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r15, 30
    LDI r13, 0
    ADD r13, r11
    DIV r13, r15
    MOD r13, r15
    CMPI r13, 0
    JNZ r13, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r11, r20
    LDI r20, CUR_ROW
    LOAD r15, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r2, 1
    LDI r14, CHAR_W
    MUL r11, r14
    LDI r3, MARGIN_W
    ADD r11, r3           ; r11 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r14, CHAR_H
    MUL r15, r14
    LDI r3, TITLE_H
    ADD r15, r3           ; r15 = base y
    LDI r3, CHAR_H
    SUB r3, r2
    SUB r3, r2           ; CHAR_H - 2
    ADD r15, r3           ; r15 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r6, CHAR_W
    LDI r9, 2
    LDI r13, 0xFFFFFF
    RECTF r11, r15, r6, r9, r13

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r2 = 1
    ; Status bar at bottom of screen
    LDI r2, 0
    LDI r14, 248
    LDI r3, 256
    LDI r6, 8
    LDI r9, 0x0D0D1A
    RECTF r2, r14, r3, r6, r9
    LDI r2, 1             ; restore r2 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r2

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r11, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " R:"
    ADD r20, r2
    ADD r20, r2

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r11, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " C:"
    ADD r20, r2
    ADD r20, r2

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r11, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    LDI r14, 0
    STORE r20, r14

    ; Render at x=4, y=250
    LDI r2, 4
    LDI r14, 250
    LDI r3, SCRATCH
    TEXT r2, r14, r3

    RET

; =========================================
; TWO_DIGIT: Convert r11 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r11 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r2 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r11
    DIV r22, r21          ; tens
    LDI r14, 48
    ADD r14, r22
    STORE r20, r14
    ADD r20, r2

    LDI r23, 0
    ADD r23, r11
    MOD r23, r21          ; ones
    LDI r14, 48
    ADD r14, r23
    STORE r20, r14
    RET
