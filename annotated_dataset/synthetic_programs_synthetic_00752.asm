; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then draws a filled circle at coordinates (754, 563) with radius 32 using color 0x490089. It also sets the fill color to 0x0638A5 before drawing the circle, and writes a pixel at coordinate (512, 4) with color 0x3A2DCD. The program halts afterward.

; simple draw program
; initialization
  LDI r12, 0xA3EB03
  LDI r30, 0xBA6FF5
  LDI r7, 10
  LDI r0, 1392
  LDI r10, 706
  LDI r8, 0xDFCAD8
  LDI r15, 0x490089
  LDI r5, 64
  LDI r14, 754
  LDI r10, 563
  LDI r9, 32
  LDI r5, 4
  CIRCLE r14, r10, r9, r5
  LDI r1, 0x0638A5
  FILL r1
  LDI r1, 0x3A2DCD
  LDI r2, 4
  LDI r13, 512
  WPIXEL
  HALT
