; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then sequentially calls four functions (`func_0` through `func_3`). Each function performs arithmetic operations such as multiplication, addition, modulo, XOR, OR, and shift right on the registers. After all functions are executed, the system halts.

; subroutine calls
; initialization
  LDI r5, 255
  LDI r3, 1936
  LDI r17, 128
  LDI r14, 256
  LDI r6, 806
  LDI r0, 0xF5A02C
  LDI r10, 3573
  LDI r30, 1
  CALL func_0
func_0:
  MUL r5, r29, r14
  MOD r7, r6, r1
  XOR r5, r6, r7
  RET
  CALL func_1
func_1:
  MUL r9, r4, r7
  OR r7, r9, r12
  ADD r10, r6, r11
  RET
  CALL func_2
func_2:
  MOD r11, r1, r31
  DIV r9, r23, r0
  DIV r7, r4, r10
  RET
  CALL func_3
func_3:
  OR r15, r14, r4
  XOR r22, r4, r8
  OR r7, r12, r10
  MUL r14, r4, r5
  SHR r13, r17, r3
  MOD r0, r13, r4
  RET
  HALT
