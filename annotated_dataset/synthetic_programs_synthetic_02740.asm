; DESCRIPTION: This GeOS assembly code initializes registers, calls three subroutines (`func_0`, `func_1`, and `func_2`), performs a series of arithmetic and logical operations within each subroutine, and ultimately halts execution.

; subroutine calls
; initialization
  LDI r13, 64
  LDI r4, 2223
  CALL func_0
func_0:
  ADD r12, r14, r10
  OR r8, r10, r4
  RET
  CALL func_1
func_1:
  ADD r6, r1, r7
  AND r15, r12, r2
  OR r8, r12, r9
  AND r15, r10, r8
  AND r12, r11, r9
  MOD r7, r0, r1
  RET
  CALL func_2
func_2:
  OR r9, r12, r14
  XOR r1, r13, r15
  MUL r6, r11, r28
  MOD r13, r24, r6
  AND r13, r5, r10
  RET
  HALT
