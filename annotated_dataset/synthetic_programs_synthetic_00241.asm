; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws two circles on the screen using the `CIRCLE` instruction. The first circle has a center at coordinates (1888, 1389) with a radius of 16 pixels, and the second circle has a center at (255, 2046) with a radius of 255 pixels. Finally, the program halts execution.

; simple draw program
; initialization
  LDI r13, 0x529F4A
  LDI r9, 10
  LDI r16, 1888
  LDI r8, 1389
  LDI r7, 1
  LDI r7, 16
  CIRCLE r16, r8, r7, r7
  LDI r10, 255
  LDI r1, 2046
  LDI r2, 0xB7065B
  LDI r6, 255
  CIRCLE r10, r1, r2, r6
  HALT
