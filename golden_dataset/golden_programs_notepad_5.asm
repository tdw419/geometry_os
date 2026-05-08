; DESCRIPTION: Render a colored line at the screen.

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
LDI r15, 32
LDI r7, COLS
LDI r14, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r15
    ADD r20, r2
    ADD r21, r2
    CMP r21, r7
    BLT r5, clear_buf_col
    ; next row
    SUB r14, r2
    JZ r14, clear_buf_done
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
    LDI r2, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r1
    JZ r1, main_loop

    ; Handle special keys
    CMPI r1, 8
    JZ r5, do_backspace
    CMPI r1, 13
    JZ r5, do_enter
    CMPI r1, 37
    JZ r5, do_left
    CMPI r1, 38
    JZ r5, do_up
    CMPI r1, 39
    JZ r5, do_right
    CMPI r1, 40
    JZ r5, do_down

    ; Printable character (32-126)?
    CMPI r1, 32
    BLT r5, main_loop
    CMPI r1, 127
    BGE r5, main_loop

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
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, CUR_COL
    LOAD r14, r20
    ADD r15, r14
    LDI r20, BUF
    ADD r20, r15

    ; Store the character
    STORE r20, r1

    ; Advance cursor column
    ADD r14, r2
    CMPI r14, COLS
    BLT r5, no_wrap
    ; Wrap to next line
    LDI r14, 0
    LDI r20, CUR_COL
    STORE r20, r14
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r15, r20
    ADD r15, r2
    CMPI r15, ROWS
    BLT r5, no_wrap_row_limit
    LDI r15, ROWS
    SUB r15, r2
no_wrap_row_limit:
    STORE r20, r15
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
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r20, CUR_ROW
    LOAD r7, r20

    ; If col > 0, just move back and clear
    CMPI r15, 0
    JZ r15, bs_at_line_start

    ; Move cursor left
    SUB r15, r2
    LDI r20, CUR_COL
    STORE r20, r15

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r7, 0
    JZ r7, bs_done

    ; Move to end of previous line
    SUB r7, r2
    LDI r20, CUR_ROW
    STORE r20, r7

    ; Find last non-space character on previous line
    LDI r14, COLS
    SUB r14, r2           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    ADD r15, r14
    LDI r20, BUF
    ADD r20, r15
    LOAD r0, r20        ; load char
    CMPI r0, 32
    JNZ r5, found_end   ; non-space = end of content
    CMPI r14, 0
    JZ r14, found_end     ; at col 0 = empty line
    SUB r14, r2
    JMP find_end

found_end:
    ADD r14, r2           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r14
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r2, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r20, CUR_COL
    LOAD r7, r20

    ; If at last row, don't advance
    LDI r14, ROWS
    SUB r14, r2
    CMP r15, r14
    BGE r5, enter_done

    ; Move to start of next row
    ADD r15, r2
    LDI r20, CUR_ROW
    STORE r20, r15

    ; Clear cursor column
    LDI r7, 0
    LDI r20, CUR_COL
    STORE r20, r7

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r8, COLS
    MUL r15, r8
    LDI r20, BUF
    ADD r20, r15
    LDI r21, 0
clear_new_line:
    LDI r0, 32
    STORE r20, r0
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r5, clear_new_line

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
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, left_done
    SUB r15, r2
    STORE r20, r15
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r2, 1
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r14, COLS
    SUB r14, r2
    CMP r15, r14
    BGE r5, right_done
    ADD r15, r2
    STORE r20, r15
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    CMPI r15, 0
    JZ r15, up_done
    SUB r15, r2
    STORE r20, r15
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r2, 1
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r14, ROWS
    SUB r14, r2
    CMP r15, r14
    BGE r5, down_done
    ADD r15, r2
    STORE r20, r15
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r2 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r15, r20
    LDI r7, COLS
    MUL r15, r7
    LDI r20, CUR_COL
    LOAD r14, r20
    ADD r15, r14
    LDI r20, BUF
    ADD r20, r15
    LDI r0, 32
    STORE r20, r0
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r2 = 1
    LDI r15, 0            ; count = 0
    LDI r7, ROWS
    SUB r7, r2           ; start from last row
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
    JNZ r5, line_has_content
    ADD r21, r2
    ADD r22, r2
    CMPI r22, COLS
    BLT r5, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r15, 0
    JNZ r15, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r7, r2
    CMPI r7, 0
    BGE r5, count_lines
    JMP count_done

line_has_content:
    ADD r15, r2
    SUB r7, r2
    CMPI r7, 0
    BGE r5, count_lines

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
    LDI r2, 1

    ; ── Title bar ──
    LDI r4, 0x16213E
    FILL r4

    ; Title bar background
    LDI r2, 0
    LDI r4, 0
    LDI r12, 256
    LDI r9, TITLE_H
    LDI r1, 0x16213E
    RECTF r2, r4, r12, r9, r1

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r4, 0
    STORE r20, r4
    LDI r2, 8
    LDI r4, 4
    LDI r12, SCRATCH
    TEXT r2, r4, r12

    ; ── Text area background ──
    LDI r2, 0
    LDI r4, TITLE_H
    LDI r12, 256
    LDI r9, 240
    LDI r1, 0x1A1A2E
    RECTF r2, r4, r12, r9, r1

    ; ── Line number margin ──
    LDI r2, 0
    LDI r4, TITLE_H
    LDI r12, MARGIN_W
    LDI r9, 240
    LDI r1, 0x141428
    RECTF r2, r4, r12, r9, r1

    ; ── Render text lines ──
    LDI r2, 1             ; restore r2 (RECTF clobbers it to 0)
    LDI r0, 0           ; row counter
    LDI r13, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r11,r10 for intermediate math to preserve r13 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r0) to 2-char decimal string
    LDI r15, 10
    LDI r3, 0
    ADD r3, r0
    ADD r3, r2           ; r3 = row+1 (1-indexed)
    DIV r3, r15           ; r3 = (row+1) / 10 (tens digit)
    LDI r4, 48
    ADD r4, r3
    STORE r20, r4         ; LNSCR[0] = '0' + tens
    ADD r20, r2
    LDI r11, 0
    ADD r11, r3          ; r11 = tens digit
    LDI r4, 10
    MUL r11, r4           ; r11 = tens * 10
    LDI r6, 0
    ADD r6, r0
    ADD r6, r2           ; r6 = row+1
    SUB r6, r11          ; r6 = (row+1) % 10 (ones digit)
    LDI r4, 48
    ADD r4, r6
    STORE r20, r4         ; LNSCR[1] = '0' + ones
    ADD r20, r2
    LDI r4, 32            ; space separator
    STORE r20, r4         ; LNSCR[2] = ' '
    ADD r20, r2
    LDI r4, 0
    STORE r20, r4         ; LNSCR[3] = null

    ; Render line number at x=2, y=r13
    LDI r2, 2
    LDI r12, LNSCR
    TEXT r2, r13, r12

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r2, 1             ; restore r2 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r0
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r15, r22
    STORE r20, r15
    ADD r22, r2
    ADD r20, r2
    ADD r21, r2
    CMPI r21, COLS
    BLT r5, copy_line

    ; Null terminate
    LDI r4, 0
    STORE r20, r4         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r13
    LDI r2, MARGIN_W
    LDI r12, SCRATCH
    TEXT r2, r13, r12

    ; Advance y
    LDI r2, 1
    LDI r4, CHAR_H
    ADD r13, r4

    ; Next row
    ADD r0, r2
    CMPI r0, ROWS
    BLT r5, render_row

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
    LOAD r15, r20
    ADD r15, r2
    STORE r20, r15

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r7, 30
    LDI r14, 0
    ADD r14, r15
    DIV r14, r7
    MOD r14, r7
    CMPI r14, 0
    JNZ r14, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r15, r20
    LDI r20, CUR_ROW
    LOAD r7, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r2, 1
    LDI r4, CHAR_W
    MUL r15, r4
    LDI r12, MARGIN_W
    ADD r15, r12           ; r15 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r4, CHAR_H
    MUL r7, r4
    LDI r12, TITLE_H
    ADD r7, r12           ; r7 = base y
    LDI r12, CHAR_H
    SUB r12, r2
    SUB r12, r2           ; CHAR_H - 2
    ADD r7, r12           ; r7 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r9, CHAR_W
    LDI r1, 2
    LDI r14, 0xFFFFFF
    RECTF r15, r7, r9, r1, r14

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r2 = 1
    ; Status bar at bottom of screen
    LDI r2, 0
    LDI r4, 248
    LDI r12, 256
    LDI r9, 8
    LDI r1, 0x0D0D1A
    RECTF r2, r4, r12, r9, r1
    LDI r2, 1             ; restore r2 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r2

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r15, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " R:"
    ADD r20, r2
    ADD r20, r2

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r15, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    STRO r20, " C:"
    ADD r20, r2
    ADD r20, r2

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r15, r25
    CALL two_digit
    ADD r20, r2
    ADD r20, r2

    LDI r4, 0
    STORE r20, r4

    ; Render at x=4, y=250
    LDI r2, 4
    LDI r4, 250
    LDI r12, SCRATCH
    TEXT r2, r4, r12

    RET

; =========================================
; TWO_DIGIT: Convert r15 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r15 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r2 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r15
    DIV r22, r21          ; tens
    LDI r4, 48
    ADD r4, r22
    STORE r20, r4
    ADD r20, r2

    LDI r23, 0
    ADD r23, r15
    MOD r23, r21          ; ones
    LDI r4, 48
    ADD r4, r23
    STORE r20, r4
    RET
