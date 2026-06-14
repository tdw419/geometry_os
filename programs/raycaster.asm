; raycaster.asm - Wolfenstein-style 3D raycasting engine with DDA
;
; A first-person 3D renderer using ray marching with perpendicular distance.
; Features: 8x8 maze map, WASD movement, depth shading, minimap overlay.
;
; Controls (via key bitmask at 0xFFB -- simultaneous keys)
;   W/Up    = move forward     (bit 0)
;   S/Down  = move backward    (bit 1)
;   A/Left  = rotate left      (bit 2)
;   D/Right = rotate right     (bit 3)
;
; Memory layout
;   0x4000-0x403F -- map (64 cells, 0=empty 1=wall)
;   0x4100-0x4102 -- player x/y/angle (fixed-point x/y, angle 0-255)
;   0x4200-0x42FF -- cos table (256 entries, 8.8 fixed point)
;   0x4300-0x43FF -- sin table (256 entries, 8.8 fixed point)
;   0x5000-0x5007 -- row patterns (temp during init)
;
; DDA Algorithm
;   For each screen column, cast a ray from the player position.
;   March along the ray direction, checking grid cells for walls.
;   Use perpendicular distance (cos-corrected) to avoid fisheye distortion.
;   Wall height is inversely proportional to perpendicular distance.
;   Distance-based shading provides depth perception.

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
  MOV r14, r10
  LDI r15, 3
  SHR r14, r15
  MOV r15, r10
  LDI r16, 7
  AND r15, r16
  LDI r16, 0x5000
  ADD r16, r14
  LOAD r16, r16
  MOV r17, r16
  LDI r18, 7
  SUB r18, r15
  SHR r17, r18
  LDI r18, 1
  AND r17, r18
  MOV r18, r9
  ADD r18, r10
  STORE r18, r17
  ADD r10, r1
  CMP r10, r11
  BLT r0, build_map

; ===== COSINE TABLE at 0x4200 =====
; 256 entries, 8.8 fixed point (-256 to +256)
; Quadrant-based approximation: cos(i) = 256 - (i&63)^2 / 16
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
; Fixed-point 8.8: 1.5 = 384
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
  ; Draw ceiling (dark blue, top half)
  LDI r25, 0
  LDI r26, 0
  LDI r27, 256
  LDI r28, 128
  LDI r29, 0x111122
  RECTF r25, r26, r27, r28, r29

  ; Draw floor (dark red-brown, bottom half)
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

  ; Get ray direction from trig tables
  ; r15 = ray_dir_x (cos), r16 = ray_dir_y (sin)
  MOV r15, r14
  ADD r15, r12
  LOAD r15, r15
  MOV r16, r14
  ADD r16, r13
  LOAD r16, r16

  ; Perpendicular distance correction:
  ; angle_offset = ray_index - 32
  ; perp_dist = raw_dist * cos(angle_offset)
  ; We compute this after finding the wall

  ; --- Ray marching loop ---
  ; Start from player position, march in small steps
  ; r17 = ray_x (8.8 fixed), r18 = ray_y (8.8 fixed)
  ; r19 = step count (distance proxy)
  MOV r17, r6
  MOV r18, r7
  LDI r19, 0
  LDI r26, 128

  ; Divide ray direction by 4 for step size (cos/4, sin/4)
  ; r20 = step_x = cos/4, r21 = step_y = sin/4
  MOV r20, r15
  LDI r27, 2
  SAR r20, r27
  MOV r21, r16
  SAR r21, r27

march:
  ; Advance ray
  ADD r17, r20
  ADD r18, r21
  ADD r19, r1

  ; Check step limit
  CMP r19, r26
  BGE r0, ray_skip

  ; Get map cell at ray position
  ; map_x = ray_x >> 8, map_y = ray_y >> 8
  MOV r22, r17
  LDI r23, 8
  SHR r22, r23
  MOV r23, r18
  LDI r24, 8
  SHR r23, r24

  ; Bounds check
  CMP r22, r3
  BGE r0, march
  CMP r23, r3
  BGE r0, march

  ; Map lookup: map[map_y * 8 + map_x]
  MOV r24, r23
  MUL r24, r3
  ADD r24, r22
  ADD r24, r9
  LOAD r24, r24
  JZ r24, march

  ; --- WALL HIT ---
  ; r19 = step count (raw distance)
  ; Compute perpendicular distance to avoid fisheye
  ; perp_dist = raw_dist * cos(angle_offset)
  ; angle_offset = ray_index - 32
  ; cos_offset = cos_table[32 - ray_index] (centered FOV)
  MOV r22, r11
  SUB r22, r10
  SUB r22, r1
  ; Wait: angle_offset = 32 - ray_index is wrong for cos
  ; We need cos(ray_angle - player_angle) = cos(ray_index - 32)
  ; cos_table[(ray_index - 32) & 255] but we need absolute correction
  ; Simpler: cos_table[(32 - ray_index) & 255]
  ; r22 = 32 - ray_index
  LDI r22, 32
  SUB r22, r10
  LDI r23, 255
  AND r22, r23
  ; Load cos of angle offset
  MOV r23, r22
  ADD r23, r12
  LOAD r23, r23
  ; perp_dist = (r19 * cos_offset) >> 8
  ; But cos_offset is 8.8 fixed, r19 is integer
  ; perp_dist = (r19 * cos_offset) / 256
  MOV r22, r19
  MUL r22, r23
  LDI r23, 8
  SHR r22, r23

  ; Wall height = 128 / (perp_dist + 1)
  ADD r22, r1
  JZ r22, ray_skip
  LDI r27, 128
  DIV r27, r22
  LDI r22, 256
  CMP r27, r22
  BLT r0, wh_ok
  MOV r27, r22

wh_ok:
  ; y_start = 128 - wall_height / 2
  LDI r28, 128
  MOV r29, r27
  LDI r22, 1
  SHR r29, r22
  SUB r28, r29

  ; Clamp y_start >= 0
  LDI r22, 31
  MOV r29, r28
  SAR r29, r22
  JZ r29, ys_ok
  LDI r28, 0
  LDI r27, 256

ys_ok:
  ; Column x = 64 + ray_index * 2 (each ray = 2 pixels wide, covering 128px FOV)
  MOV r29, r10
  LDI r22, 2
  MUL r29, r22
  LDI r22, 64
  ADD r29, r22

  ; --- Depth-based wall shading ---
  ; 4 levels based on raw distance
  ; dist 0-7: bright, 8-15: medium, 16-23: dim, 24+: dark
  LDI r22, 8
  CMP r19, r22
  BLT r0, shade_bright
  LDI r22, 16
  CMP r19, r22
  BLT r0, shade_medium
  LDI r22, 24
  CMP r19, r22
  BLT r0, shade_dim
  JMP shade_dark

shade_bright:
  LDI r21, 0xBB6633
  JMP wall_draw

shade_medium:
  LDI r21, 0x884422
  JMP wall_draw

shade_dim:
  LDI r21, 0x553311
  JMP wall_draw

shade_dark:
  LDI r21, 0x221100
  JMP wall_draw

wall_draw:
  ; Draw wall column (width 2)
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

  ; Player dot on minimap (bright red)
  LDI r24, 0xFF0000
  LDI r21, 240
  MOV r22, r6
  LDI r25, 7
  SHR r22, r25
  LDI r18, 2
  MUL r22, r18
  ADD r21, r22
  LDI r22, 8
  MOV r23, r7
  SHR r23, r25
  MUL r23, r18
  ADD r22, r23
  PSET r21, r22, r24

  ; Direction indicator on minimap (yellow dot ahead of player)
  LDI r24, 0xFFFF00
  MOV r21, r8
  ADD r21, r12
  LOAD r21, r21
  LDI r18, 5
  SAR r21, r18
  MOV r22, r8
  ADD r22, r13
  LOAD r22, r22
  SAR r22, r18
  ; Player minimap pos + direction offset
  MOV r23, r6
  LDI r25, 7
  SHR r23, r25
  LDI r18, 2
  MUL r23, r18
  LDI r25, 240
  ADD r23, r25
  ADD r23, r21
  MOV r26, r7
  LDI r25, 7
  SHR r26, r25
  MUL r26, r18
  LDI r25, 8
  ADD r26, r25
  ADD r26, r22
  ; Clamp minimap direction indicator
  LDI r27, 240
  CMP r23, r27
  BLT r0, skip_dir_dot
  LDI r27, 254
  CMP r23, r27
  BGE r0, skip_dir_dot
  LDI r27, 8
  CMP r26, r27
  BLT r0, skip_dir_dot
  LDI r27, 22
  CMP r26, r27
  BGE r0, skip_dir_dot
  PSET r23, r26, r24

skip_dir_dot:
  ; ===== INPUT HANDLING (key bitmask for simultaneous keys) =====
  LDI r4, 0xFFB
  LOAD r20, r4

  ; bit 0 (W/Up) -- move forward
  MOV r21, r20
  LDI r22, 1
  AND r21, r22
  JZ r21, chk_back

  ; Forward: new_x = px + cos(angle)/8, new_y = py + sin(angle)/8
  MOV r21, r8
  ADD r21, r12
  LOAD r21, r21
  LDI r22, 3
  SAR r21, r22
  MOV r23, r8
  ADD r23, r13
  LOAD r23, r23
  SAR r23, r22
  ; Compute new position
  MOV r24, r6
  ADD r24, r21
  MOV r25, r7
  ADD r25, r23
  ; Collision check
  PUSH r31
  CALL check_collision
  POP r31
  JNZ r0, chk_back
  MOV r6, r24
  MOV r7, r25

chk_back:
  ; bit 1 (S/Down) -- move backward
  MOV r21, r20
  LDI r22, 2
  AND r21, r22
  JZ r21, chk_left

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
  PUSH r31
  CALL check_collision
  POP r31
  JNZ r0, chk_left
  MOV r6, r24
  MOV r7, r25

chk_left:
  ; bit 2 (A/Left) -- rotate left
  MOV r21, r20
  LDI r22, 4
  AND r21, r22
  JZ r21, chk_right
  SUB r8, r2
  LDI r21, 255
  AND r8, r21

chk_right:
  ; bit 3 (D/Right) -- rotate right
  MOV r21, r20
  LDI r22, 8
  AND r21, r22
  JZ r21, save_state
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

; ===== COLLISION CHECK SUBROUTINE =====
; Input: r24=new_x, r25=new_y (fixed-point 8.8)
; Output: r0=0 (clear) if OK, r0=nonzero if blocked
; Preserves: r24, r25
; Uses: r21-r28 as temp
check_collision:
  MOV r21, r24
  LDI r22, 8
  SHR r21, r22
  MOV r23, r25
  SHR r23, r22
  ; Bounds check
  CMP r21, r3
  BGE r0, col_blocked
  CMP r23, r3
  BGE r0, col_blocked
  ; Map lookup
  MOV r26, r23
  MUL r26, r3
  ADD r26, r21
  ADD r26, r9
  LOAD r26, r26
  JNZ r26, col_blocked
  ; Also check slightly ahead (prevent wall clipping)
  MOV r21, r24
  ADD r21, r1
  SHR r21, r22
  MOV r26, r23
  MUL r26, r3
  ADD r26, r21
  ADD r26, r9
  LOAD r26, r26
  JNZ r26, col_blocked
  ; Clear
  LDI r0, 0
  RET

col_blocked:
  LDI r0, 1
  RET
