; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a subroutine `func_0`. Within `func_0`, it performs division of `r2` by `r26`, bitwise OR between `r0` and `r11`, and subtraction of `r13` from `r23`, then returns control to the caller. The program halts after execution.

; subroutine calls
; initialization
  LDI r4, 2
  LDI r10, 928
  LDI r0, 12
  LDI r7, 651
  LDI r11, 8
  LDI r5, 32
  LDI r12, 1154
  CALL func_0
func_0:
  DIV r15, r2, r26
  OR r15, r0, r11
  SUB r9, r23, r13
  RET
  HALT
