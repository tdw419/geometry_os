; raycaster.asm - Wolfenstein-style 3D raycasting engine
;
; A first-person 3D renderer using ray marching.
; Features -- 8x8 maze map, WASD movement, minimap, distance shading.
;
; Controls
;   W (87) forward, S (83) backward
;   A (65) rotate left, D (68) rotate right
;
; Memory layout
;   0x4000-0x403F -- map (64 cells, 0=empty 1=wall)
;   0x4100-0x4102 -- player x/y/angle
;   0x4200-0x42FF -- cos table (256 entries, 8.8 fixed)
;   0x4300-0x43FF -- sin table (256 entries, 8.8 fixed)
;   0x5000-0x5007 -- row patterns (temp during init)

; ===== CONSTANTS =====
LDI r1, 1
LDI r2, 2
LDI r3, 8

; ===== MAP INIT =====
; Row patterns at 0x5000 (8 rows of 8-bit wall masks)
; 1 1 1 1 1 1 1 1  = 0xFF
; 1 0 0 0 0 0 0 1  = 0x81
; 1 0 1 1 0 1 0 1  = 0xBD
; 1 0 1 0 0 1 0 1  = 0xA5
; 1 0 0 0 1 0 0 1  = 0x99
; 1 0 1 0 0 0 0 1  = 0xA1
; 1 0 0 0 0 1 0 1  = 0x85
; 1 1 1 1 1 1 1 1  = 0xFF
LDI r14, 0x5000
LDI r15, 0xFF
STORE r14, r15
ADD r14, r1
LDI r15, 0x81
STORE r14, r15
ADD r14, r1
LDI r15, 0xBD
STORE r14, r15
ADD r14, r1
LDI r15, 0xA5
STORE r14, r15
ADD r14, r1
LDI r15, 0x99
STORE r14, r15
ADD r14, r1
LDI r15, 0xA1
STORE r14, r15
ADD r14, r1
LDI r15, 0x85
STORE r14, r15
ADD r14, r1
LDI r15, 0xFF
STORE r14, r15

; Expand bit patterns into map cells at 0x4000
LDI r9, 0x4000
LDI r10, 0
LDI r11, 64

build_map:
  ; row = cell >> 3
  MOV r14, r10
  LDI r15, 3
  SHR r14, r15
  ; col = cell & 7
  MOV r15, r10
  LDI r16, 7
  AND r15, r16
  ; Load row pattern
  LDI r16, 0x5000
  ADD r16, r14
  LOAD r16, r16
  ; Extract bit (7 - col)
  MOV r17, r16
  LDI r18, 7
  SUB r18, r15
  SHR r17, r18
  LDI r18, 1
  AND r17, r18
  ; Store to map
  MOV r18, r9
  ADD r18, r10
  STORE r18, r17
  ADD r10, r1
  CMP r10, r11
  BLT r0, build_map

; ===== COSINE TABLE at 0x4200 =====
; 256 entries, 8.8 fixed point (-256 to +256)
; cos(i) = 256 - (i&63)^2 / 16, negated for Q1/Q2
LDI r10, 0
LDI r11, 256
LDI r12, 0x4200

build_cos:
  MOV r14, r10
  LDI r15, 63
  AND r14, r15
  MOV r16, r14
  MUL r16, r14
  LDI r17, 16
  DIV r16, r17
  LDI r17, 256
  SUB r17, r16
  ; Negate for Q1 (64-127) and Q2 (128-191)
  LDI r16, 64
  CMP r10, r16
  BLT r0, store_cos
  LDI r16, 192
  CMP r10, r16
  BGE r0, store_cos
  NEG r17

store_cos:
  MOV r16, r12
  ADD r16, r10
  STORE r16, r17
  ADD r10, r1
  CMP r10, r11
  BLT r0, build_cos

; ===== SINE TABLE at 0x4300 =====
; sin(angle) = cos((angle + 192) & 255)
LDI r10, 0
LDI r11, 256
LDI r13, 0x4300

build_sin:
  MOV r14, r10
  LDI r15, 192
  ADD r14, r15
  LDI r15, 255
  AND r14, r15
  MOV r15, r12
  ADD r15, r14
  LOAD r15, r15
  MOV r16, r13
  ADD r16, r10
  STORE r16, r15
  ADD r10, r1
  CMP r10, r11
  BLT r0, build_sin

; ===== PLAYER INIT =====
; Start at (1.5, 1.5) facing east (angle 0)
LDI r14, 0x4100
LDI r15, 384
STORE r14, r15
ADD r14, r1
STORE r14, r15
ADD r14, r1
LDI r15, 0
STORE r14, r15

; ===== MAIN LOOP =====
main_loop:
  ; Draw ceiling (dark blue-gray, top half)
  LDI r25, 0
  LDI r26, 0
  LDI r27, 256
  LDI r28, 128
  LDI r29, 0x111122
  RECTF r25, r26, r27, r28, r29

  ; Draw floor (dark warm, bottom half)
  LDI r25, 0
  LDI r26, 128
  LDI r27, 256
  LDI r28, 128
  LDI r29, 0x221111
  RECTF r25, r26, r27, r28, r29

  ; Load player state
  LDI r5, 0x4100
  LOAD r6, r5
  ADD r5, r1
  LOAD r7, r5
  ADD r5, r1
  LOAD r8, r5

  ; ===== CAST 64 RAYS =====
  LDI r10, 0
  LDI r11, 64

ray_loop:
  ; ray_angle = (player_angle + ray_index - 32) & 0xFF
  MOV r14, r8
  ADD r14, r10
  LDI r15, 32
  SUB r14, r15
  LDI r15, 255
  AND r14, r15

  ; Get direction from trig tables
  MOV r15, r14
  ADD r15, r12
  LOAD r15, r15
  MOV r16, r14
  ADD r16, r13
  LOAD r16, r16

  ; Init ray position and distance
  MOV r17, r6
  MOV r18, r7
  LDI r19, 0
  LDI r26, 1024

  ; --- Ray march loop ---
march:
  ADD r17, r15
  ADD r18, r16
  ADD r19, r1
  ; Map cell from ray position
  MOV r21, r17
  LDI r22, 8
  SHR r21, r22
  MOV r23, r18
  SHR r23, r22
  ; Bounds check
  CMP r21, r3
  BGE r0, ray_skip
  CMP r23, r3
  BGE r0, ray_skip
  ; Map lookup
  MOV r24, r23
  MUL r24, r3
  ADD r24, r21
  ADD r24, r9
  LOAD r24, r24
  JNZ r24, hit_wall
  ; Max distance check
  CMP r19, r26
  BLT r0, march
  JMP ray_skip

hit_wall:
  ; Wall height = 128 / dist (clamped to 256)
  LDI r27, 128
  JZ r19, ray_skip
  DIV r27, r19
  LDI r28, 256
  CMP r27, r28
  BLT r0, wh_ok
  MOV r27, r28

wh_ok:
  ; y_start = 128 - wall_height / 2
  LDI r28, 128
  MOV r29, r27
  LDI r30, 1
  SHR r29, r30
  SUB r28, r29
  ; Clamp y_start to 0
  LDI r30, 31
  MOV r29, r28
  SAR r29, r30
  JZ r29, ys_ok
  LDI r28, 0
  LDI r27, 256

ys_ok:
  ; Column x = 64 + ray_index * 2
  MOV r29, r10
  LDI r30, 2
  MUL r29, r30
  LDI r30, 64
  ADD r29, r30

  ; Distance-based gray shading
  ; brightness = max(40, 255 - dist * 10)
  MOV r30, r19
  LDI r21, 10
  MUL r30, r21
  LDI r21, 255
  CMP r30, r21
  BGE r0, dim_w
  SUB r21, r30
  LDI r22, 40
  CMP r21, r22
  BGE r0, mk_gray
  LDI r21, 40
  JMP mk_gray

dim_w:
  LDI r21, 40

mk_gray:
  ; Pack gray -- b | (b<<8) | (b<<16)
  MOV r22, r21
  LDI r23, 8
  SHL r22, r23
  OR r21, r22
  MOV r22, r21
  LDI r23, 16
  SHL r22, r23
  OR r21, r22
  ; Draw wall column
  LDI r25, 2
  RECTF r29, r28, r25, r27, r21

ray_skip:
  ADD r10, r1
  CMP r10, r11
  BLT r0, ray_loop

  ; ===== MINIMAP at (240, 8) with 2px cells =====
  LDI r10, 0
  LDI r11, 64

minimap:
  MOV r14, r10
  LDI r15, 3
  SHR r14, r15
  MOV r15, r10
  LDI r16, 7
  AND r15, r16
  ; Screen position
  LDI r21, 240
  MOV r22, r15
  LDI r23, 2
  MUL r22, r23
  ADD r21, r22
  LDI r22, 8
  MOV r23, r14
  LDI r25, 2
  MUL r23, r25
  ADD r22, r23
  ; Map cell value
  MOV r23, r10
  ADD r23, r9
  LOAD r23, r23
  JZ r23, mm_empty
  LDI r24, 0x8888AA
  JMP mm_draw

mm_empty:
  LDI r24, 0x222233

mm_draw:
  LDI r25, 2
  LDI r26, 2
  RECTF r21, r22, r25, r26, r24
  ADD r10, r1
  CMP r10, r11
  BLT r0, minimap

  ; Player dot on minimap (red)
  LDI r24, 0xFF0000
  LDI r21, 240
  MOV r22, r6
  LDI r25, 7
  SHR r22, r25
  ADD r21, r22
  LDI r22, 8
  MOV r23, r7
  SHR r23, r25
  ADD r22, r23
  PSET r21, r22, r24

  ; ===== INPUT HANDLING =====
  IKEY r20
  JZ r20, save_state

  ; W = 87 -- move forward
  LDI r21, 87
  CMP r20, r21
  JNZ r0, chk_s
  ; Forward movement with collision check
  MOV r21, r8
  ADD r21, r12
  LOAD r21, r21
  LDI r22, 3
  SAR r21, r22
  MOV r23, r8
  ADD r23, r13
  LOAD r23, r23
  SAR r23, r22
  MOV r24, r6
  ADD r24, r21
  MOV r25, r7
  ADD r25, r23
  ; Collision check
  MOV r26, r24
  LDI r27, 8
  SHR r26, r27
  MOV r27, r25
  LDI r28, 8
  SHR r27, r28
  CMP r26, r3
  BGE r0, save_state
  CMP r27, r3
  BGE r0, save_state
  MOV r28, r27
  MUL r28, r3
  ADD r28, r26
  ADD r28, r9
  LOAD r28, r28
  JNZ r28, save_state
  MOV r6, r24
  MOV r7, r25
  JMP save_state

chk_s:
  ; S = 83 -- move backward
  LDI r21, 83
  CMP r20, r21
  JNZ r0, chk_a
  MOV r21, r8
  ADD r21, r12
  LOAD r21, r21
  LDI r22, 3
  SAR r21, r22
  NEG r21
  MOV r23, r8
  ADD r23, r13
  LOAD r23, r23
  SAR r23, r22
  NEG r23
  MOV r24, r6
  ADD r24, r21
  MOV r25, r7
  ADD r25, r23
  MOV r26, r24
  LDI r27, 8
  SHR r26, r27
  MOV r27, r25
  LDI r28, 8
  SHR r27, r28
  CMP r26, r3
  BGE r0, save_state
  CMP r27, r3
  BGE r0, save_state
  MOV r28, r27
  MUL r28, r3
  ADD r28, r26
  ADD r28, r9
  LOAD r28, r28
  JNZ r28, save_state
  MOV r6, r24
  MOV r7, r25
  JMP save_state

chk_a:
  ; A = 65 -- rotate left
  LDI r21, 65
  CMP r20, r21
  JNZ r0, chk_d
  SUB r8, r2
  LDI r21, 255
  AND r8, r21
  JMP save_state

chk_d:
  ; D = 68 -- rotate right
  LDI r21, 68
  CMP r20, r21
  JNZ r0, save_state
  ADD r8, r2
  LDI r21, 255
  AND r8, r21

save_state:
  LDI r5, 0x4100
  STORE r5, r6
  ADD r5, r1
  STORE r5, r7
  ADD r5, r1
  STORE r5, r8
  FRAME
  JMP main_loop
