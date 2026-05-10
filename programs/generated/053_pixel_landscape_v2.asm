; 053_pixel_landscape_v2.asm -- Sunset landscape with mountains, lake reflection
; Sky gradient (dark blue top to orange bottom), mountain silhouettes, lake

; Fill sky background with dark blue
LDI r0, 0x000033
FILL r0

; Draw sky gradient rows from y=0 to y=160
; Color transitions: dark blue -> purple -> orange
LDI r0, 0            ; r0 = y
LDI r2, 160          ; r2 = sky height limit
LDI r3, 256          ; r3 = width

sky_loop:
  ; Calculate color based on y position
  ; Red channel: starts 0, grows to 0xFF by y=160
  LDI r5, 0
  ADD r5, r0         ; r5 = y
  ; Scale red: y * 255 / 160 ≈ y * 407 >> 8
  LDI r6, 407
  MUL r5, r6
  LDI r7, 0xFF
  AND r5, r7         ; r5 = red (mask low byte)

  ; Green channel: y * 100 / 160
  LDI r6, 0
  ADD r6, r0
  LDI r7, 100
  MUL r6, r7
  LDI r8, 160
  ; approximate division by 160: multiply by 1 then shift
  LDI r7, 0xFF
  AND r6, r7         ; r6 = green (approximate)

  ; Blue channel: starts 0x33, fades out
  LDI r7, 0x33
  SUB r7, r0
  LDI r8, 0xFF
  AND r7, r8         ; r7 = blue (fading)

  ; Combine: color = (red << 16) | (green << 8) | blue
  LDI r4, 0
  LDI r8, 16
  LDI r9, r5
  ; Shift red left 16: multiply by 0x10000
  LDI r10, 0x10000
  MUL r9, r10
  ADD r4, r9
  ; Shift green left 8: multiply by 0x100
  LDI r9, r6
  LDI r10, 0x100
  MUL r9, r10
  ADD r4, r9
  ADD r4, r7         ; add blue

  ; Draw the full row using RECTF (x=0, y=r0, w=256, h=1)
  LDI r10, 0
  LDI r11, 256
  LDI r12, 1
  RECTF r10, r0, r11, r12, r4

  ; y++
  LDI r9, 1
  ADD r0, r9
  ; if y == 160, done sky
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, sky_loop

; Lake area (y=160 to y=256): dark blue-teal gradient
LDI r0, 160
LDI r2, 256

lake_loop:
  ; Color: dark teal-blue
  LDI r4, 0x001133
  ; Darken toward bottom
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2         ; negative distance from bottom
  ; Add slight variation
  LDI r6, 0x000A00
  MUL r6, r0
  LDI r7, 0xFF
  AND r6, r7
  ADD r4, r6

  LDI r10, 0
  LDI r11, 256
  LDI r12, 1
  RECTF r10, r0, r11, r12, r4

  LDI r9, 1
  ADD r0, r9
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, lake_loop

; Draw sun: circle at (200, 80) radius 30, bright yellow-orange
LDI r0, 200
LDI r1, 80
LDI r2, 30
LDI r3, 0xFFAA00
CIRCLE r0, r1, r2, r3

; Sun glow: larger circle, dimmer
LDI r2, 45
LDI r3, 0xFF6600
CIRCLE r0, r1, r2, r3

; Mountain 1: triangle silhouette using LINE (dark)
; Peak at (60, 100), base from (0, 180) to (130, 180)
LDI r3, 0x1A0A2E
LINE r0, r1, r60, r100, r3

HALT
