; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then sequentially calls three subroutines (`func_0`, `func_1`, `func_2`). Each subroutine performs a series of bitwise operations (e.g., shift, XOR, OR, AND) and arithmetic operations (e.g., subtraction, modulo), manipulating the register values. Finally, the code halts execution.

; subroutine calls
; initialization
  LDI r9, 16
  LDI r5, 2
  LDI r12, 16
  LDI r4, 0xDB043B
  LDI r10, 134
  LDI r1, 255
  LDI r3, 646
  CALL func_0
func_0:
  SHR r0, r9, r14
  SUB r12, r15, r1
  SHR r1, r7, r14
  XOR r8, r9, r6
  OR r3, r12, r15
  RET
  CALL func_1
func_1:
  SUB r1, r15, r5
  SHR r13, r4, r7
  RET
  CALL func_2
func_2:
  SUB r0, r2, r11
  OR r15, r5, r4
  AND r2, r14, r12
  MOD r12, r3, r8
  SUB r5, r8, r2
  RET
  HALT
