; DESCRIPTION: This GeOS assembly code initializes registers `r11`, `r21`, and `r12` with specific values, then calls a subroutine named `func_0`. Inside `func_0`, it performs a subtraction between `r0` and `r5`, stores the result in `r7`, shifts the value of `r6` left by `r13` bits and stores the result in `r10`, returns from the subroutine, and halts execution.

; subroutine calls
; initialization
  LDI r11, 8
  LDI r21, 4058
  LDI r12, 2974
  CALL func_0
func_0:
  SUB r7, r0, r5
  SHL r10, r6, r13
  RET
  HALT
