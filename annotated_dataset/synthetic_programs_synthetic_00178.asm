; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `RECTF` instruction to draw two filled rectangles on the screen. The first rectangle is drawn with dimensions and color specified by the initial register values, followed by a second rectangle using different parameters. The program halts after drawing both rectangles.

; simple draw program
; initialization
  LDI r10, 3071
  LDI r11, 10
  LDI r14, 2022
  LDI r7, 1336
  LDI r4, 0xF6C5CC
  LDI r1, 0xA916A4
  LDI r8, 32
  LDI r6, 0x67A027
  LDI r10, 0xEC8EA8
  RECTF r4, r1, r8, r6, r10
  LDI r12, 1818
  LDI r2, 501
  LDI r4, 8
  LDI r7, 0xEF29CB
  LDI r0, 3865
  RECTF r12, r2, r4, r7, r0
  HALT
