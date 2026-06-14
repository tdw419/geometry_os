; conway_advanced.asm -- Conway's Game of Life Advanced
; 64x64 grid, 4px cells, toroidal wrap, mouse support, 8 patterns
;
; Controls:
;   SPACE     Toggle cell at cursor
;   ENTER     Toggle run/pause
;   S         Single step while paused
;   1         Place Glider at cursor
;   2         Place R-pentomino at cursor
;   3         Place Acorn at cursor
;   4         Place LWSS at cursor
;   5         Place Toad at cursor
;   6         Place Beacon at cursor
;   7         Place Block at cursor
;   8         Place Diehard at cursor
;   C         Clear all cells
;   R         Random fill
;   +/=       Speed up
;   -         Slow down
;   Arrows/WASD Move cursor (note: S=single step, use arrow-down)
;   Mouse     Click to toggle cell at position
;   Q/Esc     Quit
;
; Memory:
;   0x2000    grid (4096: 64*64)
;   0x3000    temp grid (4096)
;   0x4000    generation counter
;   0x4001    flags (bit0=running, bit1=editing)
;   0x4002    cursor_x (0-63)
;   0x4003    cursor_y (0-63)
;   0x4004    speed divisor (1,2,4,8,16)

; ====== INIT ======

LDI r30, 0xFF00
LDI r7, 1
LDI r9, 64
LDI r10, 4
LDI r11, 0x2000
LDI r12, 0x3000
LDI r16, 0x00FF88
LDI r19, 63

; State init
LDI r15, 0x4000
LDI r17, 0
STORE r15, r17

LDI r15, 0x4001
LDI r17, 1
STORE r15, r17

LDI r15, 0x4002
LDI r17, 32
STORE r15, r17

LDI r15, 0x4003
LDI r17, 32
STORE r15, r17

LDI r15, 0x4004
LDI r17, 2
STORE r15, r17

; Clear grid
PUSH r31
CALL clear_all
POP r31

; ====== INITIAL PATTERNS ======

; Block at grid (3,3) -- still life
LDI r15, 3
LDI r14, 3
PUSH r31
CALL set_cell
POP r31
LDI r15, 4
PUSH r31
CALL set_cell
POP r31
LDI r14, 4
LDI r15, 3
PUSH r31
CALL set_cell
POP r31
LDI r15, 4
PUSH r31
CALL set_cell
POP r31

; Glider at grid (40,5)
LDI r15, 41
LDI r14, 5
PUSH r31
CALL set_cell
POP r31
LDI r15, 42
LDI r14, 6
PUSH r31
CALL set_cell
POP r31
LDI r15, 40
LDI r14, 7
PUSH r31
CALL set_cell
POP r31
LDI r15, 41
PUSH r31
CALL set_cell
POP r31
LDI r15, 42
PUSH r31
CALL set_cell
POP r31

; Toad at grid (15,3) -- period 2 oscillator
LDI r15, 16
LDI r14, 3
PUSH r31
CALL set_cell
POP r31
LDI r15, 17
PUSH r31
CALL set_cell
POP r31
LDI r15, 18
PUSH r31
CALL set_cell
POP r31
LDI r15, 15
LDI r14, 4
PUSH r31
CALL set_cell
POP r31
LDI r15, 16
PUSH r31
CALL set_cell
POP r31
LDI r15, 17
PUSH r31
CALL set_cell
POP r31

; Beacon at grid (25,3) -- period 2 oscillator
LDI r15, 25
LDI r14, 3
PUSH r31
CALL set_cell
POP r31
LDI r15, 26
PUSH r31
CALL set_cell
POP r31
LDI r14, 4
LDI r15, 25
PUSH r31
CALL set_cell
POP r31
LDI r15, 26
PUSH r31
CALL set_cell
POP r31
LDI r14, 5
LDI r15, 27
PUSH r31
CALL set_cell
POP r31
LDI r15, 28
PUSH r31
CALL set_cell
POP r31
LDI r14, 6
LDI r15, 27
PUSH r31
CALL set_cell
POP r31
LDI r15, 28
PUSH r31
CALL set_cell
POP r31

; R-pentomino at grid (30,30) -- methuselah
LDI r15, 31
LDI r14, 30
PUSH r31
CALL set_cell
POP r31
LDI r15, 32
PUSH r31
CALL set_cell
POP r31
LDI r14, 31
LDI r15, 30
PUSH r31
CALL set_cell
POP r31
LDI r15, 31
PUSH r31
CALL set_cell
POP r31
LDI r14, 32
LDI r15, 31
PUSH r31
CALL set_cell
POP r31

; ====== MAIN LOOP ======

main_loop:
  IKEY r20
  MOUSEQ r24

  ; --- Mouse handling ---
  JZ r26, no_mouse
  LDI r6, 2
  SHR r24, r6
  SHR r25, r6
  LDI r17, 0x4002
  STORE r17, r24
  LDI r17, 0x4003
  STORE r17, r25
  MOV r15, r24
  MOV r14, r25
  PUSH r31
  CALL toggle_cell
  POP r31
  no_mouse:

  ; --- Key handling ---
  JZ r20, skip_input

  ; SPACE = toggle cell
  LDI r21, 32
  CMP r20, r21
  JNZ r0, chk_enter
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  PUSH r31
  CALL toggle_cell
  POP r31
  JMP skip_input

chk_enter:
  LDI r21, 13
  CMP r20, r21
  JNZ r0, chk_s
  LDI r17, 0x4001
  LOAD r6, r17
  LDI r21, 1
  XOR r6, r21
  STORE r17, r6
  JMP skip_input

chk_s:
  LDI r21, 83
  CMP r20, r21
  JNZ r0, chk_1
  LDI r17, 0x4001
  LOAD r6, r17
  AND r6, r7
  JNZ r6, skip_input
  PUSH r31
  CALL compute_gen
  POP r31
  LDI r17, 0x4000
  LOAD r6, r17
  ADD r6, r7
  STORE r17, r6
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
  JNZ r0, chk_4
  PUSH r31
  CALL place_acorn
  POP r31
  JMP skip_input

chk_4:
  LDI r21, 52
  CMP r20, r21
  JNZ r0, chk_5
  PUSH r31
  CALL place_lwss
  POP r31
  JMP skip_input

chk_5:
  LDI r21, 53
  CMP r20, r21
  JNZ r0, chk_6
  PUSH r31
  CALL place_toad
  POP r31
  JMP skip_input

chk_6:
  LDI r21, 54
  CMP r20, r21
  JNZ r0, chk_7
  PUSH r31
  CALL place_beacon
  POP r31
  JMP skip_input

chk_7:
  LDI r21, 55
  CMP r20, r21
  JNZ r0, chk_8
  PUSH r31
  CALL place_block
  POP r31
  JMP skip_input

chk_8:
  LDI r21, 56
  CMP r20, r21
  JNZ r0, chk_c
  PUSH r31
  CALL place_diehard
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
  JNZ r0, chk_plus
  PUSH r31
  CALL random_fill
  POP r31
  JMP skip_input

chk_plus:
  LDI r21, 43
  CMP r20, r21
  JNZ r0, chk_eq
  LDI r17, 0x4004
  LOAD r6, r17
  LDI r21, 1
  CMP r6, r21
  JZ r0, skip_input
  LDI r21, 2
  DIV r6, r21
  STORE r17, r6
  JMP skip_input

chk_eq:
  LDI r21, 61
  CMP r20, r21
  JNZ r0, chk_minus
  LDI r17, 0x4004
  LOAD r6, r17
  LDI r21, 1
  CMP r6, r21
  JZ r0, skip_input
  LDI r21, 2
  DIV r6, r21
  STORE r17, r6
  JMP skip_input

chk_minus:
  LDI r21, 45
  CMP r20, r21
  JNZ r0, chk_arrows
  LDI r17, 0x4004
  LOAD r6, r17
  LDI r21, 16
  CMP r6, r21
  JZ r0, skip_input
  LDI r21, 2
  MUL r6, r21
  STORE r17, r6
  JMP skip_input

chk_arrows:
  LDI r21, 87
  CMP r20, r21
  JNZ r0, chk_up2
  LDI r17, 0x4003
  LOAD r6, r17
  SUB r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_up2:
  LDI r21, 17
  CMP r20, r21
  JNZ r0, chk_down
  LDI r17, 0x4003
  LOAD r6, r17
  SUB r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_down:
  LDI r21, 19
  CMP r20, r21
  JNZ r0, chk_left
  LDI r17, 0x4003
  LOAD r6, r17
  ADD r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_left:
  LDI r21, 65
  CMP r20, r21
  JNZ r0, chk_left2
  LDI r17, 0x4002
  LOAD r6, r17
  SUB r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_left2:
  LDI r21, 30
  CMP r20, r21
  JNZ r0, chk_right
  LDI r17, 0x4002
  LOAD r6, r17
  SUB r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_right:
  LDI r21, 68
  CMP r20, r21
  JNZ r0, chk_right2
  LDI r17, 0x4002
  LOAD r6, r17
  ADD r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
  JMP skip_input

chk_right2:
  LDI r21, 28
  CMP r20, r21
  JNZ r0, chk_esc
  LDI r17, 0x4002
  LOAD r6, r17
  ADD r6, r7
  ADD r6, r9
  AND r6, r19
  STORE r17, r6
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

  ; --- Speed throttle ---
  LDI r17, 0x4001
  LOAD r6, r17
  AND r6, r7
  JZ r6, do_render

  LDI r17, 0xFFE
  LOAD r8, r17
  LDI r17, 0x4004
  LOAD r6, r17
  SUB r6, r7
  AND r8, r6
  JNZ r8, do_render

  ; Compute generation
  PUSH r31
  CALL compute_gen
  POP r31

  ; Increment generation counter
  LDI r17, 0x4000
  LOAD r6, r17
  ADD r6, r7
  STORE r17, r6

do_render:
  PUSH r31
  CALL render_grid
  POP r31
  PUSH r31
  CALL draw_hud
  POP r31

  FRAME
  JMP main_loop

; ====== SUBROUTINES ======

; set_cell(x=r15, y=r14) -- set grid cell to 1 with wrap
set_cell:
  MOV r17, r14
  ADD r17, r9
  AND r17, r19
  LDI r8, 6
  SHL r17, r8
  MOV r18, r15
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LDI r18, 1
  STORE r17, r18
  RET

; toggle_cell(x=r15, y=r14) -- flip grid cell with wrap
toggle_cell:
  MOV r17, r14
  ADD r17, r9
  AND r17, r19
  LDI r8, 6
  SHL r17, r8
  MOV r18, r15
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  JZ r18, tc_set
  LDI r18, 0
  STORE r17, r18
  RET
tc_set:
  LDI r18, 1
  STORE r17, r18
  RET

; clear_all -- zero the grid
clear_all:
  LDI r2, 0
ca_y:
  LDI r1, 0
ca_x:
  MOV r17, r2
  LDI r8, 6
  SHL r17, r8
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
  LDI r1, 0
  ADD r2, r7
  MOV r6, r2
  SUB r6, r9
  JZ r6, ca_done
  JMP ca_y
ca_done:
  RET

; random_fill -- ~25% density
random_fill:
  LDI r2, 0
rf_y:
  LDI r1, 0
rf_x:
  RAND r6
  LDI r17, 4
  MOD r6, r17
  LDI r17, 1
  CMP r6, r17
  JNZ r0, rf_skip
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
  LDI r1, 0
  ADD r2, r7
  MOV r6, r2
  SUB r6, r9
  JZ r6, rf_done
  JMP rf_y
rf_done:
  RET

; compute_gen -- double-buffered generation step
compute_gen:
  PUSH r31
  LDI r8, 6
  LDI r2, 0
gen_y:
  LDI r1, 0
gen_x:
  ; Precompute wrapped coords
  MOV r3, r2
  ADD r3, r9
  AND r3, r19
  MOV r4, r1
  ADD r4, r9
  AND r4, r19

  LDI r6, 0

  ; Neighbor (-1, -1)
  MOV r17, r2
  SUB r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  MOV r18, r1
  SUB r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (0, -1)
  MOV r17, r2
  SUB r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  ADD r17, r4
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (+1, -1)
  MOV r17, r2
  SUB r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  MOV r18, r1
  ADD r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (-1, 0)
  MOV r17, r3
  SHL r17, r8
  MOV r18, r1
  SUB r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (+1, 0)
  MOV r17, r3
  SHL r17, r8
  MOV r18, r1
  ADD r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (-1, +1)
  MOV r17, r2
  ADD r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  MOV r18, r1
  SUB r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (0, +1)
  MOV r17, r2
  ADD r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  ADD r17, r4
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Neighbor (+1, +1)
  MOV r17, r2
  ADD r17, r7
  ADD r17, r9
  AND r17, r19
  SHL r17, r8
  MOV r18, r1
  ADD r18, r7
  ADD r18, r9
  AND r18, r19
  ADD r17, r18
  ADD r17, r11
  LOAD r18, r17
  ADD r6, r18

  ; Get current cell
  MOV r17, r3
  SHL r17, r8
  ADD r17, r4
  ADD r17, r11
  LOAD r18, r17

  ; Conway rules
  JZ r18, check_born
  LDI r17, 2
  CMP r6, r17
  JZ r0, write_alive
  LDI r17, 3
  CMP r6, r17
  JZ r0, write_alive
  JMP write_dead

check_born:
  LDI r17, 3
  CMP r6, r17
  JNZ r0, write_dead

write_alive:
  LDI r5, 1
  JMP write_temp

write_dead:
  LDI r5, 0

write_temp:
  MOV r17, r3
  SHL r17, r8
  ADD r17, r4
  ADD r17, r12
  STORE r17, r5

  ; Next cell
  ADD r1, r7
  MOV r17, r1
  SUB r17, r9
  JZ r17, gen_yn
  JMP gen_x

gen_yn:
  LDI r1, 0
  ADD r2, r7
  MOV r17, r2
  SUB r17, r9
  JZ r17, gen_copy
  JMP gen_y

; Copy temp back to grid
gen_copy:
  LDI r2, 0
cp_y:
  LDI r1, 0
cp_x:
  MOV r17, r2
  SHL r17, r8
  ADD r17, r1
  ADD r17, r12
  LOAD r18, r17
  MOV r17, r2
  SHL r17, r8
  ADD r17, r1
  ADD r17, r11
  STORE r17, r18
  ADD r1, r7
  MOV r17, r1
  SUB r17, r9
  JZ r17, cp_yn
  JMP cp_x
cp_yn:
  LDI r1, 0
  ADD r2, r7
  MOV r17, r2
  SUB r17, r9
  JZ r17, gen_done
  JMP cp_y
gen_done:
  POP r31
  RET

; render_grid -- draw grid to screen
render_grid:
  LDI r6, 0
  FILL r6
  LDI r2, 0
ry:
  LDI r1, 0
rx:
  MOV r17, r2
  LDI r8, 6
  SHL r17, r8
  ADD r17, r1
  ADD r17, r11
  LOAD r6, r17
  JZ r6, rx_skip
  MOV r3, r1
  LDI r6, 2
  SHL r3, r6
  MOV r4, r2
  SHL r4, r6
  RECTF r3, r4, r10, r10, r16
rx_skip:
  ADD r1, r7
  MOV r6, r1
  SUB r6, r9
  JZ r6, ry_next
  JMP rx
ry_next:
  LDI r1, 0
  ADD r2, r7
  MOV r6, r2
  SUB r6, r9
  JZ r6, ry_done
  JMP ry
ry_done:
  RET

; draw_hud -- generation bar at top
draw_hud:
  LDI r17, 0x4000
  LOAD r3, r17
  LDI r17, 63
  AND r3, r17
  JZ r3, hud_done
  LDI r4, 0
  LDI r5, 2
  LDI r6, 0
  LDI r8, 0xFFFF00
  RECTF r6, r4, r3, r5, r8
hud_done:
  RET

; ====== PATTERN PLACEMENT ======

; place_glider at cursor -- .X./..X/XXX
place_glider:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_rpento at cursor -- .XX/XX./.X.
place_rpento:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_acorn at cursor -- .#...../...#.../##..###
place_acorn:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_lwss at cursor -- .#..#/#..../#...#/.####
place_lwss:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_toad at cursor -- .###/###.
place_toad:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_beacon at cursor -- ##../##..../##../..##
place_beacon:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_block at cursor -- ##
place_block:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET

; place_diehard at cursor -- ......#./##....../.#...###
place_diehard:
  LDI r17, 0x4002
  LOAD r15, r17
  LDI r17, 0x4003
  LOAD r14, r17
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  SUB r15, r7
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r14, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  ADD r15, r7
  PUSH r31
  CALL set_cell
  POP r31
  RET
