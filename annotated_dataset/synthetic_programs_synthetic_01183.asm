; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls four subroutines (`func_0`, `func_1`, `func_2`, `func_3`) in sequence. Each subroutine performs a series of arithmetic and bitwise operations on the registers, including OR, SUB, MOD, ADD, SHR, SHL, XOR, and DIV instructions. The code halts after executing all subroutines.

; subroutine calls
; initialization
  LDI r10, 64
  LDI r14, 0xDE43DF
  LDI r9, 32
  LDI r5, 53
  LDI r2, 0x0BF784
  LDI r12, 1
  CALL func_0
func_0:
  OR r1, r15, r13
  SUB r12, r0, r15
  MOD r11, r1, r6
  ADD r1, r5, r8
  SUB r14, r5, r0
  SHR r11, r2, r14
  RET
  CALL func_1
func_1:
  SHL r8, r25, r10
  ADD r7, r12, r14
  MOD r8, r4, r6
  ADD r11, r13, r14
  RET
  CALL func_2
func_2:
  OR r2, r6, r0
  DIV r4, r13, r21
  OR r4, r12, r7
  MOD r11, r5, r6
  RET
  CALL func_3
func_3:
  XOR r13, r4, r1
  MOD r5, r7, r13
  SHR r3, r2, r0
  MOD r9, r5, r11
  DIV r11, r0, r9
  ADD r12, r2, r11
  RET
  HALT
