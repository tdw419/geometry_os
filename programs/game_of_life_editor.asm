; game_of_life_editor.asm -- Conway's Game of Life with Editor
;
; 64x64 grid, 4x4 pixel cells, covers full 256x256 screen
; Toroidal wrap-around using modular arithmetic
;
; Controls:
;   SPACE     Toggle edit mode (cursor visible when editing)
;   ENTER     Toggle run/pause
;   S         Single step (advance one generation while paused)
;   1         Load Glider at cursor
;   2         Load R-pentomino at cursor
;   3         Load Acorn at cursor
;   C         Clear all cells
;   R         Random fill (~30% density)
;   Arrow/WASD Move cursor
;   Q/Escape  Quit
;
; Memory layout:
;   0x2000     grid (4096 cells: 64*64, 1 word per cell)
;   0x3000     temp grid (4096 cells for next generation)
;   0x4000     generation counter
;   0x4001     state flags (bit0=running, bit1=editing)
;   0x4002     cursor_x (0-63)
;   0x4003     cursor_y (0-63)
;   0x4004     alive color
;   0x4005     dead color
;   0x4010     scratch for neighbor count (1 word)

; =================================================================
; INITIALIZATION
; =================================================================

LDI r30, 0xFF00        ; stack pointer
LDI r7, 1              ; constant 1
LDI r9, 64             ; GRID_SIZE
LDI r10, 4             ; CELL_SIZE
LDI r11, 0x2000        ; grid base
LDI r12, 0x3000        ; temp grid base
LDI r16, 0x00FF88      ; alive color (green)
LDI r13, 0x0A0A0A      ; dead color

LDI r15, 0x4000
LDI r17, 0
STORE r15, r17          ; generation = 0
LDI r15, 0x4001
LDI r17, 1
STORE r15, r17          ; running = true
LDI r15, 0x4002
LDI r17, 32
STORE r15, r17          ; cursor_x = center
LDI r15, 0x4003
LDI r17, 32
STORE r15, r17          ; cursor_y = center
LDI r15, 0x4004
STORE r15, r16          ; alive color
LDI r15, 0x4005
STORE r15, r13          ; dead color

; =================================================================
; PLACE INITIAL PATTERNS
; =================================================================

; R-pentomino at (16, 16)
LDI r14, 16
LDI r15, 17
PUSH r31
CALL set_cell
POP r31
LDI r15, 18
PUSH r31
CALL set_cell
POP r31
LDI r14, 17
LDI r15, 16
PUSH r31
CALL set_cell
POP r31
LDI r15, 17
PUSH r31
CALL set_cell
POP r31
LDI r14, 18
LDI r15, 17
PUSH r31
CALL set_cell
POP r31

; Glider at (10, 10)
LDI r14, 10
LDI r15, 11
PUSH r31
CALL set_cell
POP r31
LDI r14, 11
LDI r15, 12
PUSH r31
CALL set_cell
POP r31
LDI r14, 12
LDI r15, 10
PUSH r31
CALL set_cell
POP r31
LDI r15, 11
PUSH r31
CALL set_cell
POP r31
LDI r15, 12
PUSH r31
CALL set_cell
POP r31

; Acorn at (40, 10)
LDI r14, 10
LDI r15, 41
PUSH r31
CALL set_cell
POP r31
LDI r14, 11
LDI r15, 44
PUSH r31
CALL set_cell
POP r31
LDI r14, 12
LDI r15, 40
PUSH r31
CALL set_cell
POP r31
LDI r15, 41
PUSH r31
CALL set_cell
POP r31
LDI r15, 43
PUSH r31
CALL set_cell
POP r31
LDI r15, 44
PUSH r31
CALL set_cell
POP r31
LDI r15, 45
PUSH r31
CALL set_cell
POP r31

; =================================================================
; MAIN LOOP
; =================================================================
main_loop:

IKEY r20
JZ r20, skip_input

; SPACE = toggle edit mode
LDI r21, 32
CMP r20, r21
JNZ r0, chk_enter
LDI r15, 0x4001
LOAD r21, r15
LDI r22, 2
XOR r21, r22
STORE r15, r21
JMP skip_input

chk_enter:
LDI r21, 13
CMP r20, r21
JNZ r0, chk_s
LDI r15, 0x4001
LOAD r21, r15
LDI r22, 1
XOR r21, r22
STORE r15, r21
JMP skip_input

chk_s:
LDI r21, 83
CMP r20, r21
JNZ r0, chk_1
LDI r15, 0x4001
LOAD r21, r15
AND r21, r7
JNZ r21, skip_input
PUSH r31
CALL compute_gen
POP r31
JMP skip_input

chk_1:
LDI r21, 49
CMP r20, r21
JNZ r0, chk_2
PUSH r31
CALL place_glider
POP r31
JMP skip_input

chk_2:
LDI r21, 50
CMP r20, r21
JNZ r0, chk_3
PUSH r31
CALL place_rpento
POP r31
JMP skip_input

chk_3:
LDI r21, 51
CMP r20, r21
JNZ r0, chk_c
PUSH r31
CALL place_acorn
POP r31
JMP skip_input

chk_c:
LDI r21, 67
CMP r20, r21
JNZ r0, chk_r
PUSH r31
CALL clear_all
POP r31
JMP skip_input

chk_r:
LDI r21, 82
CMP r20, r21
JNZ r0, chk_arrows
PUSH r31
CALL random_fill
POP r31
JMP skip_input

chk_arrows:
LDI r21, 17
CMP r20, r21
JZ r0, do_up
LDI r21, 87
CMP r20, r21
JNZ r0, chk_down
do_up:
LDI r15, 0x4003
LOAD r21, r15
SUB r21, r7
ADD r21, r9
CMP r21, r9
BLT r0, up_ok
SUB r21, r9
CMP r21, r9
BLT r0, up_ok
SUB r21, r9
up_ok:
STORE r15, r21
JMP skip_input

chk_down:
LDI r21, 31
CMP r20, r21
JZ r0, do_down
LDI r21, 83
CMP r20, r21
JNZ r0, chk_left
do_down:
LDI r15, 0x4003
LOAD r21, r15
ADD r21, r7
CMP r21, r9
BLT r0, dn_ok
LDI r21, 0
dn_ok:
STORE r15, r21
JMP skip_input

chk_left:
LDI r21, 30
CMP r20, r21
JZ r0, do_left
LDI r21, 65
CMP r20, r21
JNZ r0, chk_right
do_left:
LDI r15, 0x4002
LOAD r21, r15
SUB r21, r7
ADD r21, r9
CMP r21, r9
BLT r0, lt_ok
SUB r21, r9
CMP r21, r9
BLT r0, lt_ok
SUB r21, r9
lt_ok:
STORE r15, r21
JMP skip_input

chk_right:
LDI r21, 28
CMP r20, r21
JZ r0, do_right
LDI r21, 68
CMP r20, r21
JNZ r0, chk_esc
do_right:
LDI r15, 0x4002
LOAD r21, r15
ADD r21, r7
CMP r21, r9
BLT r0, rt_ok
LDI r21, 0
rt_ok:
STORE r15, r21
JMP skip_input

chk_esc:
LDI r21, 81
CMP r20, r21
JZ r0, do_halt
LDI r21, 27
CMP r20, r21
JNZ r0, skip_input
do_halt:
HALT

skip_input:

; Compute generation if running
LDI r15, 0x4001
LOAD r20, r15
AND r20, r7
JZ r20, do_render
PUSH r31
CALL compute_gen
POP r31
LDI r15, 0x4000
LOAD r20, r15
ADD r20, r7
STORE r15, r20

do_render:
PUSH r31
CALL render_grid
POP r31

; Draw cursor if editing
LDI r15, 0x4001
LOAD r20, r15
LDI r21, 2
AND r20, r21
JZ r20, no_cursor
PUSH r31
CALL draw_cursor
POP r31
no_cursor:

FRAME
JMP main_loop

; =================================================================
; SUBROUTINES
; =================================================================

; set_cell(x=r15, y=r14): set grid cell to alive
set_cell:
MOV r17, r14
MUL r17, r9
ADD r17, r15
ADD r17, r11
LDI r18, 1
STORE r17, r18
RET

; get_cell_addr(x=r15, y=r14) -> r17 = grid address
get_cell_addr:
MOV r17, r14
MUL r17, r9
ADD r17, r15
ADD r17, r11
RET

; wrap(val=r21) -> r21 = val mod 64
; Handles underflow (0xFFFFFFFF = -1) and overflow (64, 65)
wrap:
ADD r21, r9
CMP r21, r9
BLT r0, wrap_done
SUB r21, r9
CMP r21, r9
BLT r0, wrap_done
SUB r21, r9
wrap_done:
RET

; compute_gen: compute next generation in-place
; Uses scratch at 0x4010 for neighbor count
compute_gen:
PUSH r31              ; save return address (wrap calls clobber r31)
LDI r2, 0             ; y = 0
gen_y:
LDI r1, 0             ; x = 0
gen_x:
; Compute neighbor count for (x, y)
LDI r6, 0             ; neighbor count

; We need to check 8 neighbors
; To avoid register pressure, we compute each neighbor individually
; and add to r6. We save/restore r15,r14 around get_cell_addr calls.

; Neighbor (-1,-1)
MOV r21, r1
SUB r21, r7
CALL wrap
MOV r15, r21
MOV r21, r2
SUB r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (0,-1)
MOV r15, r1
MOV r21, r2
SUB r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (+1,-1)
MOV r21, r1
ADD r21, r7
CALL wrap
MOV r15, r21
MOV r21, r2
SUB r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (-1,0)
MOV r21, r1
SUB r21, r7
CALL wrap
MOV r15, r21
MOV r14, r2
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (+1,0)
MOV r21, r1
ADD r21, r7
CALL wrap
MOV r15, r21
MOV r14, r2
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (-1,+1)
MOV r21, r1
SUB r21, r7
CALL wrap
MOV r15, r21
MOV r21, r2
ADD r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (0,+1)
MOV r15, r1
MOV r21, r2
ADD r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Neighbor (+1,+1)
MOV r21, r1
ADD r21, r7
CALL wrap
MOV r15, r21
MOV r21, r2
ADD r21, r7
CALL wrap
MOV r14, r21
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17
ADD r6, r21

; Now r6 = neighbor count
; Get current cell state
MOV r15, r1
MOV r14, r2
PUSH r31
CALL get_cell_addr
POP r31
LOAD r21, r17         ; r21 = current cell (0 or 1)

; Save neighbor count
MOV r19, r6

; Apply rules:
; If alive (r21=1) and neighbors 2 or 3 -> stay alive
; If alive and neighbors < 2 or > 3 -> die
; If dead (r21=0) and neighbors == 3 -> born
JZ r21, check_born

; Cell is alive
LDI r21, 2
CMP r19, r21
JZ r0, stay_alive     ; neighbors == 2, stay
LDI r21, 3
CMP r19, r21
JZ r0, stay_alive     ; neighbors == 3, stay
JMP cell_dies         ; otherwise die

check_born:
LDI r21, 3
CMP r19, r21
JNZ r0, cell_dies     ; not 3 neighbors, stay dead

stay_alive:
; Write 1 to temp grid
MOV r15, r1
MOV r14, r2
MOV r17, r14
MUL r17, r9
ADD r17, r15
ADD r17, r12          ; temp grid base
LDI r18, 1
STORE r17, r18
JMP next_cell

cell_dies:
; Write 0 to temp grid
MOV r15, r1
MOV r14, r2
MOV r17, r14
MUL r17, r9
ADD r17, r15
ADD r17, r12
LDI r18, 0
STORE r17, r18

next_cell:
ADD r1, r7
MOV r6, r1
SUB r6, r9
JZ r6, gen_yn
JMP gen_x

gen_yn:
ADD r2, r7
MOV r6, r2
SUB r6, r9
JZ r6, gen_copy
JMP gen_y

; Copy temp back to grid
gen_copy:
LDI r2, 0
cp_y:
LDI r1, 0
cp_x:
MOV r17, r2
MUL r17, r9
ADD r17, r1
MOV r18, r17
ADD r18, r12          ; temp addr
MOV r19, r17
ADD r19, r11          ; grid addr
LOAD r21, r18
STORE r19, r21
ADD r1, r7
MOV r6, r1
SUB r6, r9
JZ r6, cp_yn
JMP cp_x
cp_yn:
ADD r2, r7
MOV r6, r2
SUB r6, r9
JZ r6, gen_done
JMP cp_y
gen_done:
POP r31               ; restore return address
RET

; render_grid: draw all cells
render_grid:
LDI r6, 0
FILL r6               ; clear screen

LDI r2, 0             ; y = 0
ry:
LDI r1, 0             ; x = 0
rx:
MOV r15, r2
MUL r15, r9
ADD r15, r1
ADD r15, r11
LOAD r6, r15
JZ r6, rx_skip

MOV r3, r1
LDI r6, 2
SHL r3, r6           ; sx = x * 4
MOV r4, r2
SHL r4, r6           ; sy = y * 4
LDI r15, 0x4004
LOAD r5, r15          ; r5 = alive color
RECTF r3, r4, r10, r10, r5

rx_skip:
ADD r1, r7
MOV r6, r1
SUB r6, r9
JZ r6, ry_next
JMP rx
ry_next:
ADD r2, r7
MOV r6, r2
SUB r6, r9
JZ r6, ry_done
JMP ry
ry_done:
RET

; draw_cursor: cyan rectangle around cursor cell
draw_cursor:
LDI r15, 0x4002
LOAD r20, r15
LDI r15, 0x4003
LOAD r21, r15
MOV r3, r20
LDI r6, 2
SHL r3, r6
MOV r4, r21
SHL r4, r6
LDI r5, 0x00CCFF
RECTF r3, r4, r10, r7, r5
RECTF r3, r4, r7, r10, r5
MOV r22, r3
ADD r22, r10
SUB r22, r7
RECTF r22, r4, r7, r10, r5
MOV r22, r4
ADD r22, r10
SUB r22, r7
RECTF r3, r22, r10, r7, r5
RET

; clear_all: zero grid
clear_all:
LDI r2, 0
ca_y:
LDI r1, 0
ca_x:
MOV r17, r2
MUL r17, r9
ADD r17, r1
ADD r17, r11
LDI r18, 0
STORE r17, r18
ADD r1, r7
MOV r6, r1
SUB r6, r9
JZ r6, ca_yn
JMP ca_x
ca_yn:
ADD r2, r7
MOV r6, r2
SUB r6, r9
JZ r6, ca_done
JMP ca_y
ca_done:
RET

; random_fill: ~30% fill
random_fill:
LDI r2, 0
rf_y:
LDI r1, 0
rf_x:
RAND r6
LDI r17, 10
MOD r6, r17
LDI r17, 3
CMP r6, r17
BLT r0, rf_place
JMP rf_skip
rf_place:
MOV r15, r1
MOV r14, r2
PUSH r31
CALL set_cell
POP r31
rf_skip:
ADD r1, r7
MOV r6, r1
SUB r6, r9
JZ r6, rf_yn
JMP rf_x
rf_yn:
ADD r2, r7
MOV r6, r2
SUB r6, r9
JZ r6, rf_done
JMP rf_y
rf_done:
RET

; place_glider at cursor
place_glider:
LDI r15, 0x4002
LOAD r17, r15
LDI r15, 0x4003
LOAD r14, r15
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r14, r7
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r14, r7
SUB r17, r7
SUB r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
RET

; place_rpento at cursor
place_rpento:
LDI r15, 0x4002
LOAD r17, r15
LDI r15, 0x4003
LOAD r14, r15
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
SUB r17, r7
SUB r17, r7
ADD r14, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r14, r7
SUB r17, r7
PUSH r31
CALL set_cell
POP r31
RET

; place_acorn at cursor
place_acorn:
LDI r15, 0x4002
LOAD r17, r15
LDI r15, 0x4003
LOAD r14, r15
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r14, r7
SUB r17, r7
ADD r17, r7
ADD r17, r7
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r14, r7
SUB r17, r7
SUB r17, r7
SUB r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
ADD r17, r7
PUSH r31
CALL set_cell
POP r31
RET
