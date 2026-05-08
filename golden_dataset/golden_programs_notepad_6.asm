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
LDI r8, 1
LDI r30, 0xFD00

; Clear text buffer to spaces (32)
LDI r20, BUF
LDI r4, 32
LDI r1, COLS
LDI r9, ROWS
clear_buf_row:
    ; clear one row (COLS spaces)
    LDI r21, 0
clear_buf_col:
    STORE r20, r4
    ADD r20, r8
    ADD r21, r8
    CMP r21, r1
    BLT r14, clear_buf_col
    ; next row
    SUB r9, r8
    JZ r9, clear_buf_done
    JMP clear_buf_row
clear_buf_done:

; Init cursor position
LDI r20, CUR_COL
LDI r15, 0
STORE r20, r15
LDI r20, CUR_ROW
STORE r20, r15

; Init lines count = 1 (start with one empty line)
LDI r20, LINES
LDI r15, 1
STORE r20, r15

; Init blink counter
LDI r20, BLINK
STORE r20, r15

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    LDI r8, 1

    ; Draw everything
    CALL render

    ; Signal frame
    FRAME

    ; Read keyboard
    IKEY r7
    JZ r7, main_loop

    ; Handle special keys
    CMPI r7, 8
    JZ r14, do_backspace
    CMPI r7, 13
    JZ r14, do_enter
    CMPI r7, 37
    JZ r14, do_left
    CMPI r7, 38
    JZ r14, do_up
    CMPI r7, 39
    JZ r14, do_right
    CMPI r7, 40
    JZ r14, do_down

    ; Printable character (32-126)?
    CMPI r7, 32
    BLT r14, main_loop
    CMPI r7, 127
    BGE r14, main_loop

    ; Insert character at cursor
    CALL insert_char
    JMP main_loop

; =========================================
; INSERT CHARACTER
; =========================================
insert_char:
    LDI r8, 1

    ; Compute buffer address: BUF + cur_row * COLS + cur_col
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r1, COLS
    MUL r4, r1
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r4, r9
    LDI r20, BUF
    ADD r20, r4

    ; Store the character
    STORE r20, r7

    ; Advance cursor column
    ADD r9, r8
    CMPI r9, COLS
    BLT r14, no_wrap
    ; Wrap to next line
    LDI r9, 0
    LDI r20, CUR_COL
    STORE r20, r9
    ; Advance row
    LDI r20, CUR_ROW
    LOAD r4, r20
    ADD r4, r8
    CMPI r4, ROWS
    BLT r14, no_wrap_row_limit
    LDI r4, ROWS
    SUB r4, r8
no_wrap_row_limit:
    STORE r20, r4
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
    LDI r8, 1

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r4, r20
    LDI r20, CUR_ROW
    LOAD r1, r20

    ; If col > 0, just move back and clear
    CMPI r4, 0
    JZ r4, bs_at_line_start

    ; Move cursor left
    SUB r4, r8
    LDI r20, CUR_COL
    STORE r20, r4

    ; Clear character at new position
    CALL clear_cursor_pos
    JMP main_loop

bs_at_line_start:
    ; At start of line -- if row > 0, join with previous line
    CMPI r1, 0
    JZ r1, bs_done

    ; Move to end of previous line
    SUB r1, r8
    LDI r20, CUR_ROW
    STORE r20, r1

    ; Find last non-space character on previous line
    LDI r9, COLS
    SUB r9, r8           ; start from last col
find_end:
    ; Compute buf addr for (row, col)
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r6, COLS
    MUL r4, r6
    ADD r4, r9
    LDI r20, BUF
    ADD r20, r4
    LOAD r12, r20        ; load char
    CMPI r12, 32
    JNZ r14, found_end   ; non-space = end of content
    CMPI r9, 0
    JZ r9, found_end     ; at col 0 = empty line
    SUB r9, r8
    JMP find_end

found_end:
    ADD r9, r8           ; cursor goes one past last char
    LDI r20, CUR_COL
    STORE r20, r9
bs_done:
    JMP main_loop

; =========================================
; DO ENTER
; =========================================
do_enter:
    LDI r8, 1

    ; Load cursor position
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r20, CUR_COL
    LOAD r1, r20

    ; If at last row, don't advance
    LDI r9, ROWS
    SUB r9, r8
    CMP r4, r9
    BGE r14, enter_done

    ; Move to start of next row
    ADD r4, r8
    LDI r20, CUR_ROW
    STORE r20, r4

    ; Clear cursor column
    LDI r1, 0
    LDI r20, CUR_COL
    STORE r20, r1

    ; Clear the new line to spaces
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r6, COLS
    MUL r4, r6
    LDI r20, BUF
    ADD r20, r4
    LDI r21, 0
clear_new_line:
    LDI r12, 32
    STORE r20, r12
    ADD r20, r8
    ADD r21, r8
    CMPI r21, COLS
    BLT r14, clear_new_line

    ; Update lines count
    CALL update_lines
enter_done:
    JMP main_loop

; =========================================
; DO LEFT
; =========================================
do_left:
    LDI r8, 1
    LDI r20, CUR_COL
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, left_done
    SUB r4, r8
    STORE r20, r4
left_done:
    JMP main_loop

; =========================================
; DO RIGHT
; =========================================
do_right:
    LDI r8, 1
    LDI r20, CUR_COL
    LOAD r4, r20
    LDI r9, COLS
    SUB r9, r8
    CMP r4, r9
    BGE r14, right_done
    ADD r4, r8
    STORE r20, r4
right_done:
    JMP main_loop

; =========================================
; DO UP
; =========================================
do_up:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r4, r20
    CMPI r4, 0
    JZ r4, up_done
    SUB r4, r8
    STORE r20, r4
up_done:
    JMP main_loop

; =========================================
; DO DOWN
; =========================================
do_down:
    LDI r8, 1
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r9, ROWS
    SUB r9, r8
    CMP r4, r9
    BGE r14, down_done
    ADD r4, r8
    STORE r20, r4
down_done:
    JMP main_loop

; =========================================
; CLEAR CHARACTER AT CURSOR POSITION
; =========================================
clear_cursor_pos:
    ; Expects r8 = 1
    ; Computes buffer addr from CUR_ROW and CUR_COL, writes space (32)
    LDI r20, CUR_ROW
    LOAD r4, r20
    LDI r1, COLS
    MUL r4, r1
    LDI r20, CUR_COL
    LOAD r9, r20
    ADD r4, r9
    LDI r20, BUF
    ADD r20, r4
    LDI r12, 32
    STORE r20, r12
    RET

; =========================================
; UPDATE LINES COUNT
; =========================================
update_lines:
    ; Count non-empty lines from bottom up
    ; Expects r8 = 1
    LDI r4, 0            ; count = 0
    LDI r1, ROWS
    SUB r1, r8           ; start from last row
count_lines:
    ; Compute buf addr for row r1
    LDI r20, 0
    ADD r20, r1
    LDI r9, COLS
    MUL r20, r9
    LDI r21, BUF
    ADD r21, r20

    ; Check if any non-space char in this row
    LDI r22, 0
check_line:
    LOAD r23, r21
    CMPI r23, 32
    JNZ r14, line_has_content
    ADD r21, r8
    ADD r22, r8
    CMPI r22, COLS
    BLT r14, check_line
    ; All spaces -- empty line, check if we already found content
    CMPI r4, 0
    JNZ r4, count_done   ; already found content above, stop
    ; No content yet, keep looking up
    SUB r1, r8
    CMPI r1, 0
    BGE r14, count_lines
    JMP count_done

line_has_content:
    ADD r4, r8
    SUB r1, r8
    CMPI r1, 0
    BGE r14, count_lines

count_done:
    CMPI r4, 0
    JNZ r4, has_lines
    LDI r4, 1            ; at least 1 line
has_lines:
    LDI r20, LINES
    STORE r20, r4
    RET

; =========================================
; RENDER
; =========================================
render:
    LDI r8, 1

    ; ── Title bar ──
    LDI r15, 0x16213E
    FILL r15

    ; Title bar background
    LDI r8, 0
    LDI r15, 0
    LDI r10, 256
    LDI r0, TITLE_H
    LDI r7, 0x16213E
    RECTF r8, r15, r10, r0, r7

    ; Title text: "GeoPad"
    LDI r20, SCRATCH
    STRO r20, "GeoPad v1.0"
    LDI r15, 0
    STORE r20, r15
    LDI r8, 8
    LDI r15, 4
    LDI r10, SCRATCH
    TEXT r8, r15, r10

    ; ── Text area background ──
    LDI r8, 0
    LDI r15, TITLE_H
    LDI r10, 256
    LDI r0, 240
    LDI r7, 0x1A1A2E
    RECTF r8, r15, r10, r0, r7

    ; ── Line number margin ──
    LDI r8, 0
    LDI r15, TITLE_H
    LDI r10, MARGIN_W
    LDI r0, 240
    LDI r7, 0x141428
    RECTF r8, r15, r10, r0, r7

    ; ── Render text lines ──
    LDI r8, 1             ; restore r8 (RECTF clobbers it to 0)
    LDI r12, 0           ; row counter
    LDI r3, TITLE_H     ; y position

render_row:
    ; Draw line number -- use r2,r13 for intermediate math to preserve r3 (y-pos)
    LDI r20, LNSCR
    ; Convert row number (r12) to 2-char decimal string
    LDI r4, 10
    LDI r5, 0
    ADD r5, r12
    ADD r5, r8           ; r5 = row+1 (1-indexed)
    DIV r5, r4           ; r5 = (row+1) / 10 (tens digit)
    LDI r15, 48
    ADD r15, r5
    STORE r20, r15         ; LNSCR[0] = '0' + tens
    ADD r20, r8
    LDI r2, 0
    ADD r2, r5          ; r2 = tens digit
    LDI r15, 10
    MUL r2, r15           ; r2 = tens * 10
    LDI r11, 0
    ADD r11, r12
    ADD r11, r8           ; r11 = row+1
    SUB r11, r2          ; r11 = (row+1) % 10 (ones digit)
    LDI r15, 48
    ADD r15, r11
    STORE r20, r15         ; LNSCR[1] = '0' + ones
    ADD r20, r8
    LDI r15, 32            ; space separator
    STORE r20, r15         ; LNSCR[2] = ' '
    ADD r20, r8
    LDI r15, 0
    STORE r20, r15         ; LNSCR[3] = null

    ; Render line number at x=2, y=r3
    LDI r8, 2
    LDI r10, LNSCR
    TEXT r8, r3, r10

    ; Render text line from buffer
    ; Copy COLS chars from buffer to scratch
    LDI r8, 1             ; restore r8 (TEXT x-pos set it to 2)
    LDI r20, SCRATCH
    LDI r21, 0
    ; Compute buffer address for this row
    LDI r22, BUF
    LDI r23, COLS
    LDI r24, 0
    ADD r24, r12
    MUL r24, r23
    ADD r22, r24

copy_line:
    LOAD r4, r22
    STORE r20, r4
    ADD r22, r8
    ADD r20, r8
    ADD r21, r8
    CMPI r21, COLS
    BLT r14, copy_line

    ; Null terminate
    LDI r15, 0
    STORE r20, r15         ; null terminate scratch

    ; Render text at x=MARGIN_W, y=r3
    LDI r8, MARGIN_W
    LDI r10, SCRATCH
    TEXT r8, r3, r10

    ; Advance y
    LDI r8, 1
    LDI r15, CHAR_H
    ADD r3, r15

    ; Next row
    ADD r12, r8
    CMPI r12, ROWS
    BLT r14, render_row

    ; ── Draw cursor ──
    CALL draw_cursor

    ; ── Status bar ──
    CALL draw_status

    RET

; =========================================
; DRAW CURSOR (blinking underline)
; =========================================
draw_cursor:
    ; Expects r8 = 1
    ; Read blink counter and toggle
    LDI r20, BLINK
    LOAD r4, r20
    ADD r4, r8
    STORE r20, r4

    ; Cursor visible on even counts (blink every 30 frames)
    LDI r1, 30
    LDI r9, 0
    ADD r9, r4
    DIV r9, r1
    MOD r9, r1
    CMPI r9, 0
    JNZ r9, cursor_done

    ; Load cursor position
    LDI r20, CUR_COL
    LOAD r4, r20
    LDI r20, CUR_ROW
    LOAD r1, r20

    ; Compute screen position
    ; x = MARGIN_W + cur_col * CHAR_W
    LDI r8, 1
    LDI r15, CHAR_W
    MUL r4, r15
    LDI r10, MARGIN_W
    ADD r4, r10           ; r4 = x

    ; y = TITLE_H + cur_row * CHAR_H + (CHAR_H - 2)
    LDI r15, CHAR_H
    MUL r1, r15
    LDI r10, TITLE_H
    ADD r1, r10           ; r1 = base y
    LDI r10, CHAR_H
    SUB r10, r8
    SUB r10, r8           ; CHAR_H - 2
    ADD r1, r10           ; r1 = y (near bottom of character cell)

    ; Draw cursor as white underline (width=CHAR_W, height=2)
    LDI r0, CHAR_W
    LDI r7, 2
    LDI r9, 0xFFFFFF
    RECTF r4, r1, r0, r7, r9

cursor_done:
    RET

; =========================================
; DRAW STATUS BAR
; =========================================
draw_status:
    ; Expects r8 = 1
    ; Status bar at bottom of screen
    LDI r8, 0
    LDI r15, 248
    LDI r10, 256
    LDI r0, 8
    LDI r7, 0x0D0D1A
    RECTF r8, r15, r10, r0, r7
    LDI r8, 1             ; restore r8 (RECTF clobbered it to 0)

    ; Show "Lines: N  Row: R  Col: C"
    LDI r20, SCRATCH
    STRO r20, "Ln:"
    ADD r20, r8

    ; Lines count (2-digit)
    LDI r25, LINES
    LOAD r4, r25
    CALL two_digit
    ADD r20, r8
    ADD r20, r8

    STRO r20, " R:"
    ADD r20, r8
    ADD r20, r8

    ; Current row (2-digit)
    LDI r25, CUR_ROW
    LOAD r4, r25
    CALL two_digit
    ADD r20, r8
    ADD r20, r8

    STRO r20, " C:"
    ADD r20, r8
    ADD r20, r8

    ; Current col (2-digit)
    LDI r25, CUR_COL
    LOAD r4, r25
    CALL two_digit
    ADD r20, r8
    ADD r20, r8

    LDI r15, 0
    STORE r20, r15

    ; Render at x=4, y=250
    LDI r8, 4
    LDI r15, 250
    LDI r10, SCRATCH
    TEXT r8, r15, r10

    RET

; =========================================
; TWO_DIGIT: Convert r4 (0-99) to 2 ASCII digits at SCRATCH
; =========================================
two_digit:
    ; r4 = value
    ; Writes 2 chars starting at address in r20, does NOT null-terminate
    ; Expects r8 = 1
    LDI r21, 10
    LDI r22, 0
    ADD r22, r4
    DIV r22, r21          ; tens
    LDI r15, 48
    ADD r15, r22
    STORE r20, r15
    ADD r20, r8

    LDI r23, 0
    ADD r23, r4
    MOD r23, r21          ; ones
    LDI r15, 48
    ADD r15, r23
    STORE r20, r15
    RET
