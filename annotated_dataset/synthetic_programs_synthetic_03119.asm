; DESCRIPTION: This GeOS assembly code initializes registers and calls a subroutine (`func_0`), which performs modulo and shift operations on specific registers. The program then halts execution.

; subroutine calls
; initialization
  LDI r6, 128
  LDI r15, 0x921F77
  LDI r5, 10
  CALL func_0
func_0:
  MOD r14, r7, r5
  SHR r2, r8, r10
  SHR r3, r5, r0
  RET
  HALT
