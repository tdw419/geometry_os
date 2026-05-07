; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls three subroutines (`func_0`, `func_1`, `func_2`). Each subroutine performs arithmetic operations such as division, multiplication, modulo, shift left, bitwise OR, addition, and returns. The final instruction is a HALT command to stop the program execution.

; subroutine calls
; initialization
  LDI r14, 8
  LDI r11, 4
  LDI r0, 3953
  LDI r8, 10
  LDI r6, 986
  LDI r1, 64
  LDI r12, 89
  CALL func_0
func_0:
  DIV r0, r13, r14
  MUL r12, r14, r3
  MOD r6, r14, r4
  SHL r19, r10, r11
  RET
  CALL func_1
func_1:
  SHL r12, r13, r1
  MOD r1, r4, r2
  MUL r5, r7, r11
  RET
  CALL func_2
func_2:
  SHL r10, r15, r1
  OR r12, r2, r14
  MUL r8, r1, r0
  ADD r7, r1, r4
  RET
  HALT
