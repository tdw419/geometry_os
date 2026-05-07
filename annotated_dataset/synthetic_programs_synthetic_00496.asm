; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `FILL` instruction to fill two memory locations (`r15` and `r2`) with data. The program halts afterward, performing a simple draw operation by setting pixel values in specified memory addresses.

; simple draw program
; initialization
  LDI r10, 10
  LDI r15, 1114
  LDI r5, 1572
  LDI r6, 0x8126E6
  LDI r12, 32
  LDI r15, 10
  FILL r15
  LDI r2, 1003
  FILL r2
  HALT
