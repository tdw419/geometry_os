; DESCRIPTION: The GeOS assembly code initializes several registers and calls a subroutine named `func_0`. Inside `func_0`, it performs bitwise AND between registers `r8` and `r9`, shifts the value in register `r15` left by the amount specified in `r6`, adds `r6` to `r11`, and then returns from the subroutine. The program halts afterward.

; subroutine calls
; initialization
  LDI r7, 256
  LDI r6, 2
  LDI r13, 506
  LDI r15, 4
  CALL func_0
func_0:
  AND r8, r11, r9
  SHL r3, r15, r6
  ADD r8, r11, r6
  RET
  HALT
