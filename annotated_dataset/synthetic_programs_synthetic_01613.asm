; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set a pixel at coordinates (4051, 3567) with color value 390. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r10, 0x93D956
  LDI r0, 2945
  LDI r7, 255
  LDI r13, 0xBEEB66
  LDI r1, 0x1E29E7
  LDI r6, 4051
  LDI r9, 3567
  LDI r4, 390
  PSET r6, r9, r4
  HALT
