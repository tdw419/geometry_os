; tunnel.asm -- Concentric rectangle tunnel with depth shading
;
; Creates an infinite tunnel effect using nested rectangles.
; Each ring is drawn with depth-based shading (outer=dark, inner=bright).
; Tunnel rotates using SHR/AND for angle-based offset.
; Speed increases over time via TICKS-based acceleration.
;
; Algorithm:
;   - Screen center = (128, 128)
;   - Draw 32 concentric rectangles from outside-in
;   - Each rect: half_size = 128 - ring * 4 + rotation_offset
;   - Color shaded by depth: brightness = ring * 8 + time_hue
;   - Purple-blue glow: R=3/4*bright, G=1/4*bright, B=bright
;   - Rotation offset = (TICKS * speed) >> 3 & 15
;   - Speed = min(1 + TICKS>>9, 8) -- accelerates over time
;
; Memory map:
;   (no RAM storage needed -- pure register computation)
;
; Register convention:
;   r10 = 128 (screen center / base half-size)
;   r11 = ring index (0..31)
;   r12 = 32 (num rings)
;   r14 = 4 (shrink per ring)
;   r15 = packed color
;   r16 = rotation offset
;   r17 = current half-size
;   r18-r19 = temps
;   r20 = TICKS value
;   r21 = speed multiplier
;   r22 = brightness base
;   r23 = rect x
;   r24 = rect y
;   r25 = rect w
;   r26 = rect h
;   r27-r29 = temps for color packing
;   r7  = 1 (increment)

; === Constants ===
LDI r10, 128            ; screen center / base half-size
LDI r12, 32             ; number of concentric rings
LDI r14, 4              ; shrink per ring (128/32 = 4)
LDI r7, 1               ; increment

; === Main animation loop ===
frame_loop:
  ; Read TICKS for animation timing
  LDI r19, 0xFFE
  LOAD r20, r19           ; r20 = TICKS

  ; === Speed increase with TICKS-based acceleration ===
  ; speed = 1 + (TICKS >> 9) -- increases every 512 frames
  ; capped at 8 to prevent too-fast movement
  LDI r19, 9
  MOV r21, r20
  SHR r21, r19            ; r21 = TICKS >> 9
  LDI r19, 8
  CMP r21, r19
  BLT r0, speed_ok
  MOV r21, r19            ; cap at 8
speed_ok:
  ADDI r21, 1             ; r21 = speed (1..9)

  ; === Tunnel rotation using SHR/AND for angle division ===
  ; rotation_offset = (TICKS * speed) >> 3, masked to 0..15
  ; This creates a smooth rotation effect that speeds up
  MOV r16, r20
  MUL r16, r21            ; r16 = TICKS * speed
  LDI r19, 3
  SHR r16, r19            ; r16 = (TICKS * speed) >> 3
  LDI r19, 15
  AND r16, r19            ; r16 = offset & 15 (0..15 range)

  ; === Clear screen to black (background) ===
  LDI r15, 0
  FILL r15

  ; === Draw concentric rectangles (outside-in) ===
  LDI r11, 0              ; ring index = 0 (outermost)

ring_loop:
  ; Compute half-size for this ring
  ; half_size = 128 - ring * 4
  MOV r19, r11
  MUL r19, r14            ; r19 = ring * 4
  MOV r17, r10
  SUB r17, r19            ; r17 = half_size

  ; Add rotation offset for tunnel twist
  ; Alternate direction per ring for helix effect
  MOV r18, r11
  ANDI r18, 1             ; r18 = ring & 1
  JZ r18, rot_neg

  ; Positive rotation offset
  ADD r17, r16
  JMP rot_done
rot_neg:
  ; Negative rotation offset
  SUB r17, r16
rot_done:

  ; Clamp half_size to minimum of 1
  LDI r19, 1
  CMP r17, r19
  BGE r0, size_ok
  MOV r17, r19
size_ok:

  ; === Compute depth-shaded color ===
  ; brightness = ring * 8 + (TICKS >> 2), clamped to 0..255
  ; This makes inner rings brighter and adds time-varying hue
  MOV r22, r11
  LDI r19, 8
  MUL r22, r19            ; r22 = ring * 8 (0..248)

  ; Add slow hue cycling from TICKS
  MOV r19, r20
  LDI r18, 2
  SHR r19, r18            ; r19 = TICKS >> 2
  ADD r22, r19            ; brightness += time_offset
  LDI r19, 255
  AND r22, r19            ; clamp to 0..255

  ; Pack color as purple-blue glow:
  ; R = brightness * 3/4
  ; G = brightness * 1/4
  ; B = brightness
  MOV r27, r22            ; r27 = blue = brightness

  ; Red = brightness * 3/4 = brightness/2 + brightness/4
  MOV r28, r22
  LDI r19, 1
  SHR r28, r19            ; r28 = brightness >> 1
  MOV r29, r22
  LDI r19, 2
  SHR r29, r19            ; r29 = brightness >> 2
  ADD r28, r29            ; r28 = 3/4 * brightness
  LDI r19, 255
  AND r28, r19            ; clamp red

  ; Green = brightness >> 2
  MOV r29, r22
  LDI r19, 2
  SHR r29, r19            ; r29 = brightness >> 2

  ; Pack: color = (R << 16) | (G << 8) | B
  LDI r19, 16
  SHL r28, r19            ; R << 16
  LDI r19, 8
  SHL r29, r19            ; G << 8
  OR r28, r29             ; R<<16 | G<<8
  OR r28, r27             ; | B
  MOV r15, r28            ; r15 = final packed color

  ; === Draw filled rectangle ===
  ; x = center - half_size, y = center - half_size
  ; w = 2 * half_size, h = 2 * half_size
  MOV r23, r10
  SUB r23, r17            ; x = 128 - half_size
  MOV r24, r10
  SUB r24, r17            ; y = 128 - half_size
  MOV r25, r17
  ADD r25, r17            ; w = 2 * half_size
  MOV r26, r17
  ADD r26, r17            ; h = 2 * half_size

  RECTF r23, r24, r25, r26, r15

  ; Next ring (inner)
  ADDI r11, 1
  CMP r11, r12
  BLT r0, ring_loop

  ; Yield frame to renderer
  FRAME
  JMP frame_loop

  HALT                     ; unreachable -- infinite animation
