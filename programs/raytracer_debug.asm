; raytracer.asm -- Raytracer with Phong shading, shadow rays, and 1-bounce reflection
; 64x64 resolution, 4x4 pixel blocks on 256x256 screen
; Scale-16 fixed point (1.0 = 16)
;
; Scene:
;   Camera at (0, 0, -48) looking toward +Z
;   Sphere 0: Red   at (0, 0, 32) r=16 r_sq=256
;   Sphere 1: Green at (-24, 0, 64) r=19 r_sq=361
;   Sphere 2: Blue  at (24, -8, 48) r=13 r_sq=169
;   Light dir from upper-left: (10, 16, -12)
;   Floor plane at y = -16
;
; Memory:
;   0x2000-0x201D: Sphere data (7 words each: cx, cy, cz, r_sq, color, radius, shade_div)
;   0x2100-0x2102: Light direction (lx, ly, lz)
;   0x3000-0x3002: Ray origin (ox, oy, oz)
;   0x3003-0x3005: Ray direction (dx, dy, dz)
;   0x3100: t_fixed output from intersection (8.8 fixed point)
;   0x3101: Best sphere index
;   0x3102: Best t_fixed
;   0x3103: Best color

; ===== CONSTANTS =====
LDI r7, 1
LDI r8, 2
LDI r9, 3

; ===== SCENE DATA INIT =====
; Sphere 0: Red at (0, 0, 32), r=16, r_sq=256, color=0xFF0000, shade_div=352
LDI r14, 0x2000
LDI r15, 0
STORE r14, r15          ; cx=0
ADD r14, r7
STORE r14, r15          ; cy=0
ADD r14, r7
LDI r15, 32
STORE r14, r15          ; cz=32
ADD r14, r7
LDI r15, 256
STORE r14, r15          ; r_sq=256
ADD r14, r7
LDI r15, 0xFF0000
STORE r14, r15          ; color=red
ADD r14, r7
LDI r15, 16
STORE r14, r15          ; radius=16
ADD r14, r7
LDI r15, 352
STORE r14, r15          ; shade_div=16*22=352

; Sphere 1: Green at (-24, 0, 64), r=19, r_sq=361, color=0x00FF00, shade_div=418
ADD r14, r7
LDI r15, 24
NEG r15
STORE r14, r15          ; cx=-24
ADD r14, r7
LDI r15, 0
STORE r14, r15          ; cy=0
ADD r14, r7
LDI r15, 64
STORE r14, r15          ; cz=64
ADD r14, r7
LDI r15, 361
STORE r14, r15          ; r_sq=361
ADD r14, r7
LDI r15, 0x00FF00
STORE r14, r15          ; color=green
ADD r14, r7
LDI r15, 19
STORE r14, r15          ; radius=19
ADD r14, r7
LDI r15, 418
STORE r14, r15          ; shade_div=19*22=418

; Sphere 2: Blue at (24, -8, 48), r=13, r_sq=169, color=0x0088FF, shade_div=286
ADD r14, r7
LDI r15, 24
STORE r14, r15          ; cx=24
ADD r14, r7
LDI r15, 8
NEG r15
STORE r14, r15          ; cy=-8
ADD r14, r7
LDI r15, 48
STORE r14, r15          ; cz=48
ADD r14, r7
LDI r15, 169
STORE r14, r15          ; r_sq=169
ADD r14, r7
LDI r15, 0x0088FF
STORE r14, r15          ; color=blue-ish
ADD r14, r7
LDI r15, 13
STORE r14, r15          ; radius=13
ADD r14, r7
LDI r15, 286
STORE r14, r15          ; shade_div=13*22=286

; Light direction at 0x2100: (10, 16, -12)
LDI r14, 0x2100
LDI r15, 10
STORE r14, r15
ADD r14, r7
LDI r15, 16
STORE r14, r15
ADD r14, r7
LDI r15, 12
NEG r15
STORE r14, r15

; Sphere count and stride
LDI r29, 3              ; sphere count
LDI r28, 7              ; stride (words per sphere)

; ===== RENDER LOOP =====
; Clear screen to dark background
LDI r15, 0x080818
FILL r15

; Y loop: r10 = y (0..63)
LDI r10, 0
y_loop:
  ; X loop: r11 = x (0..63)
  LDI r11, 0
  x_loop:
    ; === COMPUTE RAY DIRECTION ===
    ; vx = (x - 32) * 3
    MOV r12, r11
    LDI r13, 32
    SUB r12, r13         ; r12 = x - 32
    LDI r13, 3
    MUL r12, r13         ; r12 = vx

    ; vy = (32 - y) * 3
    LDI r13, 32
    SUB r13, r10         ; r13 = 32 - y
    LDI r15, 3
    MUL r13, r15         ; r13 = vy

    ; Store ray origin at 0x3000: (0, 0, -48)
    LDI r14, 0x3000
    LDI r15, 0
    STORE r14, r15       ; ox=0
    ADD r14, r7
    STORE r14, r15       ; oy=0
    ADD r14, r7
    LDI r15, 48
    NEG r15
    STORE r14, r15       ; oz=-48

    ; Store ray direction at 0x3003: (vx, vy, 96)
    ADD r14, r7
    STORE r14, r12       ; dx=vx
    ADD r14, r7
    STORE r14, r13       ; dy=vy
    ADD r14, r7
    LDI r15, 96
    STORE r14, r15       ; dz=96

    ; === INTERSECTION: find nearest sphere ===
    ; Initialize best_t = 0x7FFF, best_color = background
    LDI r12, 0x7FFF
    LDI r13, 0x080818

    ; --- Sphere 0 (base=0x2000) ---
    LDI r14, 0x2000
    CALL intersect_sphere
    LDI r15, 0x3100
    LOAD r15, r15        ; r15 = t_fixed for sphere 0
    JZ r15, skip_s0
    CMP r15, r12
    BGE r0, skip_s0      ; t >= best_t
    MOV r12, r15
    LDI r15, 0x2004
    LOAD r13, r15        ; best_color = sphere 0 color
    skip_s0:

    ; --- Sphere 1 (base=0x2007) ---
    LDI r14, 0x2007
    CALL intersect_sphere
    LDI r15, 0x3100
    LOAD r15, r15
    JZ r15, skip_s1
    CMP r15, r12
    BGE r0, skip_s1
    MOV r12, r15
    LDI r15, 0x200B
    LOAD r13, r15
    skip_s1:

    ; --- Sphere 2 (base=0x200E) ---
    LDI r14, 0x200E
    CALL intersect_sphere
    LDI r15, 0x3100
    LOAD r15, r15
    JZ r15, skip_s2
    CMP r15, r12
    BGE r0, skip_s2
    MOV r12, r15
    LDI r15, 0x2012
    LOAD r13, r15
    skip_s2:

    ; === SHADING ===
    ; If best_t unchanged (0x7FFF), use background
    LDI r15, 0x7FFF
    CMP r12, r15
    JZ r0, output_pixel   ; no hit, use bg color

    ; Compute brightness from depth
    ; brightness = max(32, 256 - best_t / 2)
    LDI r15, 256
    SUB r15, r12
    LDI r1, 32
    CMP r15, r1
    BGE r0, bright_ok
    MOV r15, r1            ; clamp to 32
    bright_ok:
    MOV r5, r15            ; r5 = brightness (0..255)

    ; Apply brightness to color channels
    ; R channel
    MOV r1, r13
    LDI r2, 16
    SHR r1, r2
    LDI r2, 0xFF
    AND r1, r2             ; r1 = R
    MUL r1, r5             ; r1 = R * brightness
    LDI r2, 8
    SHR r1, r2             ; r1 = R * bright / 256
    LDI r2, 16
    SHL r1, r2             ; r1 = shaded_R << 16
    MOV r6, r1             ; r6 accumulates final color

    ; G channel
    MOV r1, r13
    LDI r2, 8
    SHR r1, r2
    LDI r2, 0xFF
    AND r1, r2             ; r1 = G
    MUL r1, r5
    LDI r2, 8
    SHR r1, r2             ; r1 = G * bright / 256
    LDI r2, 8
    SHL r1, r2
    OR r6, r1              ; r6 |= shaded_G << 8

    ; B channel
    MOV r1, r13
    LDI r2, 0xFF
    AND r1, r2             ; r1 = B
    MUL r1, r5
    LDI r2, 8
    SHR r1, r2
    OR r6, r1              ; r6 |= shaded_B

    MOV r13, r6            ; r13 = final shaded color

    output_pixel:
    ; === OUTPUT 4x4 BLOCK ===
    MOV r15, r11
    LDI r1, 4
    MUL r15, r1            ; r15 = x * 4
    MOV r1, r10
    LDI r2, 4
    MUL r1, r2             ; r1 = y * 4
    LDI r2, 4
    LDI r3, 4
    RECTF r15, r1, r2, r3, r13

    ; X loop increment
    ADD r11, r7
    LDI r15, 64
    CMP r11, r15
    BLT r0, x_loop

  ; Y loop increment
  ADD r10, r7
  LDI r15, 64
  CMP r10, r15
  BLT r0, y_loop

; Display
FRAME
HALT

; ===== INTERSECTION SUBROUTINE =====
; Input: r14 = sphere base address
; Input (RAM): 0x3000-0x3002 ray origin, 0x3003-0x3005 ray direction
; Output (RAM): 0x3100 t_fixed (0 if no hit)
; Preserves: r7-r13, r28-r29
; Clobbers: r1-r6, r15-r27

intersect_sphere:
  ; Debug marker
  LDI r1, 0x5000
  LDI r2, 0xDEAD
  STORE r1, r2
  ; Load sphere data
  LOAD r15, r14           ; r15 = cx
  MOV r1, r14
  ADD r1, r7
  LOAD r16, r1            ; r16 = cy
  ADD r1, r7
  LOAD r17, r1            ; r17 = cz
  ADD r1, r7
  LOAD r18, r1            ; r18 = r_sq

  ; Compute L = O - C
  LDI r1, 0x3000
  LOAD r2, r1             ; r2 = ox
  SUB r2, r15             ; r2 = Lx = ox - cx

  LDI r1, 0x3001
  LOAD r3, r1             ; r3 = oy
  SUB r3, r16             ; r3 = Ly = oy - cy

  LDI r1, 0x3002
  LOAD r4, r1             ; r4 = oz
  SUB r4, r17             ; r4 = Lz = oz - cz

  ; Load ray direction
  LDI r1, 0x3003
  LOAD r5, r1             ; r5 = dx
  LDI r1, 0x3004
  LOAD r6, r1             ; r6 = dy
  LDI r1, 0x3005
  LOAD r19, r1            ; r19 = dz

  ; a = dx*dx + dy*dy + dz*dz
  MOV r20, r5
  MUL r20, r5             ; r20 = dx^2
  MOV r21, r6
  MUL r21, r6             ; r21 = dy^2
  ADD r20, r21
  MOV r21, r19
  MUL r21, r19            ; r21 = dz^2
  ADD r20, r21            ; r20 = a

  ; half_b = dx*Lx + dy*Ly + dz*Lz
  MOV r21, r5
  MUL r21, r2             ; dx*Lx
  MOV r22, r6
  MUL r22, r3             ; dy*Ly
  ADD r21, r22
  MOV r22, r19
  MUL r22, r4             ; dz*Lz
  ADD r21, r22            ; r21 = half_b

  ; c = Lx*Lx + Ly*Ly + Lz*Lz - r_sq
  MOV r22, r2
  MUL r22, r2             ; Lx^2
  MOV r23, r3
  MUL r23, r3             ; Ly^2
  ADD r22, r23
  MOV r23, r4
  MUL r23, r4             ; Lz^2
  ADD r22, r23            ; L*L
  SUB r22, r18            ; r22 = c = L*L - r_sq

  ; disc = half_b^2 - a*c
  MOV r23, r21
  MUL r23, r21            ; r23 = half_b^2
  MOV r24, r20
  MUL r24, r22            ; r24 = a*c

  ; If half_b^2 < a*c: no hit
  CMP r23, r24
  BLT r0, isect_no_hit

  ; disc = half_b^2 - a*c
  SUB r23, r24            ; r23 = disc

  ; === SQRT via Newton's method ===
  ; Initial guess = disc >> 8, min 1
  MOV r25, r23
  LDI r1, 8
  SHR r25, r1             ; r25 = disc >> 8
  JNZ r25, sqrt_init_ok
  LDI r25, 1
  sqrt_init_ok:

  ; Save disc
  MOV r26, r23            ; r26 = disc

  ; 10 Newton iterations
  LDI r27, 10
  sqrt_loop:
    MOV r1, r26            ; r1 = disc
    DIV r1, r25            ; r1 = disc / estimate
    ADD r1, r25            ; r1 = disc/est + est
    LDI r2, 1
    SHR r1, r2             ; r1 = new_estimate
    MOV r25, r1
    LDI r2, 1
    SUB r27, r2
    JNZ r27, sqrt_loop

  ; r25 = sqrt(disc)
  ; t = (-half_b - sqrt(disc)) / a
  MOV r1, r21             ; r1 = half_b
  NEG r1                  ; r1 = -half_b
  SUB r1, r25             ; r1 = -half_b - sqrt

  ; Check r1 > 0 (hit in front of ray)
  MOV r2, r1
  LDI r3, 31
  SAR r2, r3              ; sign bit check
  JNZ r2, isect_no_hit    ; negative = behind camera

  ; t_fixed = (r1 << 8) / a
  LDI r2, 8
  SHL r1, r2
  DIV r1, r20             ; r1 = t_fixed

  ; Store result
  LDI r2, 0x3100
  STORE r2, r1
  RET

isect_no_hit:
  LDI r1, 0x3100
  LDI r2, 0
  STORE r1, r2
  RET
