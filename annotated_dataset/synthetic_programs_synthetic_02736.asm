; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a subroutine (`func_0`), performs bitwise shift, division, and addition operations within the subroutine, and then halts execution. The subroutine manipulates registers to compute a result based on the input parameters.

; subroutine calls
; initialization
  LDI r8, 0x7FF3F1
  LDI r2, 1
  LDI r6, 255
  LDI r7, 0xCB8710
  LDI r10, 8
  CALL func_0
func_0:
  SHL r9, r14, r10
  DIV r0, r6, r5
  ADD r2, r15, r8
  RET
  HALT
