; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs a series of arithmetic operations such as addition, subtraction, multiplication, division, bitwise AND/OR/XOR, shifts, and returns. The final instruction is HALT, indicating the end of execution.

; subroutine calls
; initialization
  LDI r3, 0x8382AE
  LDI r13, 2288
  LDI r12, 3749
  CALL func_0
func_0:
  SUB r2, r19, r1
  OR r3, r7, r15
  DIV r11, r9, r0
  AND r13, r10, r14
  RET
  CALL func_1
func_1:
  MUL r3, r9, r11
  AND r7, r10, r17
  MOD r8, r13, r15
  DIV r2, r15, r7
  SUB r4, r1, r15
  XOR r3, r15, r4
  RET
  CALL func_2
func_2:
  OR r2, r14, r9
  SHL r14, r8, r11
  DIV r3, r11, r13
  AND r1, r13, r15
  RET
  CALL func_3
func_3:
  MUL r8, r11, r12
  OR r13, r2, r6
  RET
  HALT
