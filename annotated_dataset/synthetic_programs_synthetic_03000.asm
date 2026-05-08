; DESCRIPTION: This GeOS assembly code initializes various registers with color values and coordinates, draws a pixel at a specified location using the `WPIXEL` instruction, fills an area with a color using the `FILL` instruction, and finally draws a rectangle using the `RECTF` instruction before halting execution.

; simple draw program
; initialization
  LDI r13, 2823
  LDI r2, 280
  LDI r9, 255
  LDI r12, 0x00879F
  LDI r4, 0xD50864
  LDI r8, 0x1B920C
  LDI r2, 0x580E8B
  LDI r10, 0xB41FB0
  LDI r2, 0x3875AA
  WPIXEL
  LDI r1, 0xF23EDD
  FILL r1
  LDI r14, 1859
  LDI r7, 0x0B5F73
  LDI r7, 0xF62CD8
  LDI r15, 128
  LDI r4, 787
  RECTF r14, r7, r7, r15, r4
  HALT
