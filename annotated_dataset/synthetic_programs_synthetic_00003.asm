; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`), each performing a series of arithmetic operations such as addition, multiplication, modulo, shift, bitwise AND/OR/XOR, and division. The code halts after executing all the function calls.

; subroutine calls
; initialization
  LDI r0, 848
  LDI r4, 0x36CD6B
  LDI r6, 255
  LDI r15, 0x1A0250
  LDI r13, 10
  LDI r8, 0xE23843
  CALL func_0
func_0:
  ADD r4, r11, r1
  MOD r1, r6, r3
  SHL r13, r20, r7
  MUL r21, r0, r10
  SHR r7, r3, r1
  AND r14, r7, r6
  RET
  CALL func_1
func_1:
  SHL r2, r24, r12
  OR r0, r8, r13
  SHL r10, r3, r6
  MOD r13, r6, r2
  SHL r3, r9, r13
  RET
  CALL func_2
func_2:
  SHR r4, r12, r5
  XOR r12, r0, r6
  SHR r10, r14, r15
  MUL r9, r10, r7
  RET
  CALL func_3
func_3:
  DIV r4, r7, r18
  AND r6, r12, r7
  MUL r0, r3, r7
  MUL r14, r7, r3
  RET
  HALT
