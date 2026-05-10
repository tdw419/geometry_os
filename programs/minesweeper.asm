; minesweeper.asm -- Minesweeper on a 16x16 grid (16px per cell = 256x256)
;
; Memory layout:
;   0x2000..0x20FF  grid: 256 cells, each u32 packed:
;     bits 0-2: mine count (0-8)
;     bit 3:    is_mine
;     bit 4:    is_revealed
;     bit 5:    is_flagged
;   0x2100         cursor_x (0-15)
;   0x2101         cursor_y (0-15)
;   0x2102         game_over (0=playing, 1=loss, 2=win)
;   0x2103         first_click (1=awaiting first click)
;   0x2106         flags_placed count
;   0x2200..0x22FF  flood fill stack (up to 256 entries)
;   0x2300         flood stack pointer
;
; Register conventions:
;   r7  = constant 1 (set at init)
;   r16 = constant 16 (grid dimension, set at init)
;   r21 = temp for draw
;
; Controls: Arrows=move, Space=reveal, F=flag, R=restart

; ── restart ───────────────────────────────────────────────────────
restart:
  LDI r30, 0x8000
  LDI r7, 1
  LDI r16, 16

  ; clear grid
  LDI r4, 0x2000
  LDI r5, 256
  LDI r6, 0
clr_grid:
  STORE r4, r6
  ADD r4, r7
  SUB r5, r7
  JNZ r5, clr_grid

  ; cursor at center
  LDI r1, 7
  LDI r4, 0x2100
  STORE r4, r1
  STORE r4, r1

  LDI r4, 0x2101
  STORE r4, r1

  ; game state
  LDI r1, 0
  LDI r4, 0x2102
  STORE r4, r1
  LDI r4, 0x2103
  STORE r4, r1
  LDI r4, 0x2106
  STORE r4, r1

  JMP game_loop

; ── main loop ─────────────────────────────────────────────────────
game_loop:
  LDI r4, 0x2102
  LOAD r1, r4
  JNZ r1, game_over_screen

  CALL draw_frame
  CALL draw_cursor

  ; throttle input to every 4 frames
  LDI r4, 0xFFE
  LOAD r8, r4
  LDI r9, 3
  AND r8, r9
  JNZ r8, no_input

  IKEY r7
  JZ r7, no_input

  ; check arrow key bitmask port
  LDI r4, 0xFFB
  LOAD r6, r4

  ; up
  LDI r9, 1
  AND r9, r6
  JNZ r9, move_up
  ; down
  LDI r9, 2
  AND r9, r6
  JNZ r9, move_down
  ; left
  LDI r9, 4
  AND r9, r6
  JNZ r9, move_left
  ; right
  LDI r9, 8
  AND r9, r6
  JNZ r9, move_right

  ; space = reveal
  LDI r9, 32
  CMP r7, r9
  JZ r0, do_reveal

  ; F/f = flag
  LDI r9, 70
  CMP r7, r9
  JZ r0, do_flag
  LDI r9, 102
  CMP r7, r9
  JZ r0, do_flag

  ; R/r = restart
  LDI r9, 82
  CMP r7, r9
  JZ r0, restart
  LDI r9, 114
  CMP r7, r9
  JZ r0, restart

  LDI r7, 1
  JMP no_input

move_up:
  LDI r4, 0x2101
  LOAD r1, r4
  JZ r1, no_input
  LDI r7, 1
  SUB r1, r7
  STORE r4, r1
  JMP no_input

move_down:
  LDI r4, 0x2101
  LOAD r1, r4
  LDI r9, 15
  CMP r1, r9
  BGE r0, no_input
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  JMP no_input

move_left:
  LDI r4, 0x2100
  LOAD r1, r4
  JZ r1, no_input
  LDI r7, 1
  SUB r1, r7
  STORE r4, r1
  JMP no_input

move_right:
  LDI r4, 0x2100
  LOAD r1, r4
  LDI r9, 15
  CMP r1, r9
  BGE r0, no_input
  LDI r7, 1
  ADD r1, r7
  STORE r4, r1
  JMP no_input

do_reveal:
  LDI r7, 1
  LDI r4, 0x2103
  LOAD r1, r4
  JZ r1, reveal_cell
  LDI r1, 0
  STORE r4, r1
  CALL generate_mines
  CALL calc_adjacency
  JMP reveal_cell

do_flag:
  LDI r7, 1
  CALL toggle_flag
  JMP no_input

no_input:
  FRAME
  JMP game_loop

; ── reveal cell ───────────────────────────────────────────────────
reveal_cell:
  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4

  ; index = y*16 + x
  MUL r11, r16
  ADD r11, r10

  LDI r4, 0x2000
  ADD r4, r11
  LOAD r12, r4

  ; already revealed?
  LDI r9, 16
  AND r9, r12
  JNZ r9, no_input

  ; flagged?
  LDI r9, 32
  AND r9, r12
  JNZ r9, no_input

  ; mine?
  LDI r9, 8
  AND r9, r12
  JNZ r9, hit_mine

  ; reveal
  LDI r9, 16
  OR r12, r9
  STORE r4, r12

  ; count=0 triggers flood fill
  LDI r9, 7
  AND r9, r12
  JZ r9, do_flood_fill

  CALL check_win
  JMP no_input

; ── flood fill ────────────────────────────────────────────────────
do_flood_fill:
  LDI r4, 0x2300
  LDI r9, 0
  STORE r4, r9

  ; push initial cell
  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4
  PUSH r31
  CALL fpush

ff_loop:
  LDI r4, 0x2300
  LOAD r1, r4
  JZ r1, ff_done

  PUSH r31
  CALL fpop            ; r10=x, r11=y

  ; bounds
  CMP r10, r16
  BGE r0, ff_loop
  CMP r11, r16
  BGE r0, ff_loop

  ; index
  MOV r12, r10
  MUL r12, r16
  ADD r12, r11

  LDI r4, 0x2000
  ADD r4, r12
  LOAD r13, r4

  ; skip revealed / mine / flagged
  LDI r9, 16
  AND r9, r13
  JNZ r9, ff_loop
  LDI r9, 8
  AND r9, r13
  JNZ r9, ff_loop
  LDI r9, 32
  AND r9, r13
  JNZ r9, ff_loop

  ; reveal
  LDI r9, 16
  OR r13, r9
  STORE r4, r13

  ; if count > 0, stop expanding
  LDI r9, 7
  AND r9, r13
  JNZ r9, ff_loop

  ; push 8 neighbors
  ; up
  JZ r11, ff_no_up
  SUB r11, r7
  PUSH r31
  CALL fpush
  ADD r11, r7
ff_no_up:
  ; down
  LDI r9, 15
  CMP r11, r9
  BGE r0, ff_no_down
  ADD r11, r7
  PUSH r31
  CALL fpush
  SUB r11, r7
ff_no_down:
  ; left
  JZ r10, ff_no_left
  SUB r10, r7
  PUSH r31
  CALL fpush
  ADD r10, r7
ff_no_left:
  ; right
  LDI r9, 15
  CMP r10, r9
  BGE r0, ff_no_right
  ADD r10, r7
  PUSH r31
  CALL fpush
  SUB r10, r7
ff_no_right:
  ; up-left
  JZ r10, ff_no_ul
  JZ r11, ff_no_ul
  SUB r10, r7
  SUB r11, r7
  PUSH r31
  CALL fpush
  ADD r10, r7
  ADD r11, r7
ff_no_ul:
  ; up-right
  LDI r9, 15
  CMP r10, r9
  BGE r0, ff_no_ur
  JZ r11, ff_no_ur
  ADD r10, r7
  SUB r11, r7
  PUSH r31
  CALL fpush
  SUB r10, r7
  ADD r11, r7
ff_no_ur:
  ; down-left
  JZ r10, ff_no_dl
  LDI r9, 15
  CMP r11, r9
  BGE r0, ff_no_dl
  SUB r10, r7
  ADD r11, r7
  PUSH r31
  CALL fpush
  ADD r10, r7
  SUB r11, r7
ff_no_dl:
  ; down-right
  LDI r9, 15
  CMP r10, r9
  BGE r0, ff_no_dr
  LDI r9, 15
  CMP r11, r9
  BGE r0, ff_no_dr
  ADD r10, r7
  ADD r11, r7
  PUSH r31
  CALL fpush
  SUB r10, r7
  SUB r11, r7
ff_no_dr:

  JMP ff_loop

ff_done:
  POP r31
  CALL check_win
  JMP no_input

; ── flood stack ops ───────────────────────────────────────────────
; fpush: push (r10, r11) as (x<<4)|y
fpush:
  LDI r4, 0x2300
  LOAD r1, r4
  LDI r9, 256
  CMP r1, r9
  BGE r0, fpush_ret
  MOV r12, r10
  SHL r12, r7
  SHL r12, r7
  SHL r12, r7
  SHL r12, r7
  OR r12, r11
  LDI r5, 0x2200
  ADD r5, r1
  STORE r5, r12
  ADD r1, r7
  STORE r4, r1
fpush_ret:
  RET

; fpop: pop -> (r10=x, r11=y)
fpop:
  LDI r4, 0x2300
  LOAD r1, r4
  JZ r1, fpop_ret
  SUB r1, r7
  STORE r4, r1
  LDI r5, 0x2200
  ADD r5, r1
  LOAD r12, r5
  LDI r9, 15
  AND r11, r12
  LDI r9, 4
  SHR r10, r9
  LDI r9, 4
  SHR r10, r9
  LDI r9, 4
  SHR r10, r9
  LDI r9, 4
  SHR r10, r9
fpop_ret:
  RET

; ── hit mine ──────────────────────────────────────────────────────
hit_mine:
  LDI r4, 0x2000
  LDI r5, 256

hm_loop:
  LOAD r1, r4
  LDI r9, 8
  AND r9, r1
  JZ r9, hm_next
  LDI r9, 16
  OR r1, r9
  STORE r4, r1
hm_next:
  ADD r4, r7
  SUB r5, r7
  JNZ r5, hm_loop

  LDI r1, 1
  LDI r4, 0x2102
  STORE r4, r1
  JMP no_input

; ── toggle flag ───────────────────────────────────────────────────
toggle_flag:
  PUSH r31
  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4

  MOV r12, r10
  MUL r12, r16
  ADD r12, r11

  LDI r4, 0x2000
  ADD r4, r12
  LOAD r13, r4

  LDI r9, 16
  AND r9, r13
  JNZ r9, flag_done

  LDI r9, 32
  XOR r13, r9
  STORE r4, r13

  LDI r4, 0x2106
  LOAD r1, r4
  LDI r9, 32
  AND r9, r13
  JZ r9, flag_dec
  ADD r1, r7
  LDI r4, 0x2106
  STORE r4, r1
  JMP flag_done
flag_dec:
  SUB r1, r7
  LDI r4, 0x2106
  STORE r4, r1
flag_done:
  POP r31
  RET

; ── generate mines ────────────────────────────────────────────────
generate_mines:
  PUSH r31

  ; clear grid
  LDI r4, 0x2000
  LDI r5, 256
  LDI r6, 0
gm_clr:
  STORE r4, r6
  ADD r4, r7
  SUB r5, r7
  JNZ r5, gm_clr

  ; safe zone = cursor +- 1
  LDI r4, 0x2100
  LOAD r14, r4
  LDI r4, 0x2101
  LOAD r15, r4

  LDI r20, 40           ; mines to place

gm_loop:
  JZ r20, gm_done

  RAND r10
  LDI r9, 15
  AND r10, r9
  RAND r11
  LDI r9, 15
  AND r11, r9

  ; check safe zone: |dx|<=1 AND |dy|<=1
  MOV r12, r10
  CMP r12, r14
  BLT r0, gm_sx_lo
  SUB r12, r14
  LDI r9, 1
  CMP r12, r9
  BGE r0, gm_try
  JMP gm_sy

gm_sx_lo:
  MOV r12, r14
  SUB r12, r10
  LDI r9, 1
  CMP r12, r9
  BGE r0, gm_try

gm_sy:
  MOV r12, r11
  CMP r12, r15
  BLT r0, gm_sy_lo
  SUB r12, r15
  LDI r9, 1
  CMP r12, r9
  BGE r0, gm_try
  JMP gm_check

gm_sy_lo:
  MOV r12, r15
  SUB r12, r11
  LDI r9, 1
  CMP r12, r9
  BGE r0, gm_try

gm_check:
  MOV r12, r10
  MUL r12, r16
  ADD r12, r11
  LDI r4, 0x2000
  ADD r4, r12
  LOAD r13, r4
  LDI r9, 8
  AND r9, r13
  JNZ r9, gm_try

  ; place mine
  LDI r9, 8
  OR r13, r9
  STORE r4, r13
  SUB r20, r7
  JMP gm_loop

gm_try:
  JMP gm_loop

gm_done:
  POP r31
  RET

; ── calc adjacency ────────────────────────────────────────────────
calc_adjacency:
  PUSH r31

  LDI r18, 0            ; y

ca_y:
  LDI r17, 0            ; x

ca_x:
  MOV r12, r17
  MUL r12, r16
  ADD r12, r18

  LDI r4, 0x2000
  ADD r4, r12
  LOAD r13, r4

  LDI r9, 8
  AND r9, r13
  JNZ r9, ca_next       ; skip mines

  ; count neighboring mines
  LDI r19, 0            ; count

  ; iterate 8 neighbors using dy=-1..1, dx=-1..1
  LDI r21, 0            ; dy_idx (0=-1, 1=0, 2=1)
ca_dy:
  ; compute ny
  MOV r22, r18
  JZ r21, ca_dy_m1
  LDI r9, 1
  CMP r21, r9
  JZ r0, ca_dy_0
  ADD r22, r7
  JMP ca_dy_chk
ca_dy_m1:
  JZ r18, ca_dy_nxt
  SUB r22, r7
  JMP ca_dy_chk
ca_dy_0:
  ; ny = y (r22 already = r18)
ca_dy_chk:
  CMP r22, r16
  BGE r0, ca_dy_nxt

  LDI r23, 0            ; dx_idx
ca_dx:
  MOV r24, r17
  JZ r23, ca_dx_m1
  LDI r9, 1
  CMP r23, r9
  JZ r0, ca_dx_0
  ADD r24, r7
  JMP ca_dx_chk
ca_dx_m1:
  JZ r17, ca_dx_nxt
  SUB r24, r7
  JMP ca_dx_chk
ca_dx_0:
ca_dx_chk:
  CMP r24, r16
  BGE r0, ca_dx_nxt

  MOV r25, r24
  MUL r25, r16
  ADD r25, r22
  LDI r4, 0x2000
  ADD r4, r25
  LOAD r26, r4
  LDI r9, 8
  AND r9, r26
  JZ r9, ca_dx_nxt2
  ADD r19, r7
ca_dx_nxt2:
  ADD r23, r7
  LDI r9, 3
  CMP r23, r9
  BLT r0, ca_dx
ca_dx_nxt:
  ADD r21, r7
  LDI r9, 3
  CMP r21, r9
  BLT r0, ca_dy
ca_dy_nxt:

  ; store count
  LDI r9, 7
  AND r13, r9           ; clear count bits
  LDI r9, 7
  AND r19, r9
  OR r13, r19
  LDI r4, 0x2000
  ADD r4, r12
  STORE r4, r13

ca_next:
  ADD r17, r7
  CMP r17, r16
  BLT r0, ca_x
  ADD r18, r7
  CMP r18, r16
  BLT r0, ca_y

  POP r31
  RET

; ── check win ─────────────────────────────────────────────────────
check_win:
  PUSH r31
  LDI r4, 0x2000
  LDI r5, 256
cw_loop:
  LOAD r1, r4
  LDI r9, 8
  AND r9, r1
  JNZ r9, cw_next       ; mine, skip
  LDI r9, 16
  AND r9, r1
  JNZ r9, cw_next       ; revealed, ok
  POP r31
  RET                   ; found unrevealed non-mine
cw_next:
  ADD r4, r7
  SUB r5, r7
  JNZ r5, cw_loop

  LDI r1, 2
  LDI r4, 0x2102
  STORE r4, r1
  POP r31
  RET

; ── game over screen ──────────────────────────────────────────────
game_over_screen:
  CALL draw_frame
  CALL draw_cursor

  LDI r4, 0x2102
  LOAD r1, r4
  LDI r9, 2
  CMP r1, r9
  JZ r0, go_win
  LDI r1, 0x440000
  FILL r1
  FRAME
  JMP go_input
go_win:
  LDI r1, 0x004400
  FILL r1
  FRAME
go_input:
  IKEY r7
  JZ r7, go_input
  LDI r9, 82
  CMP r7, r9
  JZ r0, restart
  LDI r9, 114
  CMP r7, r9
  JZ r0, restart
  LDI r9, 13
  CMP r7, r9
  JZ r0, restart
  JMP go_input

; ── draw frame ────────────────────────────────────────────────────
draw_frame:
  PUSH r31
  LDI r7, 1
  LDI r16, 16

  LDI r1, 0x202020
  FILL r1

  LDI r18, 0            ; y

df_y:
  LDI r17, 0            ; x

df_x:
  MOV r12, r17
  MUL r12, r16
  ADD r12, r18

  LDI r4, 0x2000
  ADD r4, r12
  LOAD r13, r4

  ; screen position
  MOV r14, r17
  MUL r14, r16
  MOV r15, r18
  MUL r15, r16

  ; revealed?
  LDI r9, 16
  AND r9, r13
  JNZ r9, df_revealed

  ; flagged?
  LDI r9, 32
  AND r9, r13
  JNZ r9, df_flagged

  ; hidden
  LDI r1, 0x404040
  RECTF r14, r15, r16, r16, r1
  JMP df_next

df_flagged:
  LDI r1, 0xCC0000
  RECTF r14, r15, r16, r16, r1
  ; flag marker (small white square at center)
  LDI r2, 6
  ADD r14, r2
  ADD r15, r2
  LDI r1, 0xFFFFFF
  LDI r9, 4
  RECTF r14, r15, r9, r9, r1
  JMP df_next

df_revealed:
  ; mine?
  LDI r9, 8
  AND r9, r13
  JNZ r9, df_mine

  ; count
  LDI r9, 7
  AND r9, r13

  JZ r9, df_zero
  JMP df_num

df_zero:
  LDI r1, 0x808080
  RECTF r14, r15, r16, r16, r1
  JMP df_next

df_num:
  ; base: light gray cell
  LDI r1, 0x808080
  RECTF r14, r15, r16, r16, r1

  ; colored bar at top: height = count * 2
  MOV r21, r9           ; save count
  LDI r9, 2
  MUL r21, r9           ; height

  ; color by count
  LDI r9, 7
  AND r9, r13
  LDI r3, 1
  CMP r9, r3
  JZ r0, nc1
  LDI r3, 2
  CMP r9, r3
  JZ r0, nc2
  LDI r3, 3
  CMP r9, r3
  JZ r0, nc3
  LDI r3, 4
  CMP r9, r3
  JZ r0, nc4
  LDI r3, 5
  CMP r9, r3
  JZ r0, nc5
  LDI r3, 6
  CMP r9, r3
  JZ r0, nc6
  LDI r3, 7
  CMP r9, r3
  JZ r0, nc7
  ; 8
  LDI r1, 0x888888
  JMP nc_draw
nc1: LDI r1, 0x0000FF
  JMP nc_draw
nc2: LDI r1, 0x00CC00
  JMP nc_draw
nc3: LDI r1, 0xFF0000
  JMP nc_draw
nc4: LDI r1, 0x000088
  JMP nc_draw
nc5: LDI r1, 0x880000
  JMP nc_draw
nc6: LDI r1, 0x00CCCC
  JMP nc_draw
nc7: LDI r1, 0x222222
  JMP nc_draw
nc_draw:
  RECTF r14, r15, r16, r21, r1
  JMP df_next

df_mine:
  LDI r1, 0xFF0000
  RECTF r14, r15, r16, r16, r1
  ; mine indicator: dark square at center
  LDI r2, 6
  ADD r14, r2
  ADD r15, r2
  LDI r1, 0x000000
  LDI r9, 4
  RECTF r14, r15, r9, r9, r1
  JMP df_next

df_next:
  ADD r17, r7
  CMP r17, r16
  BLT r0, df_x
  ADD r18, r7
  CMP r18, r16
  BLT r0, df_y

  POP r31
  RET

; ── draw cursor ───────────────────────────────────────────────────
draw_cursor:
  PUSH r31
  LDI r7, 1
  LDI r16, 16

  LDI r4, 0x2100
  LOAD r10, r4
  LDI r4, 0x2101
  LOAD r11, r4

  MOV r14, r10
  MUL r14, r16
  MOV r15, r11
  MUL r15, r16

  LDI r1, 0xFFFF00
  LDI r9, 2

  ; top
  RECTF r14, r15, r16, r9, r1
  ; bottom
  MOV r2, r15
  LDI r3, 14
  ADD r2, r3
  RECTF r14, r2, r16, r9, r1
  ; left
  RECTF r14, r15, r9, r16, r1
  ; right
  MOV r2, r14
  ADD r2, r3
  RECTF r2, r15, r9, r16, r1

  POP r31
  RET
