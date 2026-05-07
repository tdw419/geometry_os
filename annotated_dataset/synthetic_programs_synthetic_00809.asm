; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `CIRCLE` instruction to draw a circle on the screen at coordinates (0x7EC67C, 0xF50C0C) with radius 0x4670E4 and color 0x58205A. After drawing the circle, it sets a pixel at coordinates (3778, 515) with color 0x757D34 before halting execution.

; simple draw program
; initialization
  LDI r1, 0x6C5DC7
  LDI r27, 504
  LDI r4, 3371
  LDI r14, 1
  LDI r3, 32
  LDI r15, 0x7EC67C
  LDI r11, 0xF50C0C
  LDI r2, 0x4670E4
  LDI r6, 0x58205A
  CIRCLE r15, r11, r2, r6
  LDI r9, 3778
  LDI r4, 0x757D34
  LDI r5, 515
  PSETI
  HALT
