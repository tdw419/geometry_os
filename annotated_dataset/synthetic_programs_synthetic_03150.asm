; DESCRIPTION: This GeOS assembly code initializes registers to set pixel colors and positions on a display. It uses the `PSET` instruction to plot two pixels: one colored 0xB7D41F at coordinates (2844, 0) and another colored 0x30D032 at coordinates (10, 128). The program then halts execution.

; simple draw program
; initialization
  LDI r9, 2
  LDI r1, 2526
  LDI r3, 2593
  LDI r12, 0xB7D41F
  LDI r2, 2844
  LDI r1, 255
  LDI r6, 0
  LDI r12, 0x30D032
  PSET r1, r6, r12
  LDI r9, 10
  LDI r15, 128
  LDI r4, 8
  PSET r9, r15, r4
  HALT
