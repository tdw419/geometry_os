; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` instruction to set a pixel at coordinates (3080, 1161) with a color value of 64. The program then halts execution.

; simple draw program
; initialization
  LDI r0, 0x8DBB65
  LDI r2, 16
  LDI r5, 3982
  LDI r14, 3132
  LDI r6, 128
  LDI r2, 3080
  LDI r1, 1161
  LDI r10, 64
  PSET r2, r1, r10
  HALT
