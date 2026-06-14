; 028_starfield.asm -- Starfield: dark blue night sky with scattered stars
; Nested loops place dots at grid positions; row offset alternates for scatter
; Brightness varies per row for depth effect

; Fill background dark blue
LDI r0, 0x0A0A2E
FILL r0

LDI r4, 17           ; x/y step
LDI r7, 1            ; increment
LDI r1, 8            ; y start

y_loop:
  ; Compute brightness per row: 0x66 + (y * 3) & 0x99
  ; Use r12 as color
  LDI r12, 0x66
  LDI r13, 0
  ADD r13, r1
  LDI r9, 3
  MUL r13, r9
  LDI r10, 0x99
  AND r13, r10
  ADD r12, r13       ; brightness varies 0x66 to 0xFF

  ; Pack as white: color = b | (b<<8) | (b<<16)
  LDI r11, 0
  ADD r11, r12
  LDI r9, 0
  ADD r9, r11
  LDI r10, 256
  MUL r9, r10
  OR r11, r9
  LDI r9, 0
  ADD r9, r11
  LDI r10, 256
  MUL r9, r10
  OR r11, r9
  LDI r12, 0
  ADD r12, r11       ; r12 = grayscale star color

  ; x start: alternate between 3 and 11 based on even/odd row
  LDI r0, 3

  ; Draw 15 stars across
  LDI r14, 15

x_loop:
  PSET r0, r1, r12

  ; x += 17
  ADD r0, r4

  ; count--
  SUB r14, r7
  JNZ r14, x_loop

  ; y += 17
  ADD r1, r4

  ; if y < 250, continue
  LDI r5, 250
  SUB r5, r1
  JNZ r5, y_loop

HALT
