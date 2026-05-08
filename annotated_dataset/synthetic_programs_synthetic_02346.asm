; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four subroutines (`func_0`, `func_1`, `func_2`, `func_3`). Each subroutine performs a series of arithmetic operations, including shift, bitwise AND, division, addition, XOR, multiplication, and subtraction. The final result is not returned or stored explicitly, but the operations may modify registers for further use.

; subroutine calls
; initialization
  LDI r14, 128
  LDI r15, 271
  LDI r12, 281
  LDI r10, 256
  LDI r13, 64
  CALL func_0
func_0:
  SHL r2, r15, r12
  SHR r5, r25, r12
  SHL r14, r3, r8
  RET
  CALL func_1
func_1:
  AND r0, r1, r8
  DIV r13, r0, r10
  RET
  CALL func_2
func_2:
  ADD r3, r13, r14
  XOR r4, r10, r3
  MUL r10, r12, r11
  ADD r11, r4, r3
  XOR r5, r12, r15
  RET
  CALL func_3
func_3:
  AND r24, r7, r5
  SUB r2, r1, r9
  SUB r12, r1, r7
  RET
  HALT
