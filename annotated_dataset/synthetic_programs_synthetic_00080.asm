; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a filled rectangle on the screen using the `RECTF` instruction. The program halts after drawing the rectangle.

; simple draw program
; initialization
  LDI r7, 8
  LDI r11, 0x50D36B
  LDI r18, 64
  LDI r9, 256
  LDI r15, 245
  LDI r13, 0xAB48FD
  LDI r10, 510
  LDI r2, 289
  LDI r2, 660
  LDI r15, 0
  LDI r15, 3534
  RECTF r10, r2, r2, r15, r15
  HALT
