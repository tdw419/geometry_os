; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then draws a rectangle using the `RECTF` instruction followed by a circle using the `CIRCLE` instruction. The program halts after completing these drawing operations.

; simple draw program
; initialization
  LDI r15, 0xF9CC07
  LDI r21, 0x543507
  LDI r6, 255
  LDI r8, 10
  LDI r11, 64
  LDI r9, 4008
  LDI r8, 2
  LDI r15, 2558
  LDI r1, 0xE92B69
  LDI r8, 10
  RECTF r9, r8, r15, r1, r8
  LDI r3, 1794
  LDI r8, 0xBE6828
  LDI r26, 0
  LDI r11, 680
  CIRCLE r3, r8, r26, r11
  HALT
