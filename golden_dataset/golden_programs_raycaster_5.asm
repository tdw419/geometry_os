; DESCRIPTION: This GeOS assembly code implements a Wolfenstein-style 3D raycasting engine that renders pseudo-3D corridors from a 16x16 map using the DDA algorithm. The player can navigate through the environment with controls W/S for forward/back movement and A/D for rotating left/right, while the rendering system calculates wall heights based on distance to ensure perspective depth.

; raycaster.asm -- Wolfenstein-style 3D raycasting engine
;
; Renders pseudo-3D corridors from a 16x16 map using DDA algorithm.
; Controls: W/S = forward/back, A/D = rotate left/right
;
; Memory layout:
;   0x5000-0x50FF  Map (16x16, 1 word per cell: 0=empty, 1=wall)
;   0x5200-0x5205  Player [px, py, dir_x, dir_y, plane_x, plane_y] (8.8 fixed)
;   0x5210        Rotation speed
;   0x5211        Move speed
;
; Fixed-point 8.8: real_value = register_value / 256
;   1.0 = 256, 0.5 = 128, 2.0 = 512
;
; Wall height = 65536 / perpDist (in 8.8)

; ============================================================
; INITIALIZATION
; ============================================================
LDI r4, 1
LDI r3, 256
LDI r8, 128
LDI r29, 16
LDI r1, 0x5000

; --- Build 16x16 map at 0x5000 using bitmask extraction ---
; Each row bitmask is shifted left by 1 each iteration.
; SHR by 15 extracts the MSB, AND with 1 ensures clean 0/1.

; Row 0: 1111111111111111 = 0xFFFF
LDI r6, 0xFFFF
LDI r0, 0
row0_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row0_lp

; Row 1: 1000000000000001 = 0x8001
LDI r6, 0x8001
LDI r0, 0
row1_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row1_lp

; Row 2: 1011100010001001 = 0xB889
LDI r6, 0xB889
LDI r0, 0
row2_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row2_lp

; Row 3: 1000100000000001 = 0x8801
LDI r6, 0x8801
LDI r0, 0
row3_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row3_lp

; Row 4: 1000100010000001 = 0x8881
LDI r6, 0x8881
LDI r0, 0
row4_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row4_lp

; Row 5: 1000001010001001 = 0x80A9
LDI r6, 0x80A9
LDI r0, 0
row5_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row5_lp

; Row 6: 1000000000001001 = 0x8009
LDI r6, 0x8009
LDI r0, 0
row6_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row6_lp

; Row 7: 1111000011111001 = 0xF0F9
LDI r6, 0xF0F9
LDI r0, 0
row7_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row7_lp

; Row 8: 1000000000000001 = 0x8001
LDI r6, 0x8001
LDI r0, 0
row8_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row8_lp

; Row 9: 1000111000011001 = 0x8719
LDI r6, 0x8719
LDI r0, 0
row9_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row9_lp

; Row 10: 1000000000000001 = 0x8001
LDI r6, 0x8001
LDI r0, 0
row10_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row10_lp

; Row 11: 1000001110000001 = 0x80E1
LDI r6, 0x80E1
LDI r0, 0
row11_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row11_lp

; Row 12: 1000001000011001 = 0x8089
LDI r6, 0x8089
LDI r0, 0
row12_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row12_lp

; Row 13: 1000001000000001 = 0x8081
LDI r6, 0x8081
LDI r0, 0
row13_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row13_lp

; Row 14: 1000000000000001 = 0x8001
LDI r6, 0x8001
LDI r0, 0
row14_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row14_lp

; Row 15: 1111111111111111 = 0xFFFF
LDI r6, 0xFFFF
LDI r0, 0
row15_lp:
  MOV r5, r6
  LDI r10, 15
  SHR r5, r10
  AND r5, r4
  STORE r1, r5
  SHL r6, r4
  ADD r1, r4
  ADD r0, r4
  CMP r0, r29
  BLT r7, row15_lp

; --- Player init ---
LDI r15, 0x5200
LDI r0, 640
STORE r15, r0
ADD r15, r4
STORE r15, r0
ADD r15, r4
LDI r0, 256
STORE r15, r0
ADD r15, r4
LDI r0, 0
STORE r15, r0
ADD r15, r4
STORE r15, r0
ADD r15, r4
LDI r0, 169
STORE r15, r0

; Constants
LDI r20, 0x5210
LDI r0, 9
STORE r20, r0
LDI r20, 0x5211
LDI r0, 13
STORE r20, r0

LDI r15, 0x5200

; ============================================================
; MAIN LOOP
; ============================================================
main_loop:
  LDI r5, 0
  FILL r5

  IKEY r20

  LDI r21, 65
  CMP r20, r21
  JZ r7, chk_rr
  LDI r21, 97
  CMP r20, r21
  JZ r7, chk_rr
  LDI r21, 75
  CMP r20, r21
  JZ r7, chk_rr
  PUSH r31
  CALL rot_left
  POP r31

chk_rr:
  LDI r21, 68
  CMP r20, r21
  JZ r7, chk_fw
  LDI r21, 100
  CMP r20, r21
  JZ r7, chk_fw
  LDI r21, 77
  CMP r20, r21
  JZ r7, chk_fw
  PUSH r31
  CALL rot_right
  POP r31

chk_fw:
  LDI r21, 87
  CMP r20, r21
  JZ r7, chk_bw
  LDI r21, 119
  CMP r20, r21
  JZ r7, chk_bw
  PUSH r31
  CALL move_fwd
  POP r31

chk_bw:
  LDI r21, 83
  CMP r20, r21
  JZ r7, ray_start
  LDI r21, 115
  CMP r20, r21
  JZ r7, ray_start
  PUSH r31
  CALL move_bwd
  POP r31

; ============================================================
; RAYCASTING: render 256 columns
; ============================================================
ray_start:
  LDI r11, 0

cast_loop:
  ; camera_x = 2*x - 256
  MOV r6, r11
  SHL r6, r4
  SUB r6, r3

  ; ray_dir_x = dir_x + (plane_x * camera_x >> 8)
  LOAD r0, r15
  MOV r5, r15
  ADD r5, r4
  ADD r5, r4
  ADD r5, r4
  ADD r5, r4
  LOAD r5, r5
  MOV r10, r5
  MUL r10, r6
  LDI r12, 8
  SHR r10, r12
  ADD r0, r10

  ; ray_dir_y = dir_y + (plane_y * camera_x >> 8)
  MOV r5, r15
  ADD r5, r4
  ADD r5, r4
  ADD r5, r4
  LOAD r5, r5
  MOV r13, r15
  ADD r13, r4
  ADD r13, r4
  ADD r13, r4
  ADD r13, r4
  ADD r13, r4
  LOAD r13, r13
  MOV r10, r13
  MUL r10, r6
  SHR r10, r12
  ADD r5, r10

  ; DDA setup
  LOAD r9, r15
  MOV r2, r15
  ADD r2, r4
  LOAD r2, r2
  MOV r16, r9
  SHR r16, r12
  MOV r17, r2
  SHR r17, r12

  ; delta_dist_x
  JZ r0, ddx_big
  MOV r18, r0
  LDI r19, 31
  SAR r19, r18
  JNZ r19, ddx_neg
  JMP ddx_ok
ddx_neg:
  NEG r18
ddx_ok:
  LDI r10, 65536
  DIV r10, r18
  JMP ddy_start
ddx_big:
  LDI r10, 65536

ddy_start:
  JZ r5, ddy_big
  MOV r18, r5
  LDI r19, 31
  SAR r19, r18
  JNZ r19, ddy_neg
  JMP ddy_ok2
ddy_neg:
  NEG r18
ddy_ok2:
  LDI r12, 65536
  DIV r12, r18
  JMP ddy_done
ddy_big:
  LDI r12, 65536
ddy_done:

  ; Step direction
  LDI r19, 31
  MOV r20, r0
  SAR r20, r19
  JZ r20, sx_pos
  LDI r13, 0xFFFFFFFF
  JMP sx_done
sx_pos:
  LDI r13, 1
sx_done:

  MOV r20, r5
  SAR r20, r19
  JZ r20, sy_pos
  LDI r21, 0xFFFFFFFF
  JMP sy_done
sy_pos:
  LDI r21, 1
sy_done:

  ; sideDist_x
  MOV r22, r9
  LDI r23, 0xFF
  AND r22, r23
  LDI r19, 31
  SAR r19, r13
  JNZ r19, sdx_neg
  MOV r18, r3
  SUB r18, r22
  MUL r18, r10
  LDI r25, 8
  SHR r18, r25
  JMP sdx_done
sdx_neg:
  MOV r18, r22
  MUL r18, r10
  LDI r25, 8
  SHR r18, r25
sdx_done:

  ; sideDist_y
  MOV r22, r2
  LDI r23, 0xFF
  AND r22, r23
  SAR r19, r21
  JNZ r19, sdy_neg
  MOV r19, r3
  SUB r19, r22
  MUL r19, r12
  LDI r25, 8
  SHR r19, r25
  JMP sdy_done
sdy_neg:
  MOV r19, r22
  MUL r19, r12
  LDI r25, 8
  SHR r19, r25
sdy_done:

  ; DDA loop state: r0=rdx, r5=rdy, r10=ddx, r12=ddy
  ; r13=sx, r21=sy, r9=px, r2=py, r16=mx, r17=my
  ; r18=sdx, r19=sdy
  LDI r25, 0

dda_step:
  CMP r18, r19
  BLT r7, dda_x
  ADD r19, r12
  ADD r17, r21
  LDI r25, 1
  JMP dda_chk
dda_x:
  ADD r18, r10
  ADD r16, r13
  LDI r25, 0
dda_chk:
  LDI r22, 31
  MOV r23, r16
  SAR r23, r22
  JNZ r23, dda_hit
  CMP r16, r3
  BGE r7, dda_hit
  MOV r23, r17
  SAR r23, r22
  JNZ r23, dda_hit
  CMP r17, r3
  BGE r7, dda_hit
  MOV r22, r17
  LDI r23, 4
  SHL r22, r23
  ADD r22, r16
  LDI r23, 0x5000
  ADD r22, r23
  LOAD r22, r22
  JNZ r22, dda_hit
  JMP dda_step

dda_hit:
  JNZ r25, perp_y
  MOV r22, r16
  SHL r22, r12
  SUB r22, r9
  SAR r23, r13
  JZ r23, px_ok
  ADD r22, r3
px_ok:
  MOV r23, r0
  LDI r24, 31
  SAR r24, r23
  JNZ r24, rdx_n
  JMP rdx_d
rdx_n:
  NEG r23
rdx_d:
  JZ r23, p_tiny
  MUL r22, r3
  DIV r22, r23
  JMP p_done

perp_y:
  MOV r22, r17
  SHL r22, r12
  SUB r22, r2
  SAR r23, r21
  JZ r23, py_ok
  ADD r22, r3
py_ok:
  MOV r23, r5
  LDI r24, 31
  SAR r24, r23
  JNZ r24, rdy_n
  JMP rdy_d
rdy_n:
  NEG r23
rdy_d:
  JZ r23, p_tiny
  MUL r22, r3
  DIV r22, r23
  JMP p_done

p_tiny:
  LDI r22, 1
p_done:
  ; r22 = perpDist (8.8)
  LDI r23, 65536
  DIV r23, r22
  CMP r23, r3
  BLT r7, wh_ok
  LDI r23, 255
wh_ok:

  MOV r24, r23
  SHR r24, r4
  MOV r26, r8
  SUB r26, r24
  MOV r27, r8
  ADD r27, r24

  SAR r28, r26
  JNZ r28, ds_0
  CMP r26, r5
  BGE r7, ds_0
  JMP ds_ok
ds_0:
  LDI r26, 0
ds_ok:

  LDI r28, 224
  CMP r27, r28
  BGE r7, de_224
  JMP de_ok
de_224:
  LDI r27, 224
de_ok:

  JNZ r25, wk_dark
  LDI r14, 0xAAAAAA
  JMP do_shade
wk_dark:
  LDI r14, 0x777777
do_shade:
  MOV r28, r22
  SHR r28, r12
  MUL r28, r12
  LDI r29, 255
  SUB r29, r28
  LDI r28, 64
  CMP r29, r28
  BLT r7, sh_min
  MOV r29, r28
sh_min:
  MUL r14, r29
  SHR r14, r12

  JZ r26, no_ceil
  LDI r28, 0x111133
  RECTF r11, r5, r4, r26, r28
no_ceil:

  MOV r28, r27
  SUB r28, r26
  JZ r28, no_wall
  RECTF r11, r26, r4, r28, r14
no_wall:

  LDI r28, 224
  CMP r27, r28
  BGE r7, no_floor
  MOV r28, r27
  LDI r29, 224
  SUB r29, r28
  JZ r29, no_floor
  LDI r28, 0x333311
  RECTF r11, r27, r4, r29, r28
no_floor:

  ADD r11, r4
  CMP r11, r3
  BLT r7, cast_loop

; ============================================================
; MINIMAP (32x32 area at y=224)
; ============================================================
  LDI r28, 0x0A0A15
  LDI r29, 224
  LDI r30, 32
  RECTF r5, r29, r30, r30, r28

  LDI r6, 0
mm_row:
  LDI r0, 0
mm_col:
  MOV r10, r6
  LDI r12, 4
  SHL r10, r12
  ADD r10, r0
  LDI r12, 0x5000
  ADD r10, r12
  LOAD r10, r10
  JZ r10, mm_skip
  ADD r0, r0
  MOV r12, r6
  ADD r12, r12
  LDI r13, 224
  ADD r12, r13
  LDI r9, 0x6666AA
  PSET r0, r12, r9
mm_skip:
  ADD r0, r4
  CMP r0, r29
  BLT r7, mm_col
  ADD r6, r4
  CMP r6, r29
  BLT r7, mm_row

  LOAD r10, r15
  MOV r12, r15
  ADD r12, r4
  LOAD r12, r12
  SHR r10, r12
  SHR r12, r12
  ADD r10, r10
  ADD r12, r12
  LDI r13, 224
  ADD r12, r13
  LDI r9, 0xFF4444
  PSET r10, r12, r9

  PSETI 127, 126, 0xFFFFFF
  PSETI 128, 127, 0xFFFFFF
  PSETI 127, 128, 0xFFFFFF
  PSETI 126, 127, 0xFFFFFF

  FRAME
  JMP main_loop

; ============================================================
; ROTATION
; ============================================================
rot_left:
  PUSH r31
  LDI r20, 0x5210
  LOAD r20, r20
  LOAD r21, r15
  MOV r22, r15
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r21
  LDI r24, 8
  SHL r23, r24
  MOV r24, r22
  MUL r24, r20
  MOV r25, r23
  SUB r25, r24
  SHR r25, r12
  MOV r23, r21
  MUL r23, r20
  MOV r24, r22
  LDI r26, 8
  SHL r24, r26
  ADD r23, r24
  SHR r23, r12
  STORE r15, r25
  ADD r15, r4
  ADD r15, r4
  ADD r15, r4
  STORE r15, r23
  MOV r21, r15
  ADD r21, r4
  ADD r21, r4
  LOAD r21, r21
  MOV r22, r15
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r21
  LDI r24, 8
  SHL r23, r24
  MOV r24, r22
  MUL r24, r20
  MOV r25, r23
  SUB r25, r24
  SHR r25, r12
  MOV r23, r21
  MUL r23, r20
  MOV r24, r22
  LDI r26, 8
  SHL r24, r26
  ADD r23, r24
  SHR r23, r12
  ADD r15, r4
  STORE r15, r25
  ADD r15, r4
  STORE r15, r23
  LDI r15, 0x5200
  POP r31
  RET

rot_right:
  PUSH r31
  LDI r20, 0x5210
  LOAD r20, r20
  LOAD r21, r15
  MOV r22, r15
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r21
  LDI r24, 8
  SHL r23, r24
  MOV r24, r22
  MUL r24, r20
  MOV r25, r23
  ADD r25, r24
  SHR r25, r12
  MOV r23, r21
  MUL r23, r20
  NEG r23
  MOV r24, r22
  LDI r26, 8
  SHL r24, r26
  ADD r23, r24
  SHR r23, r12
  STORE r15, r25
  ADD r15, r4
  ADD r15, r4
  ADD r15, r4
  STORE r15, r23
  MOV r21, r15
  ADD r21, r4
  ADD r21, r4
  LOAD r21, r21
  MOV r22, r15
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r21
  LDI r24, 8
  SHL r23, r24
  MOV r24, r22
  MUL r24, r20
  MOV r25, r23
  ADD r25, r24
  SHR r25, r12
  MOV r23, r21
  MUL r23, r20
  NEG r23
  MOV r24, r22
  LDI r26, 8
  SHL r24, r26
  ADD r23, r24
  SHR r23, r12
  ADD r15, r4
  STORE r15, r25
  ADD r15, r4
  STORE r15, r23
  LDI r15, 0x5200
  POP r31
  RET

; ============================================================
; MOVEMENT (with collision)
; ============================================================
move_fwd:
  PUSH r31
  LDI r20, 0x5211
  LOAD r20, r20
  LOAD r21, r15
  MOV r22, r15
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r15
  ADD r23, r4
  ADD r23, r4
  ADD r23, r4
  LOAD r23, r23
  MOV r24, r15
  ADD r24, r4
  ADD r24, r4
  ADD r24, r4
  ADD r24, r4
  LOAD r24, r24
  MOV r25, r23
  MUL r25, r20
  SHR r25, r12
  ADD r21, r25
  MOV r25, r24
  MUL r25, r20
  SHR r25, r12
  ADD r22, r25
  MOV r25, r21
  SHR r25, r12
  MOV r26, r22
  SHR r26, r12
  CALL chk_wall
  JNZ r6, mf_blk
  STORE r15, r21
  ADD r15, r4
  STORE r15, r22
  LDI r15, 0x5200
mf_blk:
  POP r31
  RET

move_bwd:
  PUSH r31
  LDI r20, 0x5211
  LOAD r20, r20
  LOAD r21, r15
  MOV r22, r15
  ADD r22, r4
  LOAD r22, r22
  MOV r23, r15
  ADD r23, r4
  ADD r23, r4
  ADD r23, r4
  LOAD r23, r23
  MOV r24, r15
  ADD r24, r4
  ADD r24, r4
  ADD r24, r4
  ADD r24, r4
  LOAD r24, r24
  MOV r25, r23
  MUL r25, r20
  SHR r25, r12
  SUB r21, r25
  MOV r25, r24
  MUL r25, r20
  SHR r25, r12
  SUB r22, r25
  MOV r25, r21
  SHR r25, r12
  MOV r26, r22
  SHR r26, r12
  CALL chk_wall
  JNZ r6, mb_blk
  STORE r15, r21
  ADD r15, r4
  STORE r15, r22
  LDI r15, 0x5200
mb_blk:
  POP r31
  RET

; ============================================================
; WALL CHECK (r25=map_x, r26=map_y) -> r6=1 wall, 0 empty
; ============================================================
chk_wall:
  LDI r27, 31
  MOV r28, r25
  SAR r28, r27
  JNZ r28, cw_wall
  CMP r25, r3
  BGE r7, cw_wall
  MOV r28, r26
  SAR r28, r27
  JNZ r28, cw_wall
  CMP r26, r3
  BGE r7, cw_wall
  MOV r27, r26
  LDI r28, 4
  SHL r27, r28
  ADD r27, r25
  LDI r28, 0x5000
  ADD r27, r28
  LOAD r27, r27
  JNZ r27, cw_wall
  LDI r6, 0
  RET
cw_wall:
  LDI r6, 1
  RET
