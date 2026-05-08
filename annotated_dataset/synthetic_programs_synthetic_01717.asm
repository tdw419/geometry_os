; DESCRIPTION: The GeOS assembly code initializes registers and performs a series of bitwise operations and modulo calculations. It calls two subroutines (`func_0` and `func_1`) that execute specific arithmetic operations on the registers, eventually halting the system.

; subroutine calls
; initialization
  LDI r4, 4
  LDI r9, 4049
  CALL func_0
func_0:
  OR r12, r6, r10
  MOD r0, r1, r7
  RET
  CALL func_1
func_1:
  MOD r12, r4, r7
  MOD r0, r13, r11
  MOD r10, r15, r5
  RET
  HALT
