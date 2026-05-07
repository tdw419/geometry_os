; RAYCAST3D -- Wolfenstein-style 3D raycasting engine
; WASD controls: W=forward S=backward A=left D=right
; 8.8 fixed-point, 16x16 tile map, 256x256 screen
; Uses 64-entry cosine lookup table (4-degree resolution)
; dir_y derived from table via 90-degree index offset

; Memory map:
; 0x3000-0x30FF: Map (16x16, 1=wall, 0=floor)
; 0x3100: player_x (8.8 fp)
; 0x3101: player_y (8.8 fp)
; 0x3102: player_angle (0-255)

; === SKIP TABLE, GO TO INIT ===
JMP init

; === INITIALIZATION ===
init:
  ; Build cosine lookup table (64 entries at 0x3500)
  ; table[i] = cos(i * pi/32) * 256 (8.8 fixed-point)
  LDI r1, 0x3500       ; dir_cos table base
  LDI r2, 1             ; increment
  LDI r3, 0x00000100
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000FF
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000FB
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000F5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000ED
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000E2
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000D5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000C6
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000B5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000A2
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x0000008E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000079
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000062
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x0000004A
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000032
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000019
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000000
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFE7
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFCE
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFB6
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF9E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF87
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF72
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF5E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF4B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF3A
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF2B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF1E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF13
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF0B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF05
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF01
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF00
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF01
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF05
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF0B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF13
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF1E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF2B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF3A
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF4B
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF5E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF72
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF87
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFF9E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFB6
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFCE
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0xFFFFFFE7
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000000
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000019
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000032
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x0000004A
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000062
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x00000079
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x0000008E
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000A2
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000B5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000C6
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000D5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000E2
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000ED
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000F5
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000FB
  STORE r1, r3
  ADD r1, r2
  LDI r3, 0x000000FF
  STORE r1, r3

  ; -- Fill map with 0 (floor) --
  LDI r20, 0x3000
  LDI r21, 0
  LDI r22, 256
  LDI r1, 1
fill_map:
  STORE r20, r21
  ADD r20, r1
  SUB r22, r1
  LDI r2, 0
  ADD r2, r22
  JZ r2, bdr_top
  JMP fill_map

  ; -- Border walls --
bdr_top:
  LDI r20, 0x3000
  LDI r21, 1
  LDI r22, 16
bdr_top_lp:
  STORE r20, r21
  ADD r20, r1
  SUB r22, r1
  LDI r2, 0
  ADD r2, r22
  JZ r2, bdr_bot
  JMP bdr_top_lp

bdr_bot:
  LDI r20, 0x30F0
  LDI r22, 16
bdr_bot_lp:
  STORE r20, r21
  ADD r20, r1
  SUB r22, r1
  LDI r2, 0
  ADD r2, r22
  JZ r2, bdr_left
  JMP bdr_bot_lp

bdr_left:
  LDI r20, 0x3010
  LDI r22, 14
bdr_left_lp:
  STORE r20, r21
  LDI r2, 16
  ADD r20, r2
  SUB r22, r1
  LDI r2, 0
  ADD r2, r22
  JZ r2, bdr_right
  JMP bdr_left_lp

bdr_right:
  LDI r20, 0x301F
  LDI r22, 14
bdr_right_lp:
  STORE r20, r21
  LDI r2, 16
  ADD r20, r2
  SUB r22, r1
  LDI r2, 0
  ADD r2, r22
  JZ r2, init_walls
  JMP bdr_right_lp

  ; -- Interior walls --
init_walls:
  LDI r20, 0x3000
  LDI r21, 1
  LDI r1, 0x0034
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x0035
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x0036
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x0037
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x0044
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x0054
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00A4
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00B4
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00C4
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00C5
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00C6
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x00C7
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x006A
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x006B
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x006C
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x007A
  ADD r1, r20
  STORE r1, r21
  LDI r1, 0x008A
  ADD r1, r20
  STORE r1, r21

  ; -- Player start: pos=(2.5, 7.5) angle=0 --
  LDI r1, 0x3100
  LDI r2, 640
  STORE r1, r2
  LDI r1, 0x3101
  LDI r2, 1920
  STORE r1, r2
  LDI r1, 0x3102
  LDI r2, 0
  STORE r1, r2

  JMP game_loop

; === MAIN GAME LOOP ===
game_loop:
  ; Load player state
  LDI r1, 0x3100
  LOAD r20, r1       ; r20 = player_x
  LDI r1, 0x3101
  LOAD r21, r1       ; r21 = player_y
  LDI r1, 0x3102
  LOAD r22, r1       ; r22 = angle (0-255)

  ; Look up dir_x from cosine table
  ; table_idx = angle >> 2
  MOV r1, r22
  LDI r2, 2
  SHR r1, r2         ; r1 = table_idx (0-63)
  LDI r2, 0x3500
  ADD r2, r1
  LOAD r23, r2       ; r23 = dir_x

  ; dir_y = table[(table_idx + 48) & 63]
  ; 48 = -16 mod 64 (90-degree phase shift)
  LDI r2, 48
  ADD r1, r2
  LDI r2, 63
  AND r1, r2         ; r1 = (idx + 48) & 63
  LDI r2, 0x3500
  ADD r2, r1
  LOAD r24, r2       ; r24 = dir_y

  ; Camera plane (perpendicular, FOV ~66 degrees)
  ; plane_x = -dir_y * 169 >> 8
  ; plane_y = dir_x * 169 >> 8
  MOV r1, r24
  LDI r2, 169
  MUL r1, r2
  LDI r2, 8
  SAR r1, r2
  NEG r1
  MOV r25, r1       ; r25 = plane_x

  MOV r1, r23
  LDI r2, 169
  MUL r1, r2
  SAR r1, r2
  MOV r26, r1       ; r26 = plane_y

  ; Draw ceiling
  LDI r1, 0x222244
  LDI r2, 0
  LDI r3, 0
  LDI r4, 256
  LDI r5, 128
  RECTF r2, r3, r4, r5, r1

  ; Draw floor
  LDI r1, 0x443322
  LDI r3, 128
  RECTF r2, r3, r4, r5, r1

  ; === COLUMN LOOP ===
  LDI r10, 0        ; column x
col_loop:
  ; camera_x = 2*x - 256 (8.8)
  MOV r11, r10
  LDI r1, 2
  MUL r11, r1
  LDI r1, 256
  SUB r11, r1       ; r11 = camera_x

  ; ray_dir_x = dir_x + (plane_x * camera_x >> 8)
  MOV r1, r25
  MUL r1, r11
  LDI r2, 8
  SHR r1, r2
  ADD r1, r23
  MOV r12, r1       ; r12 = ray_dir_x

  ; ray_dir_y = dir_y + (plane_y * camera_x >> 8)
  MOV r1, r26
  MUL r1, r11
  SAR r1, r2
  ADD r1, r24
  MOV r13, r1       ; r13 = ray_dir_y

  ; |ray_dir_x|
  MOV r8, r12
  MOV r1, r8
  LDI r2, 31
  SAR r1, r2
  XOR r8, r1
  SUB r8, r1

  ; |ray_dir_y|
  MOV r9, r13
  MOV r1, r9
  SAR r1, r2
  XOR r9, r1
  SUB r9, r1

  ; delta_dist_x = 65536 / |rdx|
  JZ r8, ddx_inf
  LDI r18, 65536
  DIV r18, r8
  JMP ddy_calc
ddx_inf:
  LDI r18, 0x7FFFFFFF

ddy_calc:
  ; delta_dist_y = 65536 / |rdy|
  JZ r9, ddy_inf
  LDI r19, 65536
  DIV r19, r9
  JMP sdist_init
ddy_inf:
  LDI r19, 0x7FFFFFFF

  ; DDA init
sdist_init:
  MOV r14, r20
  LDI r2, 8
  SHR r14, r2       ; r14 = map_x

  MOV r15, r21
  SHR r15, r2       ; r15 = map_y

  ; step_x
  LDI r1, 0
  CMP r12, r1
  LDI r28, 1
  BLT r0, sx_neg
  JMP sy_step
sx_neg:
  LDI r28, 0xFFFFFFFF

  ; step_y
  LDI r2, 8             ; restore shift amount for SHL
sy_step:
  CMP r13, r1
  LDI r29, 1
  BLT r0, sy_neg
  JMP sdx_calc
sy_neg:
  LDI r29, 0xFFFFFFFF

  ; side_dist_x
sdx_calc:
  CMP r12, r1
  BGE r0, sdx_pos
  MOV r3, r20
  MOV r4, r14
  SHL r4, r2
  SUB r3, r4
  MUL r3, r18
  SHR r3, r2
  MOV r16, r3
  JMP sdy_calc
sdx_pos:
  MOV r3, r14
  LDI r4, 1
  ADD r3, r4
  SHL r3, r2
  SUB r3, r20
  MUL r3, r18
  SHR r3, r2
  MOV r16, r3

  LDI r2, 8             ; ensure shift amount
  ; side_dist_y
sdy_calc:
  CMP r13, r1
  BGE r0, sdy_pos
  MOV r3, r21
  MOV r4, r15
  SHL r4, r2
  SUB r3, r4
  MUL r3, r19
  SHR r3, r2
  MOV r17, r3
  JMP dda_loop
sdy_pos:
  MOV r3, r15
  LDI r4, 1
  ADD r3, r4
  SHL r3, r2
  SUB r3, r21
  MUL r3, r19
  SHR r3, r2
  MOV r17, r3

  ; DDA loop
dda_loop:
  CMP r16, r17
  BLT r0, dda_x
  ADD r17, r19
  ADD r15, r29
  LDI r27, 1
  JMP dda_chk
dda_x:
  ADD r16, r18
  ADD r14, r28
  LDI r27, 0

dda_chk:
  MOV r3, r15
  LDI r4, 4
  SHL r3, r4
  ADD r3, r14
  LDI r4, 0x3000
  ADD r3, r4
  LOAD r3, r3
  JZ r3, dda_loop

  ; Perpendicular distance
  LDI r1, 0
  CMP r27, r1
  JNZ r27, perp_y
perp_x:
  MOV r1, r14
  LDI r2, 8
  SHL r1, r2
  SUB r1, r20
  LDI r2, 1
  CMP r28, r2
  JNZ r0, adj_x
  JMP abs_n
adj_x:
  LDI r2, 256
  ADD r1, r2
abs_n:
  MOV r2, r1
  LDI r3, 31
  SAR r2, r3
  XOR r1, r2
  SUB r1, r2
  SHL r1, r3
  JZ r8, next_col
  DIV r1, r8
  JMP wall_h
perp_y:
  MOV r1, r15
  LDI r2, 8
  SHL r1, r2
  SUB r1, r21
  LDI r2, 1
  CMP r29, r2
  JNZ r0, adj_y
  JMP abs_ny
adj_y:
  LDI r2, 256
  ADD r1, r2
abs_ny:
  MOV r2, r1
  LDI r3, 31
  SAR r2, r3
  XOR r1, r2
  SUB r1, r2
  SHL r1, r3
  JZ r9, next_col
  DIV r1, r9

wall_h:
  ; r1 = perp_dist
  JZ r1, next_col

  ; line_height = 65536 / perp_dist
  LDI r2, 65536
  DIV r2, r1

  ; half = line_height / 2
  LDI r3, 2
  DIV r2, r3        ; r2 = half_height

  ; draw_start = max(128 - half, 0)
  LDI r3, 128
  SUB r3, r2
  MOV r4, r3
  LDI r5, 31
  SAR r4, r5
  JZ r4, ds_ok
  LDI r3, 0
ds_ok:
  ; draw_end = min(128 + half, 256)
  LDI r4, 128
  ADD r4, r2
  LDI r5, 256
  CMP r4, r5
  BLT r0, de_ok
  LDI r4, 256
de_ok:
  ; height = end - start
  SUB r4, r3
  JZ r4, next_col

  ; Wall color by side
  LDI r5, 0xCC6633
  LDI r1, 0
  CMP r27, r1
  JNZ r0, ew_col
  JMP do_rect
ew_col:
  LDI r5, 0x884422
do_rect:
  LDI r1, 1
  RECTF r10, r3, r1, r4, r5

next_col:
  ADD r10, r1
  LDI r2, 256
  CMP r10, r2
  BLT r0, col_loop

  ; === INPUT HANDLING ===
  IKEY r8
  JZ r8, store_st

  ; W (87) forward
  LDI r1, 87
  CMP r8, r1
  JNZ r0, chk_s
  ; move_x = dir_x * speed >> 8
  MOV r1, r23
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  ADD r20, r1
  ; collision check x
  MOV r1, r20
  SHR r1, r2
  MOV r2, r21
  SHR r2, r2
  LDI r3, 4
  SHL r2, r3
  ADD r2, r1
  LDI r3, 0x3000
  ADD r2, r3
  LOAD r2, r2
  JNZ r2, undo_fx
  JMP chk_fy
undo_fx:
  MOV r1, r23
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  SUB r20, r1
chk_fy:
  MOV r1, r24
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  ADD r21, r1
  MOV r1, r20
  LDI r2, 8
  SHR r1, r2
  MOV r2, r21
  SHR r2, r2
  LDI r3, 4
  SHL r2, r3
  ADD r2, r1
  LDI r3, 0x3000
  ADD r2, r3
  LOAD r2, r2
  JNZ r2, undo_fy
  JMP chk_a
undo_fy:
  MOV r1, r24
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  SUB r21, r1
  JMP chk_a

  ; S (83) backward
chk_s:
  LDI r1, 83
  CMP r8, r1
  JNZ r0, chk_a
  MOV r1, r23
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  SUB r20, r1
  MOV r1, r20
  LDI r2, 8
  SHR r1, r2
  MOV r2, r21
  SHR r2, r2
  LDI r3, 4
  SHL r2, r3
  ADD r2, r1
  LDI r3, 0x3000
  ADD r2, r3
  LOAD r2, r2
  JNZ r2, undo_bx
  JMP chk_by
undo_bx:
  MOV r1, r23
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  ADD r20, r1
chk_by:
  MOV r1, r24
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  SUB r21, r1
  MOV r1, r20
  LDI r2, 8
  SHR r1, r2
  MOV r2, r21
  SHR r2, r2
  LDI r3, 4
  SHL r2, r3
  ADD r2, r1
  LDI r3, 0x3000
  ADD r2, r3
  LOAD r2, r2
  JNZ r2, undo_by
  JMP chk_a
undo_by:
  MOV r1, r24
  LDI r2, 2
  MUL r1, r2
  LDI r2, 8
  SHR r1, r2
  ADD r21, r1
  JMP chk_a

  ; A (65) rotate left
chk_a:
  LDI r1, 65
  CMP r8, r1
  JNZ r0, chk_d
  LDI r1, 4
  SUB r22, r1
  LDI r1, 0
  CMP r22, r1
  BLT r0, wrap_neg
  JMP chk_d
wrap_neg:
  LDI r22, 252

  ; D (68) rotate right
chk_d:
  LDI r1, 68
  CMP r8, r1
  JNZ r0, store_st
  LDI r1, 4
  ADD r22, r1
  LDI r1, 256
  CMP r22, r1
  BLT r0, store_st
  LDI r22, 0

store_st:
  LDI r1, 0x3100
  STORE r1, r20
  LDI r1, 0x3101
  STORE r1, r21
  LDI r1, 0x3102
  STORE r1, r22

  FRAME
  JMP game_loop
