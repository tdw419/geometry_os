; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls the subroutine `func_0`. In `func_0`, it shifts the value in register `r2` left by 32 bits (stored in `r4`) into `r13`, performs a bitwise AND operation between `r13` and `r7` into `r8`, and returns from the subroutine. The program then halts execution.

; subroutine calls
; initialization
  LDI r13, 0
  LDI r5, 0x537CA4
  LDI r15, 0
  LDI r8, 0x6BA0DE
  LDI r3, 0
  LDI r4, 32
  LDI r12, 1147
  CALL func_0
func_0:
  SHL r13, r2, r4
  AND r8, r13, r7
  RET
  HALT
