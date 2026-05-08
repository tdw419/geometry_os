; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine `func_0`. Within the subroutine, it performs a right shift operation on register `r17` using `r13` and `r23`, followed by a subtraction of `r2` from `r0` and storing the result in `r5`. The subroutine then returns to the caller.

; subroutine calls
; initialization
  LDI r12, 1273
  LDI r5, 0x870F8A
  LDI r1, 2
  LDI r4, 1
  LDI r14, 0x57637A
  LDI r6, 0
  LDI r2, 4
  CALL func_0
func_0:
  SHR r17, r13, r23
  SUB r5, r0, r2
  RET
  HALT
