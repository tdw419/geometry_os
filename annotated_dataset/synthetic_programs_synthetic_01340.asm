; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a subroutine `func_0` that performs arithmetic operations including addition, subtraction, multiplication, division, and bitwise operations, then calls another subroutine `func_1` which includes modulus, subtraction, bitwise OR, and AND operations before halting the system.

; subroutine calls
; initialization
  LDI r7, 417
  LDI r5, 867
  LDI r2, 1534
  LDI r10, 10
  LDI r12, 10
  LDI r4, 1
  LDI r13, 1323
  LDI r25, 0x345B97
  CALL func_0
func_0:
  ADD r8, r1, r5
  OR r0, r8, r5
  SUB r24, r15, r7
  DIV r7, r4, r1
  SUB r2, r6, r28
  MUL r1, r6, r16
  RET
  CALL func_1
func_1:
  MOD r12, r0, r14
  SUB r3, r6, r5
  OR r14, r9, r31
  OR r1, r6, r20
  AND r1, r5, r8
  RET
  HALT
