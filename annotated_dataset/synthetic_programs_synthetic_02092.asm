; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs a line drawing operation followed by a rectangle fill operation on a graphical display. The program halts after completing the drawing tasks.

; simple draw program
; initialization
  LDI r10, 256
  LDI r15, 1665
  LDI r9, 3454
  LDI r12, 255
  LDI r11, 4
  LDI r7, 588
  LDI r11, 0x1CDA65
  FILL r11
  LDI r3, 3558
  LDI r4, 3121
  LDI r0, 10
  LDI r7, 255
  LDI r13, 127
  LINE r3, r4, r0, r7, r13
  LDI r7, 3266
  LDI r9, 3788
  LDI r8, 4
  LDI r7, 16
  LDI r9, 256
  RECTF r7, r9, r8, r7, r9
  HALT
