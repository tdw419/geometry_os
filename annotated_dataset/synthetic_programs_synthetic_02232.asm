; DESCRIPTION: This GeOS assembly code initializes several registers and uses the `PSET` instruction to set a pixel on the screen at coordinates (32, 0xA8A993) with intensity 16. The program then halts execution.

; simple draw program
; initialization
  LDI r13, 8
  LDI r10, 3747
  LDI r13, 32
  LDI r13, 0xA8A993
  LDI r8, 16
  PSET r13, r13, r8
  HALT
