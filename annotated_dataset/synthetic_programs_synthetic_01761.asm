; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations such as addition, subtraction, multiplication, division, modulo, bit shifting, and bitwise operations. The final function halts the system.

; subroutine calls
; initialization
  LDI r2, 1618
  LDI r1, 266
  LDI r11, 0x4B5CB1
  LDI r13, 1101
  LDI r8, 64
  LDI r10, 64
  LDI r12, 2
  CALL func_0
func_0:
  MOD r14, r7, r10
  ADD r9, r15, r12
  SHR r12, r7, r6
  DIV r2, r5, r11
  SUB r21, r10, r6
  SHR r31, r6, r10
  RET
  CALL func_1
func_1:
  SHL r9, r14, r19
  DIV r10, r4, r20
  XOR r13, r1, r5
  AND r0, r12, r6
  AND r3, r2, r0
  RET
  CALL func_2
func_2:
  MUL r28, r12, r5
  XOR r1, r4, r7
  RET
  CALL func_3
func_3:
  MUL r7, r3, r5
  DIV r11, r0, r3
  OR r11, r7, r14
  SHL r7, r9, r8
  XOR r0, r11, r10
  SUB r3, r13, r4
  RET
  HALT
