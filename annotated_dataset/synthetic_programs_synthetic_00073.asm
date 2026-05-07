; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to plot a single pixel at coordinates (511, 1748) on the screen. The program halts execution afterward.

; simple draw program
; initialization
  LDI r13, 1056
  LDI r10, 3687
  LDI r1, 2005
  LDI r0, 0x35E99E
  LDI r5, 1827
  LDI r14, 32
  LDI r12, 10
  LDI r31, 0xF3D309
  LDI r4, 4
  LDI r1, 511
  LDI r11, 1748
  PSET r4, r1, r11
  HALT
