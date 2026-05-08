; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs arithmetic operations such as multiplication, division, addition, subtraction, bitwise AND/OR/SHL (shift left), and modulo operations on the registers. The code ends with a HALT instruction after all function calls are completed.

; subroutine calls
; initialization
  LDI r6, 1622
  LDI r9, 1
  LDI r8, 0xE70159
  LDI r5, 255
  LDI r12, 3950
  CALL func_0
func_0:
  MUL r0, r3, r5
  SHL r4, r0, r9
  AND r9, r13, r12
  SHL r15, r8, r2
  SUB r8, r4, r1
  RET
  CALL func_1
func_1:
  MOD r8, r2, r1
  AND r9, r3, r6
  RET
  CALL func_2
func_2:
  DIV r6, r28, r2
  MOD r10, r28, r13
  OR r7, r3, r10
  OR r14, r3, r4
  RET
  CALL func_3
func_3:
  SHL r6, r3, r9
  DIV r1, r12, r7
  SHL r11, r2, r4
  RET
  HALT
