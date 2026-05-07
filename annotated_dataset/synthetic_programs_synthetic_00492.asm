; DESCRIPTION: This GeOS assembly code initializes registers `r11` and `r27`, calls a subroutine `func_0`, which performs a left shift operation on `r3` by the value in `r11`, multiplies `r15` by `r0`, subtracts `r5` from the result of the multiplication, stores it back in `r0`, and then returns. The program halts after returning from the subroutine.

; subroutine calls
; initialization
  LDI r11, 0x98A766
  LDI r27, 0
  CALL func_0
func_0:
  SHL r2, r3, r11
  MUL r7, r15, r0
  SUB r0, r2, r5
  RET
  HALT
