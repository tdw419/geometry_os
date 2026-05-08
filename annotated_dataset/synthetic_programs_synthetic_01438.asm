; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`). Each function performs a series of arithmetic operations including modulo, shift, add, subtract, XOR, and OR. The final function call is followed by a halt instruction.

; subroutine calls
; initialization
  LDI r14, 2
  LDI r0, 0x2E8FB7
  LDI r6, 0xDB2E91
  LDI r3, 256
  LDI r2, 10
  LDI r13, 0x5EC407
  LDI r11, 3991
  CALL func_0
func_0:
  MOD r12, r14, r5
  SHR r7, r0, r3
  SHR r13, r14, r12
  OR r11, r3, r5
  AND r3, r1, r0
  RET
  CALL func_1
func_1:
  ADD r7, r25, r1
  SHR r3, r1, r6
  SUB r7, r6, r12
  XOR r15, r10, r13
  RET
  CALL func_2
func_2:
  SHL r6, r4, r11
  XOR r11, r0, r14
  OR r2, r5, r9
  RET
  CALL func_3
func_3:
  ADD r6, r19, r3
  SHL r11, r14, r9
  MOD r0, r19, r7
  OR r3, r21, r5
  RET
  HALT
