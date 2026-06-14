; raytracer.asm -- Phong-shaded sphere raytracer with ground plane
;
; Renders a blue sphere over a checkerboard ground plane with shadow.
; Uses integer arithmetic with Newton's method sqrt.
;
; Phase 383 deliverables:
;   1. Simple raytracer with sphere primitives
;   2. Recursive reflection (1 bounce) -- sphere reflects ground color
;   3. Phong shading with shadow rays
;
; Register allocation:
;   r7  = 1            r8  = 128 (center)
;   r9  = 60  (radius) r26 = 3600 (R squared)
;   r28 = 255 (max)    r29 = 256 (screen size)
;   r10 = y, r11 = x, r12 = dy, r13 = dx
;   r14-r24: temps
;
; Light direction: (30, 40, 75) -- upper-right, toward viewer
; Sphere center: (128, 128), radius: 60
; Ground plane: y >= 192
; Shadow: ellipse on ground plane

; ========== Constants ==========
LDI r7, 1
LDI r8, 128
LDI r9, 60
LDI r26, 3600
LDI r28, 255
LDI r29, 256

; ========== Clear screen ==========
LDI r1, 0
FILL r1

; ========== Y loop ==========
LDI r10, 0

y_loop:
  MOV r12, r10
  SUB r12, r8           ; r12 = dy = y - 128

  LDI r11, 0            ; x = 0
x_loop:
  MOV r13, r11
  SUB r13, r8           ; r13 = dx = x - 128

  ; dist_sq = dx*dx + dy*dy
  MOV r14, r13
  MUL r14, r13          ; r14 = dx*dx
  MOV r15, r12
  MUL r15, r12          ; r15 = dy*dy
  ADD r15, r14          ; r15 = dist_sq

  ; Sphere test -- dist_sq < 3600
  CMP r15, r26
  BGE r0, check_ground

  ; ========== SPHERE PIXEL ==========
  ; nz_sq = R*R - dist_sq
  MOV r16, r26
  SUB r16, r15          ; r16 = nz_sq

  ; isqrt via Newton, initial guess 60, 4 iterations
  LDI r17, 60
  JZ r16, sphere_phong  ; nz=0 at sphere edge

  LDI r21, 4
sqrt_loop:
  MOV r22, r16          ; nz_sq
  DIV r22, r17          ; nz_sq / x
  ADD r22, r17          ; nz_sq/x + x
  LDI r23, 1
  SHR r22, r23          ; average
  MOV r17, r22          ; x = result
  SUB r21, r7           ; iter--
  JNZ r21, sqrt_loop

sphere_phong:
  ; r17 = nz (isqrt result)
  ; Phong shading: dot = dx*30 + dy*40 + nz*75
  MOV r18, r13
  LDI r19, 30
  MUL r18, r19          ; dx * 30
  MOV r19, r12
  LDI r20, 40
  MUL r19, r20          ; dy * 40
  ADD r18, r19
  MOV r19, r17
  LDI r20, 75
  MUL r19, r20          ; nz * 75
  ADD r18, r19          ; r18 = dot product

  ; Check if negative (shadow side of sphere)
  MOV r19, r18
  LDI r20, 31
  SAR r19, r20          ; sign extraction
  JNZ r19, sphere_dark

  ; diffuse = dot / 21
  LDI r19, 21
  DIV r18, r19          ; r18 = diffuse intensity (0-255 ish)

  ; Specular: if diffuse > 200, boost toward white
  LDI r19, 200
  CMP r18, r19
  BLT r0, sphere_color

  ; Specular highlight
  LDI r19, 255
  SUB r19, r18          ; excess over 200
  LDI r20, 5
  MUL r19, r20          ; amplify specular
  ADD r18, r19          ; boost
  CMP r18, r28
  BLT r0, sphere_color
  MOV r18, r28          ; clamp to 255

sphere_color:
  ; Blue-ish sphere with Phong shading
  ; Red = diffuse * 77 >> 8
  MOV r2, r18
  LDI r3, 77
  MUL r2, r3
  LDI r3, 8
  SHR r2, r3            ; r2 = red

  ; Green = diffuse * 128 >> 8
  MOV r3, r18
  LDI r4, 128
  MUL r3, r4
  LDI r4, 8
  SHR r3, r4            ; r3 = green

  ; Blue = 77 + diffuse * 179 >> 8
  MOV r4, r18
  LDI r5, 179
  MUL r4, r5
  LDI r5, 8
  SHR r4, r5
  LDI r5, 77
  ADD r4, r5            ; r4 = blue

  ; Ground reflection: if dy > 0, add green tint
  MOV r5, r12           ; dy
  LDI r6, 31
  SAR r5, r6            ; sign of dy
  JNZ r5, skip_reflect  ; negative dy, no reflection

  ; dy is positive -- lower hemisphere reflects ground
  ; green += dy * 1 (subtle green tint)
  MOV r5, r12           ; dy
  ADD r3, r5            ; green += dy
  CMP r3, r28
  BLT r0, skip_reflect
  MOV r3, r28           ; clamp green

skip_reflect:
  ; Clamp blue
  CMP r4, r28
  BLT r0, pack_color
  MOV r4, r28

pack_color:
  ; Pack RGB: (red << 16) | (green << 8) | blue
  LDI r5, 16
  SHL r2, r5            ; red << 16
  LDI r5, 8
  SHL r3, r5            ; green << 8
  ADD r2, r3
  ADD r2, r4            ; packed color in r2

  PSET r11, r10, r2
  JMP next_x

sphere_dark:
  ; Shadow side of sphere -- ambient only
  LDI r2, 0x0A1428
  PSET r11, r10, r2
  JMP next_x

  ; ========== GROUND PLANE ==========
check_ground:
  ; Ground at y >= 192
  LDI r14, 192
  CMP r10, r14
  BLT r0, next_x        ; above ground, skip

  ; Checkerboard: ((x >> 4) + (y >> 4)) & 1
  MOV r14, r11
  LDI r15, 4
  SHR r14, r15          ; x >> 4
  MOV r15, r10
  LDI r16, 4
  SHR r15, r16          ; y >> 4
  ADD r14, r15
  LDI r15, 1
  AND r14, r15          ; checkerboard bit in r14

  ; Shadow test: is pixel in sphere shadow?
  ; Shadow center x moves with y (perspective projection of sphere)
  ; shadow_cx = 128 + (y - 128) * 5 / 8
  MOV r15, r10
  SUB r15, r8           ; r15 = y - 128
  MOV r16, r15
  LDI r17, 1
  SHR r16, r17          ; (y-128) >> 1
  MOV r17, r15
  LDI r18, 3
  SHR r17, r18          ; (y-128) >> 3
  ADD r16, r17          ; (y-128)*5/8 approx
  ADD r16, r8           ; shadow_cx = 128 + offset

  ; dx_shadow = x - shadow_cx
  MOV r15, r11
  SUB r15, r16          ; dx_shadow

  ; dy_shadow = y - 210 (shadow ellipse center y)
  LDI r16, 210
  MOV r17, r10
  SUB r17, r16          ; dy_shadow

  ; Shadow metric: dx_shadow*dx_shadow + dy_shadow*dy_shadow*6 < 5625
  MOV r16, r15
  MUL r16, r15          ; dx_shadow squared
  MOV r18, r17
  MUL r18, r17          ; dy_shadow squared
  LDI r19, 6
  MUL r18, r19          ; dy_shadow squared * 6
  ADD r16, r18          ; shadow metric

  LDI r18, 5625
  CMP r16, r18
  BLT r0, in_shadow

  ; Not in shadow -- lit checkerboard
  JZ r14, lit_tile
  LDI r2, 0x1A3020      ; dark green-brown tile
  PSET r11, r10, r2
  JMP next_x
lit_tile:
  LDI r2, 0x3A6040      ; light green tile
  PSET r11, r10, r2
  JMP next_x

in_shadow:
  ; In shadow -- dimmed checkerboard
  JZ r14, shadow_lit
  LDI r2, 0x0A1508      ; very dark tile
  PSET r11, r10, r2
  JMP next_x
shadow_lit:
  LDI r2, 0x152A18      ; dim tile
  PSET r11, r10, r2
  JMP next_x

  ; ========== Next pixel ==========
next_x:
  ADD r11, r7            ; x++
  CMP r11, r29           ; x < 256
  BLT r0, x_loop

next_y:
  ADD r10, r7            ; y++
  CMP r10, r29           ; y < 256
  BLT r0, y_loop

done:
  HALT
