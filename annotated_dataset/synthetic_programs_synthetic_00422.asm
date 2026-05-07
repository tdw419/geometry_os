; DESCRIPTION: The GeOS assembly code initializes registers `r10` and `r6`, then calls subroutine `func_0`. Inside `func_0`, it multiplies registers `r3` and `r14`, performs a bitwise OR with `r22`, divides `r1` by `r0`, returns to the caller, and halts the system.

; subroutine calls
; initialization
  LDI r10, 3225
  LDI r6, 8
  CALL func_0
func_0:
  MUL r9, r3, r14
  OR r13, r22, r9
  DIV r8, r1, r0
  RET
  HALT
