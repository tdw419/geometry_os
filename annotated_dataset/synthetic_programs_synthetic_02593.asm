; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a subroutine named `func_0`, which multiplies the contents of registers `r9` and `r11` storing the result in `r12`, divides the contents of `r14` by `r0` storing the result in `r13`, returns from the subroutine, and then halts execution.

; subroutine calls
; initialization
  LDI r8, 64
  LDI r11, 369
  LDI r10, 64
  LDI r7, 10
  CALL func_0
func_0:
  MUL r12, r9, r11
  DIV r13, r14, r0
  RET
  HALT
