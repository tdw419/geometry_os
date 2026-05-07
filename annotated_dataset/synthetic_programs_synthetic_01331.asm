; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a series of subroutines (`func_0`, `func_1`, `func_2`) that perform bitwise operations (AND, XOR), arithmetic operations (ADD, SUB, SHL, SHR, DIV), and register manipulations. The HALT instruction at the end stops execution.

; subroutine calls
; initialization
  LDI r2, 0xCD242F
  LDI r3, 128
  LDI r10, 3821
  LDI r4, 4
  LDI r29, 4
  LDI r12, 3693
  LDI r8, 0x81163C
  CALL func_0
func_0:
  AND r2, r8, r11
  XOR r1, r11, r8
  SUB r23, r12, r11
  SUB r2, r12, r14
  SHL r12, r2, r8
  DIV r9, r15, r10
  RET
  CALL func_1
func_1:
  SUB r4, r2, r5
  SHR r3, r14, r1
  SUB r8, r0, r10
  RET
  CALL func_2
func_2:
  ADD r9, r0, r2
  SHL r5, r12, r8
  RET
  HALT
