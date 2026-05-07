; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a subroutine `func_0` which performs addition and shift operations, then calls another subroutine `func_1` that includes modulo, shift, division, logical OR operations, and finally halts the system.

; subroutine calls
; initialization
  LDI r0, 856
  LDI r12, 81
  LDI r10, 128
  LDI r7, 1094
  LDI r13, 106
  LDI r2, 1818
  LDI r9, 510
  CALL func_0
func_0:
  ADD r2, r6, r1
  SHR r0, r12, r3
  RET
  CALL func_1
func_1:
  MOD r13, r6, r1
  SHR r14, r15, r10
  DIV r12, r15, r14
  DIV r9, r4, r0
  OR r6, r4, r11
  RET
  HALT
