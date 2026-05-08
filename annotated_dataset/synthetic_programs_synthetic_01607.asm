; DESCRIPTION: This GeOS assembly code initializes two registers, `r3` and `r1`, and enters a drawing loop (`main_0`). Within the loop, it checks if `r2` is equal to 247, calculates a modulus operation between `r0` and `r13`, and then calls a `FRAME` subroutine before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r3, 0xD33EED
  LDI r1, 1
main_0:
  CMPI r2, 247
  MOD r14, r0, r13
  FRAME
  JMP main_0
