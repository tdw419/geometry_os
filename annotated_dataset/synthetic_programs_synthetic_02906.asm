; DESCRIPTION: This GeOS assembly code defines a series of subroutines (func_0, func_1, func_2, and func_3) that perform arithmetic operations such as multiplication (MUL), division (DIV), modulo (MOD), shift right (SHR), shift left (SHL), bitwise AND (AND), bitwise OR (OR), and addition (ADD). The code initializes registers with specific values and sequentially calls each subroutine, modifying register contents based on the operations performed.

; subroutine calls
; initialization
  LDI r3, 3795
  LDI r0, 0
  LDI r30, 64
  CALL func_0
func_0:
  MUL r3, r5, r11
  MOD r4, r11, r5
  SHR r31, r13, r14
  DIV r15, r8, r10
  RET
  CALL func_1
func_1:
  DIV r3, r2, r9
  MUL r12, r30, r9
  MOD r10, r5, r8
  SHL r10, r3, r15
  OR r9, r1, r15
  RET
  CALL func_2
func_2:
  AND r10, r2, r0
  MUL r13, r15, r11
  RET
  CALL func_3
func_3:
  ADD r0, r15, r4
  OR r14, r15, r12
  AND r11, r0, r3
  RET
  HALT
