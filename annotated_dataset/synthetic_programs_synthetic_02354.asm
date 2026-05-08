; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls a series of subroutines (func_0, func_1, func_2, func_3) that perform arithmetic operations such as addition, subtraction, multiplication, division, shifting, modular arithmetic, bitwise OR, and XOR. The execution halts after all subroutine calls are completed.

; subroutine calls
; initialization
  LDI r3, 2379
  LDI r4, 2606
  CALL func_0
func_0:
  SUB r0, r4, r2
  ADD r15, r0, r3
  SUB r0, r11, r7
  RET
  CALL func_1
func_1:
  SHL r8, r4, r7
  DIV r5, r30, r6
  DIV r12, r4, r9
  RET
  CALL func_2
func_2:
  DIV r3, r4, r15
  SUB r15, r11, r6
  DIV r14, r4, r11
  MUL r3, r10, r15
  DIV r4, r2, r7
  RET
  CALL func_3
func_3:
  SHL r9, r13, r6
  MOD r3, r14, r10
  MOD r6, r8, r3
  OR r4, r6, r24
  XOR r9, r8, r15
  SUB r6, r15, r11
  RET
  HALT
