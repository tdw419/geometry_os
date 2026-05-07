; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to plot a single pixel at coordinates (297, 205) with color 0x242AE1 on the screen. The program then halts execution.

; simple draw program
; initialization
  LDI r4, 0xB30942
  LDI r14, 849
  LDI r10, 2
  LDI r1, 0x37CD81
  LDI r11, 297
  LDI r29, 0x4BDF2C
  LDI r7, 205
  LDI r13, 0x242AE1
  PSET r29, r7, r13
  HALT
