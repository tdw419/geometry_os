; DESCRIPTION: This GeOS assembly code initializes registers and calls a subroutine (`func_0`) that performs arithmetic operations including division, bitwise AND, XOR, multiplication, and modulus. The results are stored in various registers, and the program halts execution after returning from the subroutine.

; subroutine calls
; initialization
  LDI r5, 0
  LDI r0, 3062
  LDI r13, 1
  CALL func_0
func_0:
  DIV r13, r12, r6
  AND r8, r12, r7
  XOR r15, r11, r12
  XOR r9, r1, r8
  MUL r4, r30, r11
  MOD r4, r14, r13
  RET
  HALT
