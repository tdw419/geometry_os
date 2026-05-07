; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and uses the `PSETI` instruction to set a pixel at coordinates (3563, 2818) with color 0xD0F9FE. The program then halts execution.

; simple draw program
; initialization
  LDI r8, 0xD0F9FE
  LDI r14, 64
  LDI r2, 3563
  LDI r4, 2818
  LDI r10, 0xE077E6
  LDI r1, 4
  LDI r1, 3535
  PSETI
  HALT
