; DESCRIPTION: This GeOS assembly code initializes registers with specific values, then sequentially calls four functions (`func_0`, `func_1`, `func_2`, and `func_3`). Each function performs a series of arithmetic operations such as XOR, ADD, SUB, MUL, DIV, SHL (shift left), SHR (shift right), AND, OR, MOD, and returns control to the caller. The final operation is a HALT instruction, which stops execution.

; subroutine calls
; initialization
  LDI r5, 743
  LDI r4, 0x0ED108
  CALL func_0
func_0:
  XOR r13, r5, r21
  XOR r3, r9, r1
  SUB r5, r6, r1
  RET
  CALL func_1
func_1:
  MOD r6, r9, r14
  MUL r13, r3, r4
  SHL r11, r4, r22
  OR r10, r8, r14
  DIV r10, r0, r1
  RET
  CALL func_2
func_2:
  AND r11, r12, r10
  MUL r9, r3, r10
  DIV r8, r9, r10
  SHR r20, r26, r16
  RET
  CALL func_3
func_3:
  ADD r28, r10, r3
  SHL r11, r10, r3
  SHR r9, r0, r5
  OR r0, r6, r18
  SHR r4, r3, r26
  SUB r3, r12, r24
  RET
  HALT
