; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sequentially calls four functions (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations such as multiplication, XOR, MOD, OR, SUB, SHR, SHL, and AND. The final operation is a HALT instruction.

; subroutine calls
; initialization
  LDI r4, 0xA02C36
  LDI r6, 0x033C71
  LDI r5, 530
  CALL func_0
func_0:
  MUL r14, r2, r9
  XOR r12, r9, r13
  MOD r8, r5, r3
  OR r2, r4, r7
  XOR r14, r6, r13
  SUB r12, r7, r2
  RET
  CALL func_1
func_1:
  SHR r14, r10, r9
  SHR r10, r15, r9
  RET
  CALL func_2
func_2:
  XOR r6, r14, r2
  MOD r12, r5, r10
  MOD r4, r0, r15
  OR r9, r12, r13
  MUL r25, r1, r14
  SHL r12, r9, r3
  RET
  CALL func_3
func_3:
  XOR r1, r12, r9
  MUL r24, r4, r12
  AND r11, r4, r2
  SUB r1, r9, r15
  RET
  HALT
