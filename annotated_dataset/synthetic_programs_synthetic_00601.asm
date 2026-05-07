; DESCRIPTION: This GeOS assembly code initializes registers and calls a series of subroutines (func_0, func_1, func_2, func_3) that perform bitwise operations (SHR, SHL, AND, OR, XOR), arithmetic operations (ADD, SUB, MUL, DIV), and halt the program execution.

; subroutine calls
; initialization
  LDI r6, 32
  LDI r17, 0x21EAC4
  CALL func_0
func_0:
  SHR r11, r9, r17
  ADD r20, r7, r1
  SHL r6, r3, r12
  DIV r0, r4, r27
  RET
  CALL func_1
func_1:
  AND r9, r10, r7
  SUB r7, r13, r1
  RET
  CALL func_2
func_2:
  MUL r5, r10, r15
  SHL r9, r12, r21
  MUL r0, r9, r30
  AND r3, r7, r4
  RET
  CALL func_3
func_3:
  SHL r2, r15, r9
  AND r30, r4, r14
  XOR r9, r5, r15
  SUB r3, r8, r1
  OR r7, r14, r12
  RET
  HALT
