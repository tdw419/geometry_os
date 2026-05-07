; DESCRIPTION: This GeOS assembly code initializes a simple drawing program by setting up registers with specific values and using the `PSET` instruction to draw a pixel at coordinates (3085, 0) with color 0x9619E8. The program then halts execution.

; simple draw program
; initialization
  LDI r12, 0xF43844
  LDI r13, 256
  LDI r14, 3196
  LDI r10, 0xD73F60
  LDI r15, 0x9A3EF1
  FILL r15
  LDI r30, 0
  LDI r0, 3085
  LDI r4, 0x9619E8
  PSET r30, r0, r4
  HALT
