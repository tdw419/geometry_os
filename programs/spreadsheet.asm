; spreadsheet.asm -- Spreadsheet Calculator for Geometry OS
;
; Displays an 8x8 cell grid with row/column headers.
; Arrow keys navigate cells. Number keys enter values.
; Enter starts editing, Esc exits editing.
; S key: set SUM formula on selected cell
; A key: set AVG formula on selected cell
; F key: evaluate ADD formula (cell above, col[0] + col[1])
; C key: clear formula from selected cell
;
; Canvas buffer: 128 rows x 32 cols = 4096 cells.
; Visible area: cols 0-7, rows 0-7.
; Canvas buffer index = row * 32 + col (at 0x8000 base)
;
; Screen layout (256x256):
;   Top 10px: formula bar (cell address + value)
;   12-256: grid with headers
;   Grid: 8 cols x 8 rows
;   Col headers: at y=13, letters A-H
;   Row headers: at x=5, numbers 1-8
;   Each cell: 28x22 px, starting at (24, 26)
;
; RAM Layout:
;   0x8000-0x81FF  Canvas buffer (128x32, cell values)
;   0x8200         cursor_x (0-7)
;   0x8201         cursor_y (0-7)
;   0x8202         mode: 0=nav, 1=edit
;   0x8203         edit_value (current digit accumulator)
;   0x8204         edit_len (digits entered)
;   0x8205         formula_mode: 0=normal, 1=SUM, 2=AVG
;   0x8300         temp storage
;   0x8310         formula params
;   0x9400-0x9450  Text buffer (80 chars)
;   0x9000-0x9040  Digit conversion buffer (64 chars)
;
; Register allocation:
;   r0  = CMP result (reserved)
;   r1  = scratch / x coords
;   r2  = scratch / y coords
;   r3  = scratch / w
;   r4  = scratch / h / value
;   r5  = scratch / color
;   r6  = scratch / col counter
;   r7  = canvas base (0x8000)
;   r8  = 32 (stride)
;   r9  = 10 (decimal)
;   r10 = cursor_x shadow
;   r11 = cursor_y shadow
;   r12 = temp / row counter
;   r13 = col counter / temp
;   r14 = temp addr
;   r15 = digit conversion
;   r16 = RAM pointer / mode flag
;   r17 = temp addr
;   r18 = digit count
;   r19 = temp char
;   r20 = key bitmask port (0xFFB)
;   r21 = mode shadow
;   r22 = scratch / sum acc
;   r23 = CELL_W (28)
;   r24 = CELL_H (22)
;   r25 = 8 (max cols)
;   r26 = GRID_X (24)
;   r27 = GRID_Y (26)
;   r28 = foreground color
;   r29 = 48 ('0' ASCII)
;   r30 = stack pointer
;   r31 = return address

; ── Constants ──────────────────────────────────────────────
    LDI r7, 0x8000      ; canvas buffer base
    LDI r8, 32          ; stride (rows per canvas line)
    LDI r9, 10          ; decimal constant
    LDI r20, 0xFFB      ; key bitmask port
    LDI r23, 28         ; CELL_W
    LDI r24, 22         ; CELL_H
    LDI r25, 8          ; max cols/rows
    LDI r26, 24         ; GRID_X
    LDI r27, 26         ; GRID_Y
    LDI r29, 48         ; '0' ASCII
    LDI r30, 0xF000     ; stack pointer

; ── Initialize state ───────────────────────────────────────
    LDI r16, 0x8200
    LDI r1, 0
    STORE r16, r1       ; cursor_x = 0
    ADDI r16, 1
    STORE r16, r1       ; cursor_y = 0
    ADDI r16, 1
    STORE r16, r1       ; mode = 0 (nav)
    ADDI r16, 1
    STORE r16, r1       ; edit_value = 0
    ADDI r16, 1
    STORE r16, r1       ; edit_len = 0
    ADDI r16, 1
    STORE r16, r1       ; formula_mode = 0

    ; Initialize demo values in canvas buffer
    ; Row 0: A1=10, B1=20, C1=30, D1=40
    LDI r16, 0x8000
    LDI r1, 10
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 20
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 30
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 40
    STORE r16, r1

    ; Row 1 (offset 32): A2=5, B2=15, C2=25, D2=35
    LDI r16, 0x8020
    LDI r1, 5
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 15
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 25
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 35
    STORE r16, r1

; ── Main loop ──────────────────────────────────────────────
main_loop:
    LDI r1, 0
    FILL r1             ; clear screen

    CALL render_formula_bar
    CALL render_col_headers
    CALL render_row_headers
    CALL render_grid_clean
    CALL render_cursor
    CALL handle_input

    FRAME
    JMP main_loop

; ── Render Formula Bar ─────────────────────────────────────
; Shows cell address and value
render_formula_bar:
    PUSH r31

    ; Draw bar background: RECTF 0, 0, 256, 12, 0x333355
    LDI r1, 0
    LDI r2, 0
    LDI r3, 256
    LDI r4, 12
    LDI r5, 0x333355
    RECTF r1, r2, r3, r4, r5

    ; Load cursor
    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x
    ADDI r14, 1
    LOAD r11, r14       ; cursor_y

    ; Build text at 0x9400: "A1 = 123"
    ; Column letter: 'A' + cursor_x
    LDI r1, 65          ; 'A'
    ADD r1, r10
    LDI r16, 0x9400
    STORE r16, r1       ; col letter
    ADDI r16, 1

    ; Row number: '1' + cursor_y
    LDI r1, 49          ; '1'
    ADD r1, r11
    STORE r16, r1       ; row digit
    ADDI r16, 1

    ; " = "
    LDI r1, 32          ; ' '
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 61          ; '='
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 32          ; ' '
    STORE r16, r1
    ADDI r16, 1

    ; Get cell value from canvas: index = cursor_y * 32 + cursor_x
    MOV r1, r11
    MUL r1, r8          ; r1 = cursor_y * 32
    ADD r1, r10         ; r1 = index
    ADD r1, r7          ; r1 = canvas addr
    LOAD r4, r1         ; r4 = cell value

    ; Convert value to digits at r16
    PUSH r31
    MOV r1, r4
    CALL num_to_digits
    POP r31

    ; Render bar text at (2, 1)
    LDI r1, 2
    LDI r2, 1
    LDI r3, 0x9400
    TEXT r1, r2, r3

    POP r31
    RET

; ── Render Column Headers ──────────────────────────────────
render_col_headers:
    PUSH r31

    LDI r12, 0          ; row counter for color

ch_loop:
    ; col = r6
    CMPI r6, 8
    BGE r0, ch_done

    ; x = 24 + col * 28
    MOV r1, r6
    MUL r1, r23
    ADD r1, r26         ; r1 = x

    ; RECTF: x, y=13, w=28, h=14, color=0x444466
    LDI r2, 13
    LDI r3, 28
    LDI r4, 14
    LDI r5, 0x444466
    RECTF r1, r2, r3, r4, r5

    ; Write header letter at temp buffer
    LDI r1, 65          ; 'A'
    ADD r1, r6
    LDI r16, 0x9400
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 0
    STORE r16, r1       ; null

    ; Render text: x = 24 + col*28 + 4
    MOV r1, r6
    MUL r1, r23
    ADD r1, r26
    ADDI r1, 4
    LDI r2, 14
    LDI r3, 0x9400
    TEXT r1, r2, r3

    ADDI r6, 1
    JMP ch_loop

ch_done:
    POP r31
    RET

; ── Render Row Headers ─────────────────────────────────────
render_row_headers:
    PUSH r31

    LDI r12, 0          ; row counter

rh_loop:
    CMPI r12, 8
    BGE r0, rh_done

    ; Row digit: '1' + row
    LDI r1, 49
    ADD r1, r12
    LDI r16, 0x9400
    STORE r16, r1
    ADDI r16, 1
    LDI r1, 0
    STORE r16, r1       ; null

    ; TEXT x=5, y = 26 + row*22 + 6
    MOV r1, r12
    MUL r1, r24
    ADD r1, r27
    ADDI r1, 6
    LDI r2, 5
    LDI r3, 0x9400
    TEXT r2, r1, r3

    ADDI r12, 1
    JMP rh_loop

rh_done:
    POP r31
    RET

; ── Render Grid ────────────────────────────────────────────
render_grid:
    PUSH r31

    LDI r12, 0          ; row = 0

gr_y:
    CMPI r12, 8
    BGE r0, gr_done

    LDI r13, 0          ; col = 0

gr_x:
    CMPI r13, 8
    BGE r0, gr_next_y

    ; canvas_index = row * 32 + col
    MOV r1, r12
    MUL r1, r8
    ADD r1, r13         ; r1 = index
    ADD r1, r7          ; r1 = canvas addr
    LOAD r4, r1         ; r4 = cell value

    ; screen x = 24 + col * 28
    MOV r1, r13
    MUL r1, r23
    ADD r1, r26         ; r1 = x

    ; screen y = 26 + row * 22
    MOV r2, r12
    MUL r2, r24
    ADD r2, r27         ; r2 = y

    ; Draw cell bg: RECTF x, y, 27, 21, 0x222244
    LDI r5, 0x222244
    RECTF r1, r2, r3, r4, r5
    ; Wait - r3 and r4 were overwritten! Need to reload.
    ; Actually RECTF reads r1,r2,r3,r4,r5 so we need to set them correctly.
    ; Let me redo this properly.
    
    PUSH r31
    PUSH r12
    PUSH r13
    
    ; screen x = 24 + col * 28
    MOV r12, r13
    MUL r12, r23
    ADD r12, r26        ; r12 = screen_x

    ; screen y = 26 + row * 22 (r13 holds original row in r12_pushed)
    POP r13              ; restore col
    POP r12              ; restore row  
    ; Whoops, this is getting complicated. Let me restructure.
    
    POP r13
    POP r12
    POP r31
    
    JMP gr_x

gr_next_y:
    ADDI r12, 1
    JMP gr_y

gr_done:
    POP r31
    RET

; --- The above grid function is broken due to register management issues.
; --- Let me write a proper working version.

; ── Render Grid (clean version) ────────────────────────────
; Simple 8x8 loop using r12=row, r13=col, careful register management
; This replaces the broken render_grid above.
render_grid_clean:
    PUSH r31
    
    LDI r12, 0          ; row = 0
    
rg_y:
    CMPI r12, 8
    BGE r0, rg_done
    
    LDI r13, 0          ; col = 0
    
rg_x:
    CMPI r13, 8
    BGE r0, rg_next_row
    
    ; Compute canvas index = row * 32 + col
    MOV r1, r12
    MUL r1, r8          ; r1 = row * 32
    ADD r1, r13         ; r1 = index
    ADD r1, r7          ; r1 = canvas addr
    LOAD r4, r1         ; r4 = cell value
    
    ; Compute screen position
    ; x = 24 + col * 28
    MOV r1, r13
    MUL r1, r23
    ADD r1, r26         ; r1 = screen_x
    
    ; y = 26 + row * 22
    MOV r2, r12
    MUL r2, r24
    ADD r2, r27         ; r2 = screen_y
    
    ; Save row/col before RECTF (which clobbers r3,r4,r5)
    PUSH r12
    PUSH r13
    
    ; Draw cell background: RECTF x(r1), y(r2), 27(r3), 21(r4), 0x222244(r5)
    LDI r3, 27
    LDI r4, 21
    LDI r5, 0x222244
    RECTF r1, r2, r3, r4, r5
    
    ; Draw cell border: RECTF x+1, y+1, 25, 19, 0x444466
    ADDI r1, 1
    ADDI r2, 1
    LDI r3, 25
    LDI r4, 19
    LDI r5, 0x444466
    RECTF r1, r2, r3, r4, r5
    
    ; Restore row/col
    POP r13
    POP r12
    
    ; Convert cell value (r4 was clobbered by RECTF, need to re-read)
    MOV r1, r12
    MUL r1, r8
    ADD r1, r13
    ADD r1, r7
    LOAD r4, r1         ; re-read cell value
    
    ; Save row/col for TEXT
    PUSH r12
    PUSH r13

    ; Convert value to digits at 0x9400
    PUSH r31
    MOV r1, r4
    LDI r16, 0x9400
    CALL num_to_digits
    POP r31
    
    ; Restore row/col
    POP r13
    POP r12
    
    ; Render cell text: x = 24 + col*28 + 3, y = 26 + row*22 + 3
    MOV r1, r13
    MUL r1, r23
    ADD r1, r26
    ADDI r1, 3          ; x
    
    MOV r2, r12
    MUL r2, r24
    ADD r2, r27
    ADDI r2, 3          ; y
    
    LDI r3, 0x9400      ; text buffer
    TEXT r1, r2, r3
    
    ADDI r13, 1
    JMP rg_x

rg_next_row:
    ADDI r12, 1
    JMP rg_y

rg_done:
    POP r31
    RET

; ── Render Cursor ──────────────────────────────────────────
render_cursor:
    PUSH r31

    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x
    ADDI r14, 1
    LOAD r11, r14       ; cursor_y

    ; x = 24 + cursor_x * 28
    MOV r1, r10
    MUL r1, r23
    ADD r1, r26

    ; y = 26 + cursor_y * 22
    MOV r2, r11
    MUL r2, r24
    ADD r2, r27

    ; Draw bright green highlight border
    LDI r5, 0x00FF44
    LDI r3, 27
    LDI r4, 21
    RECTF r1, r2, r3, r4, r5

    ; Inner highlight (slightly smaller)
    ADDI r1, 2
    ADDI r2, 2
    LDI r3, 23
    LDI r4, 17
    LDI r5, 0x33FF77
    RECTF r1, r2, r3, r4, r5

    ; Check if edit mode
    LDI r14, 0x8202
    LOAD r21, r14       ; mode
    JZ r21, rc_done

    ; Edit mode: show "EDIT" indicator
    LDI r1, 240
    LDI r2, 1
    LDI r16, 0x9400
    LDI r3, 69          ; 'E'
    STORE r16, r3
    ADDI r16, 1
    LDI r3, 68          ; 'D'
    STORE r16, r3
    ADDI r16, 1
    LDI r3, 73          ; 'I'
    STORE r16, r3
    ADDI r16, 1
    LDI r3, 84          ; 'T'
    STORE r16, r3
    ADDI r16, 1
    LDI r3, 0
    STORE r16, r3       ; null
    LDI r3, 0x9400
    TEXT r1, r2, r3

rc_done:
    POP r31
    RET

; ── Handle Keyboard Input ──────────────────────────────────
handle_input:
    PUSH r31

    ; Read key bitmask
    LOAD r1, r20
    JZ r1, hi_done       ; no key

    ; Check mode
    LDI r14, 0x8202
    LOAD r21, r14       ; mode
    JNZ r21, hi_edit

; ── Navigation Mode ────────────────────────────────────────
hi_nav:
    ; Arrow keys via bitmask: bit0=up, bit1=down, bit2=left, bit3=right
    ; Bit 4=space, bit 5=enter

    LDI r2, 1            ; bit 0
    AND r1, r2
    JZ r1, hi_nav_dn
    CALL nav_up
    JMP hi_done

hi_nav_dn:
    LOAD r1, r20
    LDI r2, 2            ; bit 1
    AND r1, r2
    JZ r1, hi_nav_lt
    CALL nav_down
    JMP hi_done

hi_nav_lt:
    LOAD r1, r20
    LDI r2, 4            ; bit 2
    AND r1, r2
    JZ r1, hi_nav_rt
    CALL nav_left
    JMP hi_done

hi_nav_rt:
    LOAD r1, r20
    LDI r2, 8            ; bit 3
    AND r1, r2
    JZ r1, hi_nav_sp
    CALL nav_right
    JMP hi_done

hi_nav_sp:
    LOAD r1, r20
    LDI r2, 16           ; space = bit 4
    AND r1, r2
    JZ r1, hi_nav_ent
    CALL start_edit
    JMP hi_done

hi_nav_ent:
    LOAD r1, r20
    LDI r2, 32           ; enter = bit 5
    AND r1, r2
    JZ r1, hi_nav_ascii
    CALL start_edit
    JMP hi_done

hi_nav_ascii:
    ; Read ASCII key from IKEY port 0xFFF
    LDI r14, 0xFFF
    LOAD r1, r14
    JZ r1, hi_done

    ; Check for S, A, F, C, E commands
    ; 'S' = SUM
    LDI r2, 83
    CMP r1, r2
    JNZ r0, hi_chk_a
    CALL do_sum
    JMP hi_done

hi_chk_a:
    LDI r2, 65           ; 'A'
    CMP r1, r2
    JNZ r0, hi_chk_f
    CALL do_avg
    JMP hi_done

hi_chk_f:
    LDI r2, 70           ; 'F'
    CMP r1, r2
    JNZ r0, hi_chk_c
    CALL do_formula
    JMP hi_done

hi_chk_c:
    LDI r2, 67           ; 'C'
    CMP r1, r2
    JNZ r0, hi_chk_e
    CALL do_clear_cell
    JMP hi_done

hi_chk_e:
    LDI r2, 69           ; 'E'
    CMP r1, r2
    JNZ r0, hi_chk_dig
    CALL start_edit
    JMP hi_done

hi_chk_dig:
    ; Check if digit (48-57)
    CMPI r1, 48
    BLT r0, hi_done
    LDI r2, 57
    CMP r1, r2
    BGE r0, hi_done

    ; Digit pressed - start edit with this value
    CALL start_edit
    ; Set edit_value = digit - 48
    SUBI r1, 48
    LDI r14, 0x8203
    STORE r14, r1       ; edit_value
    LDI r14, 0x8204
    LDI r1, 1
    STORE r14, r1       ; edit_len = 1
    JMP hi_done

; ── Edit Mode ──────────────────────────────────────────────
hi_edit:
    ; Check arrow keys for cancel
    LOAD r1, r20
    LDI r2, 1            ; up = cancel
    AND r1, r2
    JZ r1, hi_ed_sp

    CALL cancel_edit
    JMP hi_done

hi_ed_sp:
    LOAD r1, r20
    LDI r2, 16           ; space = commit
    AND r1, r2
    JZ r1, hi_ed_ent
    CALL commit_edit
    JMP hi_done

hi_ed_ent:
    LOAD r1, r20
    LDI r2, 32           ; enter = commit
    AND r1, r2
    JZ r1, hi_ed_ascii
    CALL commit_edit
    JMP hi_done

hi_ed_ascii:
    LDI r14, 0xFFF
    LOAD r1, r14
    JZ r1, hi_done

    ; Check if digit
    CMPI r1, 48
    BLT r0, hi_done
    LDI r2, 57
    CMP r1, r2
    BGE r0, hi_done

    ; Append digit: edit_value = edit_value * 10 + (digit - 48)
    LDI r14, 0x8203
    LOAD r4, r14        ; current value
    MUL r4, r9          ; * 10
    SUBI r1, 48         ; digit value
    ADD r4, r1
    STORE r14, r4       ; new edit_value

    LDI r14, 0x8204
    LOAD r1, r14
    ADDI r1, 1
    STORE r14, r1       ; edit_len++

hi_done:
    POP r31
    RET

; ── Navigation ─────────────────────────────────────────────
nav_up:
    PUSH r31
    LDI r14, 0x8201
    LOAD r11, r14
    JZ r11, nu_done
    SUBI r11, 1
    STORE r14, r11
nu_done:
    POP r31
    RET

nav_down:
    PUSH r31
    LDI r14, 0x8201
    LOAD r11, r14
    CMPI r11, 7
    BGE r0, nd_done
    ADDI r11, 1
    STORE r14, r11
nd_done:
    POP r31
    RET

nav_left:
    PUSH r31
    LDI r14, 0x8200
    LOAD r10, r14
    JZ r10, nl_done
    SUBI r10, 1
    STORE r14, r10
nl_done:
    POP r31
    RET

nav_right:
    PUSH r31
    LDI r14, 0x8200
    LOAD r10, r14
    CMPI r10, 7
    BGE r0, nr_done
    ADDI r10, 1
    STORE r14, r10
nr_done:
    POP r31
    RET

; ── Edit Functions ─────────────────────────────────────────
start_edit:
    PUSH r31
    LDI r14, 0x8202
    LDI r1, 1
    STORE r14, r1       ; mode = 1
    ADDI r14, 1
    LDI r1, 0
    STORE r14, r1       ; edit_value = 0
    ADDI r14, 1
    STORE r14, r1       ; edit_len = 0
    POP r31
    RET

commit_edit:
    PUSH r31
    ; Read edit_value and cursor position
    LDI r14, 0x8203
    LOAD r4, r14        ; edit_value

    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x
    ADDI r14, 1
    LOAD r11, r14       ; cursor_y

    ; canvas_addr = 0x8000 + cursor_y * 32 + cursor_x
    MOV r1, r11
    MUL r1, r8          ; y * 32
    ADD r1, r10         ; + x
    ADD r1, r7          ; + 0x8000
    STORE r1, r4        ; write value to canvas cell

    ; Reset mode to nav
    LDI r14, 0x8202
    LDI r1, 0
    STORE r14, r1       ; mode = 0

    POP r31
    RET

cancel_edit:
    PUSH r31
    LDI r14, 0x8202
    LDI r1, 0
    STORE r14, r1       ; mode = 0
    POP r31
    RET

; ── Formula Functions ─────────────────────────────────────

; do_sum: SUM all cells in row above cursor
do_sum:
    PUSH r31

    LDI r14, 0x8201
    LOAD r11, r14       ; cursor_y
    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x

    JZ r11, dsu_done     ; can't sum if at row 0

    ; row_above = cursor_y - 1
    MOV r12, r11
    SUBI r12, 1         ; source row

    ; Start of row above: canvas[row_above * 32]
    MOV r1, r12
    MUL r1, r8
    ADD r1, r7          ; r1 = canvas addr for row above

    ; Sum all 8 cells in the row
    LDI r22, 0          ; sum = 0
    LDI r13, 0          ; col = 0

dsu_loop:
    CMPI r13, 8
    BGE r0, dsu_store

    MOV r2, r1
    ADD r2, r13         ; r2 = addr of cell[row_above][col]
    LOAD r2, r2
    ADD r22, r2         ; sum += value

    ADDI r13, 1
    JMP dsu_loop

dsu_store:
    ; Write sum to target cell (cursor position)
    MOV r1, r11
    MUL r1, r8
    ADD r1, r10
    ADD r1, r7
    STORE r1, r22       ; write sum

    ; Set formula_mode flag
    LDI r14, 0x8205
    LDI r1, 1
    STORE r14, r1       ; formula_mode = SUM

dsu_done:
    POP r31
    RET

; do_avg: AVERAGE all cells in row above cursor
do_avg:
    PUSH r31

    LDI r14, 0x8201
    LOAD r11, r14       ; cursor_y
    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x

    JZ r11, dav_done

    MOV r12, r11
    SUBI r12, 1         ; source row

    MOV r1, r12
    MUL r1, r8
    ADD r1, r7          ; canvas addr for row above

    LDI r22, 0          ; sum = 0
    LDI r13, 0          ; col = 0

dav_loop:
    CMPI r13, 8
    BGE r0, dav_store

    MOV r2, r1
    ADD r2, r13
    LOAD r2, r2
    ADD r22, r2

    ADDI r13, 1
    JMP dav_loop

dav_store:
    ; avg = sum / 8
    LDI r2, 8
    DIV r22, r2         ; r22 = avg

    ; Write to target cell
    MOV r1, r11
    MUL r1, r8
    ADD r1, r10
    ADD r1, r7
    STORE r1, r22

    ; Set formula_mode flag
    LDI r14, 0x8205
    LDI r1, 2
    STORE r14, r1       ; formula_mode = AVG

dav_done:
    POP r31
    RET

; do_formula: ADD formula on selected cell
; target = canvas[row_above*32+0] + canvas[row_above*32+1]
do_formula:
    PUSH r31

    LDI r14, 0x8201
    LOAD r11, r14       ; cursor_y
    LDI r14, 0x8200
    LOAD r10, r14       ; cursor_x

    JZ r11, dfm_done     ; need row above

    MOV r12, r11
    SUBI r12, 1         ; source row

    ; Read dep0 = canvas[source_row*32+0]
    MOV r1, r12
    MUL r1, r8
    ADD r1, r7
    LOAD r2, r1         ; dep0

    ; Read dep1 = canvas[source_row*32+1]
    ADDI r1, 1
    LOAD r3, r1         ; dep1

    ; target = dep0 + dep1
    ADD r2, r3
    MOV r4, r2          ; result

    ; Write to target cell
    MOV r1, r11
    MUL r1, r8
    ADD r1, r10
    ADD r1, r7
    STORE r1, r4

dfm_done:
    POP r31
    RET

; do_clear_cell: Clear cell value to 0
do_clear_cell:
    PUSH r31

    LDI r14, 0x8201
    LOAD r11, r14
    LDI r14, 0x8200
    LOAD r10, r14

    ; canvas_target = 0x8000 + y*32 + x
    MOV r1, r11
    MUL r1, r8
    ADD r1, r10
    ADD r1, r7

    LDI r4, 0
    STORE r1, r4        ; clear cell

    ; Also clear formula_mode
    LDI r14, 0x8205
    LDI r1, 0
    STORE r14, r1       ; formula_mode = 0

dcl_done:
    POP r31
    RET

; ── Helper: Number to ASCII Digits ─────────────────────────
; Converts u32 value in r1 to ASCII digits at buffer r16
; Buffer is null-terminated.
num_to_digits:
    PUSH r31

    ; Special case: value == 0
    JNZ r1, ntd_start
    ; Write "0"
    LDI r2, 48
    STORE r16, r2
    ADDI r16, 1
    LDI r2, 0
    STORE r16, r2
    POP r31
    RET

ntd_start:
    ; Use 0x9000 as temporary reverse buffer
    LDI r17, 0x9000     ; temp buffer
    LDI r18, 0          ; digit count

ntd_loop:
    JZ r1, ntd_rev

    ; digit = value % 10
    ; Save value on stack
    PUSH r1
    MOV r22, r1
    MOD r22, r9         ; r22 = value % 10
    MOV r15, r22
    POP r1

    ; value = value / 10
    DIV r1, r9

    ; Store digit char in temp buffer
    ADDI r15, 48        ; '0' + digit
    STORE r17, r15
    ADDI r17, 1
    ADDI r18, 1

    JMP ntd_loop

ntd_rev:
    ; Copy reversed digits back to output buffer
    SUBI r17, 1         ; point to last digit

ntd_copy:
    JZ r18, ntd_end

    LOAD r15, r17       ; read digit
    STORE r16, r15      ; write to output
    ADDI r16, 1
    SUBI r17, 1
    SUBI r18, 1
    JMP ntd_copy

ntd_end:
    ; Null terminate
    LDI r2, 0
    STORE r16, r2

    POP r31
    RET
