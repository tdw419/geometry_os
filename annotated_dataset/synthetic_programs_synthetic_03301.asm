; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a circle on the screen using the `CIRCLE` instruction. The program halts after drawing the circle.

; simple draw program
; initialization
  LDI r2, 536
  LDI r12, 8
  LDI r8, 901
  LDI r14, 2805
  LDI r0, 4
  LDI r0, 0xB3336D
  LDI r11, 2691
  LDI r9, 0x324457
  CIRCLE r0, r0, r11, r9
  HALT
