; DESCRIPTION: The GeOS assembly code initializes registers with specific values and calls a subroutine `func_0`. Within the subroutine, it multiplies `r9` by `r3`, performs a bitwise AND between `r10` and `r13`, shifts `r10` left by `r19`, and then returns. The program halts after the subroutine call.

; subroutine calls
; initialization
  LDI r10, 0
  LDI r3, 0x737E6D
  LDI r5, 128
  LDI r0, 0x466EBF
  CALL func_0
func_0:
  MUL r6, r9, r3
  AND r9, r10, r13
  SHL r13, r10, r19
  RET
  HALT
