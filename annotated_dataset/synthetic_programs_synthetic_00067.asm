; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to plot a pixel at coordinates (r1, r13) with color value r8. The program halts afterward.

; simple draw program
; initialization
  LDI r1, 1895
  LDI r13, 423
  LDI r8, 3424
  LDI r5, 0x1AB0DD
  LDI r10, 0xF1B19B
  LDI r3, 32
  PSET r5, r10, r3
  HALT
