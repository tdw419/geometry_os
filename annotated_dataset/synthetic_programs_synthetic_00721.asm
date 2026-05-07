; DESCRIPTION: The GeOS assembly code initializes registers with specific values and sequentially calls four subroutines (`func_0`, `func_1`, `func_2`, `func_3`). Each subroutine performs a series of bitwise operations (SHR, OR, AND, XOR, SHL), arithmetic operations (DIV, SUB, MUL, ADD, MOD), and returns control to the next subroutine until all are executed. Finally, the system halts.

; subroutine calls
; initialization
  LDI r5, 0x02AD34
  LDI r10, 1397
  CALL func_0
func_0:
  SHR r10, r1, r4
  OR r6, r11, r7
  SHR r2, r10, r8
  RET
  CALL func_1
func_1:
  DIV r11, r3, r9
  SUB r1, r8, r14
  SUB r7, r3, r2
  MUL r15, r10, r12
  AND r5, r8, r9
  RET
  CALL func_2
func_2:
  XOR r14, r12, r10
  AND r7, r13, r4
  SHL r8, r2, r7
  OR r5, r6, r3
  MOD r1, r11, r5
  RET
  CALL func_3
func_3:
  MOD r2, r15, r7
  ADD r8, r5, r4
  SUB r1, r13, r0
  SUB r4, r14, r12
  MOD r5, r7, r11
  SHR r17, r4, r9
  RET
  HALT
