; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a subroutine `func_0`. In `func_0`, it performs a subtraction of `r15` and `r1` into `r0`, followed by an AND operation between `r3` and `r8` into `r1`, then returns. The program halts afterward.

; subroutine calls
; initialization
  LDI r26, 0x2A5CDE
  LDI r1, 3910
  LDI r0, 4080
  LDI r2, 4039
  LDI r14, 1222
  LDI r7, 255
  LDI r12, 0x81B549
  CALL func_0
func_0:
  SUB r0, r15, r1
  AND r1, r3, r8
  RET
  HALT
