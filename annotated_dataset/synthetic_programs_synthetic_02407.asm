; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses the `PSET` instruction to set a pixel at coordinates (r14, r31) with color value r9. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r1, 0xF57151
  LDI r10, 1417
  LDI r8, 3642
  LDI r9, 0x8182B0
  LDI r9, 1911
  LDI r14, 32
  LDI r31, 402
  PSET r9, r14, r31
  HALT
