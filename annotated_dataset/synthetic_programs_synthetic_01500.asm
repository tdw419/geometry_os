; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `RECTF` instruction to draw a filled rectangle on the screen. The program halts afterward.

; simple draw program
; initialization
  LDI r13, 1387
  LDI r7, 943
  LDI r21, 0x7B3CE5
  LDI r11, 10
  LDI r19, 16
  LDI r10, 3502
  LDI r7, 0x1ADFD3
  LDI r31, 727
  LDI r5, 338
  LDI r1, 64
  LDI r4, 6
  RECTF r7, r31, r5, r1, r4
  HALT
