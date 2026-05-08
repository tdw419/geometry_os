; DESCRIPTION: This GeOS assembly code initializes registers and calls a subroutine named `func_0`. The subroutine performs arithmetic operations including addition, AND bitwise operation, modulo, division, left shift, and another modulo, then returns.

; subroutine calls
; initialization
  LDI r4, 4
  LDI r14, 0x1DDD2C
  CALL func_0
func_0:
  ADD r6, r8, r10
  AND r8, r5, r7
  MOD r15, r9, r24
  DIV r6, r8, r5
  SHL r22, r8, r15
  MOD r14, r7, r6
  RET
  HALT
