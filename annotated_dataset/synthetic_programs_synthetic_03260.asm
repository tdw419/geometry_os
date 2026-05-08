; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then fills a memory region starting from the address stored in register `r1` with the pattern defined by `FILL`. The program halts afterward.

; simple draw program
; initialization
  LDI r31, 16
  LDI r8, 4
  LDI r2, 1975
  LDI r4, 1155
  LDI r13, 912
  LDI r16, 2450
  LDI r1, 3189
  FILL r1
  HALT
