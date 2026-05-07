; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a subroutine (`func_0`). The subroutine multiplies the values in registers `r3` and `r5`, shifts the value in register `r10` left by the amount specified in `r9`, and returns.

; subroutine calls
; initialization
  LDI r3, 1165
  LDI r9, 16
  LDI r5, 0x0C2E98
  LDI r11, 8
  LDI r2, 677
  LDI r10, 2927
  CALL func_0
func_0:
  MUL r1, r3, r5
  SHL r24, r10, r9
  RET
  HALT
