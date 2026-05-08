; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four subroutines (func_0, func_1, func_2, func_3). Each subroutine performs arithmetic operations such as multiplication, division, modulus, addition, subtraction, bitwise AND, XOR, and left shift on the register values. The final operation is a HALT instruction.

; subroutine calls
; initialization
  LDI r2, 3066
  LDI r14, 1445
  LDI r10, 685
  LDI r1, 0x54751E
  LDI r0, 0x7CF34E
  CALL func_0
func_0:
  MOD r7, r6, r8
  MUL r5, r1, r3
  MUL r8, r2, r11
  MOD r5, r24, r3
  MUL r10, r8, r7
  RET
  CALL func_1
func_1:
  SUB r1, r7, r12
  MOD r14, r2, r10
  ADD r14, r8, r13
  ADD r5, r8, r1
  AND r15, r14, r10
  XOR r0, r28, r10
  RET
  CALL func_2
func_2:
  DIV r13, r7, r9
  DIV r0, r11, r5
  XOR r10, r9, r15
  RET
  CALL func_3
func_3:
  SHL r2, r5, r14
  XOR r3, r7, r10
  RET
  HALT
