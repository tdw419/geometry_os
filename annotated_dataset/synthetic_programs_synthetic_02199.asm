; DESCRIPTION: This GeOS assembly code initializes registers, calls two subroutines (`func_0` and `func_1`), performs arithmetic and bitwise operations within these routines, and ultimately halts the system.

; subroutine calls
; initialization
  LDI r21, 259
  LDI r13, 1
  CALL func_0
func_0:
  MOD r11, r4, r1
  SHL r15, r14, r3
  RET
  CALL func_1
func_1:
  MOD r3, r0, r20
  SUB r0, r1, r15
  AND r11, r7, r15
  AND r4, r12, r8
  MOD r14, r8, r5
  SUB r3, r2, r1
  RET
  HALT
