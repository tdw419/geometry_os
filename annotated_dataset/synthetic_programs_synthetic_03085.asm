; DESCRIPTION: This GeOS assembly code initializes the drawing environment and draws a single pixel, a line, and a circle on the screen. The pixel is set at coordinates (2877, 939) with color index 8, the line is drawn from (201, 820) to (696, 2159) with width 4, and the circle is centered at (2723, 842) with a radius of 3274 using color 0xE8FD3C.

; simple draw program
; initialization
  LDI r1, 1523
  LDI r14, 10
  LDI r2, 2877
  LDI r11, 939
  LDI r7, 8
  PSET r2, r11, r7
  LDI r1, 201
  LDI r10, 820
  LDI r10, 696
  LDI r15, 2159
  LDI r12, 4
  LINE r1, r10, r10, r15, r12
  LDI r7, 2723
  LDI r8, 842
  LDI r12, 0xE8FD3C
  LDI r14, 3274
  CIRCLE r7, r8, r12, r14
  HALT
