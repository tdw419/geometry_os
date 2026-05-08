; DESCRIPTION: The GeOS assembly code initializes several registers and calls four subroutines (`func_0`, `func_1`, `func_2`, `func_3`) in sequence. Each subroutine performs a series of arithmetic operations (XOR, SUB, MOD, OR, AND, ADD, DIV, SHR) on the registers, with no apparent external input or output dependencies, and ultimately halts execution.

; subroutine calls
; initialization
  LDI r10, 256
  LDI r15, 1958
  LDI r8, 2548
  LDI r13, 16
  CALL func_0
func_0:
  XOR r27, r1, r0
  SUB r7, r12, r5
  MOD r2, r11, r8
  RET
  CALL func_1
func_1:
  OR r8, r9, r14
  AND r7, r4, r2
  RET
  CALL func_2
func_2:
  SUB r6, r8, r7
  SUB r1, r3, r13
  ADD r21, r3, r6
  MOD r15, r3, r13
  SHR r7, r1, r0
  RET
  CALL func_3
func_3:
  MOD r6, r8, r1
  DIV r4, r15, r1
  AND r5, r3, r12
  XOR r1, r15, r3
  RET
  HALT
