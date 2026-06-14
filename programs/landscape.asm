; landscape.asm -- Procedural Landscape Generator with Parallax Scrolling
;
; Features:
;   1. Midpoint displacement terrain silhouette generation (3 layers)
;   2. Multi-layer parallax scrolling (far=slow, near=fast)
;   3. Sunset sun with atmospheric glow (concentric circles)
;
; Memory layout:
;   0x2000-0x20FF  Far terrain heights (256 u32, Y coords 0-255)
;   0x2100-0x21FF  Mid terrain heights (256 u32, Y coords 0-255)
;   0x2200-0x22FF  Near terrain heights (256 u32, Y coords 0-255)
;
; Register convention:
;   r7  = 1 (constant throughout)
;   r8  = 0xFF (mask constant throughout)

LDI r7, 1
LDI r8, 0xFF

; ========================================
; Generate terrain layers via midpoint displacement
; ========================================

; Far layer: low mountains, base_height=110, roughness=18
LDI r9, 0x2000
LDI r15, 110
LDI r16, 18
CALL generate_terrain

; Mid layer: medium mountains, base_height=145, roughness=28
LDI r9, 0x2100
LDI r15, 145
LDI r16, 28
CALL generate_terrain

; Near layer: tall foreground, base_height=180, roughness=38
LDI r9, 0x2200
LDI r15, 180
LDI r16, 38
CALL generate_terrain

JMP main_loop

; ========================================
; Subroutine: generate_terrain
;
; Generates 256-point terrain height array using midpoint displacement.
; Circular wrapping (h[256] = h[0]) for seamless scrolling.
;
; Input: r9  = base address of 256-word height array
;        r15 = base_height (Y center, e.g. 110)
;        r16 = initial roughness (max displacement)
; Uses:  r10-r29 (all clobbered)
; Preserves: r7, r8
; ========================================
generate_terrain:
  ; --- Set h[0] = base_height + random displacement ---
  RAND r10
  AND r10, r8            ; r10 = rand & 0xFF
  MOV r11, r16
  LDI r12, 1
  SHL r11, r12           ; r11 = roughness * 2
  SUB r11, r7            ; r11 = roughness * 2 - 1
  AND r10, r11           ; r10 = rand & (2R-1) -> 0..2R-1
  SUB r10, r16           ; r10 = -R..R-1
  ADD r10, r15           ; r10 = base + displacement
  AND r10, r8            ; clamp to [0, 255]
  STORE r9, r10          ; h[0]

  ; --- Set h[128] = h[0] + random displacement (wrapping) ---
  LOAD r10, r9           ; r10 = h[0]
  RAND r11
  AND r11, r8            ; r11 = rand & 0xFF
  MOV r12, r16
  LDI r13, 1
  SHL r12, r13           ; r12 = roughness * 2
  SUB r12, r7            ; r12 = roughness * 2 - 1
  AND r11, r12           ; r11 = rand & (2R-1)
  SUB r11, r16           ; r11 = -R..R-1
  ADD r10, r11           ; r10 = h[0] + displacement
  AND r10, r8            ; clamp to [0, 255]
  MOV r11, r9
  LDI r12, 128
  ADD r11, r12           ; r11 = base + 128
  STORE r11, r10         ; h[128]

  ; --- Midpoint displacement loop ---
  ; Levels: step = 128, 64, 32, 16, 8, 4, 2
  ; Roughness halves each level
  LDI r20, 128           ; step = 128
  MOV r21, r16           ; roughness = initial

  gt_level_loop:
    ; half = step >> 1
    MOV r22, r20
    LDI r23, 1
    SHR r22, r23         ; r22 = half

    ; mid = half (first midpoint)
    MOV r23, r22

    gt_mid_loop:
      ; left = mid - half
      MOV r24, r23
      SUB r24, r22       ; r24 = left index

      ; right = (mid + half) & 0xFF
      MOV r25, r23
      ADD r25, r22       ; r25 = mid + half
      AND r25, r8        ; wrap to [0, 255]

      ; Load h[left]
      MOV r26, r9
      ADD r26, r24       ; r26 = base + left
      LOAD r27, r26      ; r27 = h[left]

      ; Load h[right]
      MOV r26, r9
      ADD r26, r25       ; r26 = base + right
      LOAD r28, r26      ; r28 = h[right]

      ; avg = (h[left] + h[right]) >> 1
      ADD r28, r27       ; r28 = h[left] + h[right]
      LDI r26, 1
      SHR r28, r26       ; r28 = average

      ; Random displacement: rand & (2R-1) - R
      RAND r26
      AND r26, r8        ; r26 = rand & 0xFF
      MOV r27, r21
      LDI r29, 1
      SHL r27, r29       ; r27 = roughness * 2
      SUB r27, r7        ; r27 = roughness * 2 - 1
      AND r26, r27       ; r26 = rand & (2R-1)
      SUB r26, r21       ; r26 = -R..R-1
      ADD r28, r26       ; r28 = avg + displacement
      AND r28, r8        ; clamp to [0, 255]

      ; Store h[mid]
      MOV r26, r9
      ADD r26, r23       ; r26 = base + mid
      STORE r26, r28     ; h[mid] = computed height

      ; mid += step
      ADD r23, r20

      ; if mid < 256, continue inner loop
      LDI r26, 256
      CMP r23, r26
      BLT r0, gt_mid_loop

    ; step >>= 1
    LDI r26, 1
    SHR r20, r26

    ; roughness >>= 1
    SHR r21, r26

    ; if step >= 2, continue level loop
    LDI r26, 2
    CMP r20, r26
    BGE r0, gt_level_loop

  RET

; ========================================
; Main animation loop
; ========================================
main_loop:
  ; --- Sky gradient ---
  ; Base sky fill (dark blue-purple)
  LDI r10, 0x0A0028
  FILL r10

  ; Horizon glow band (y=80 to y=109)
  LDI r10, 0
  LDI r11, 80
  LDI r12, 256
  LDI r13, 30
  LDI r14, 0x180830
  RECTF r10, r11, r12, r13, r14

  ; Lower horizon band (y=110 to y=139)
  LDI r10, 0
  LDI r11, 110
  LDI r12, 256
  LDI r13, 30
  LDI r14, 0x301028
  RECTF r10, r11, r12, r13, r14

  ; Warm band near horizon (y=140 to y=159)
  LDI r10, 0
  LDI r11, 140
  LDI r12, 256
  LDI r13, 20
  LDI r14, 0x501820
  RECTF r10, r11, r12, r13, r14

  ; --- Sun with atmospheric glow ---
  ; Sun center at (180, 85), concentric circles outer to inner
  LDI r10, 180
  LDI r11, 85

  LDI r12, 55
  LDI r13, 0x100400
  CIRCLE r10, r11, r12, r13

  LDI r12, 45
  LDI r13, 0x200800
  CIRCLE r10, r11, r12, r13

  LDI r12, 37
  LDI r13, 0x401000
  CIRCLE r10, r11, r12, r13

  LDI r12, 30
  LDI r13, 0x802000
  CIRCLE r10, r11, r12, r13

  LDI r12, 24
  LDI r13, 0xB03000
  CIRCLE r10, r11, r12, r13

  LDI r12, 18
  LDI r13, 0xE05000
  CIRCLE r10, r11, r12, r13

  LDI r12, 13
  LDI r13, 0xFF7000
  CIRCLE r10, r11, r12, r13

  LDI r12, 9
  LDI r13, 0xFFA020
  CIRCLE r10, r11, r12, r13

  LDI r12, 5
  LDI r13, 0xFFD040
  CIRCLE r10, r11, r12, r13

  ; --- Far terrain layer (scroll speed: TICKS >> 2) ---
  LDI r14, 0x2000       ; far terrain base
  LDI r10, 0xFFE
  LOAD r11, r10         ; r11 = TICKS
  LDI r10, 2
  SHR r11, r10          ; r11 = TICKS >> 2
  AND r11, r8           ; r11 = far scroll offset

  LDI r10, 0            ; x = 0
  LDI r16, 255          ; y bottom
  LDI r17, 0x1A0A30     ; far color (misty blue-purple)

  far_col_loop:
    MOV r12, r10
    ADD r12, r11         ; r12 = x + offset
    AND r12, r8          ; r12 = terrain index
    MOV r13, r14
    ADD r13, r12         ; r13 = base + index
    LOAD r15, r13        ; r15 = height
    LINE r10, r15, r10, r16, r17
    ADD r10, r7          ; x++
    LDI r12, 256
    CMP r10, r12
    BLT r0, far_col_loop

  ; --- Mid terrain layer (scroll speed: TICKS >> 1) ---
  LDI r14, 0x2100       ; mid terrain base
  LDI r10, 0xFFE
  LOAD r11, r10         ; r11 = TICKS
  LDI r10, 1
  SHR r11, r10          ; r11 = TICKS >> 1
  AND r11, r8           ; r11 = mid scroll offset

  LDI r10, 0            ; x = 0
  LDI r16, 255
  LDI r17, 0x120525     ; mid color (darker purple)

  mid_col_loop:
    MOV r12, r10
    ADD r12, r11
    AND r12, r8
    MOV r13, r14
    ADD r13, r12
    LOAD r15, r13
    LINE r10, r15, r10, r16, r17
    ADD r10, r7
    LDI r12, 256
    CMP r10, r12
    BLT r0, mid_col_loop

  ; --- Near terrain layer (scroll speed: TICKS) ---
  LDI r14, 0x2200       ; near terrain base
  LDI r10, 0xFFE
  LOAD r11, r10         ; r11 = TICKS
  AND r11, r8           ; r11 = near scroll offset

  LDI r10, 0            ; x = 0
  LDI r16, 255
  LDI r17, 0x0A0218     ; near color (very dark silhouette)

  near_col_loop:
    MOV r12, r10
    ADD r12, r11
    AND r12, r8
    MOV r13, r14
    ADD r13, r12
    LOAD r15, r13
    LINE r10, r15, r10, r16, r17
    ADD r10, r7
    LDI r12, 256
    CMP r10, r12
    BLT r0, near_col_loop

  FRAME
  JMP main_loop
