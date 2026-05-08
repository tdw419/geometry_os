; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to draw a pixel at coordinates (3856, 1118) with color 0x501BFF. The program halts afterward.

; simple draw program
; initialization
  LDI r12, 0x59C615
  LDI r8, 214
  LDI r11, 0x7DD3D2
  LDI r1, 0
  LDI r7, 2987
  LDI r14, 0x762A30
  LDI r1, 3856
  LDI r17, 0x501BFF
  LDI r10, 1118
  PSET r1, r17, r10
  HALT
