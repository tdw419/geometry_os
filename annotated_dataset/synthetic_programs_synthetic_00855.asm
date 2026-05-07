; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to draw a pixel at a calculated position. The program halts after drawing the pixel.

; simple draw program
; initialization
  LDI r8, 3718
  LDI r14, 1408
  LDI r12, 0x4DD8F7
  LDI r11, 0
  LDI r6, 2370
  LDI r13, 32
  LDI r2, 256
  LDI r15, 32
  LDI r15, 0x76FA4A
  LDI r13, 0xE9AB03
  WPIXEL
  LDI r15, 32
  LDI r2, 190
  LDI r21, 695
  PSET r15, r2, r21
  HALT
