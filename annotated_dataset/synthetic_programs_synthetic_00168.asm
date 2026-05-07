; DESCRIPTION: This GeOS assembly code initializes registers `r8` and `r12`, then calls a series of functions to perform arithmetic operations including multiplication, XOR, division, subtraction, and modulo. The program halts after the operations are complete.

; subroutine calls
; initialization
  LDI r8, 1160
  LDI r12, 256
  CALL func_0
func_0:
  MUL r8, r10, r4
  MUL r1, r4, r3
  XOR r2, r6, r9
  RET
  CALL func_1
func_1:
  DIV r6, r5, r12
  SUB r5, r8, r13
  MOD r6, r12, r9
  RET
  HALT
