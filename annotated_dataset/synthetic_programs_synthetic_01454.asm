; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then draws a circle using the `CIRCLE` instruction. After drawing the circle, it draws a filled rectangle using the `RECTF` instruction before halting execution.

; simple draw program
; initialization
  LDI r7, 0x1538AD
  LDI r4, 3390
  LDI r6, 1
  LDI r10, 32
  LDI r5, 2054
  LDI r8, 0x7C1CC2
  LDI r9, 0xDDE802
  LDI r0, 0xDFE5D9
  LDI r15, 3564
  LDI r5, 0x33E890
  LDI r9, 2
  CIRCLE r0, r15, r5, r9
  LDI r2, 1144
  LDI r10, 0x9C6074
  LDI r0, 2546
  LDI r7, 1214
  LDI r7, 4
  RECTF r2, r10, r0, r7, r7
  HALT
