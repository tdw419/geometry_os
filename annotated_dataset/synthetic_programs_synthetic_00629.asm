; DESCRIPTION: This GeOS assembly code initializes registers `r11` and `r7`, then calls the subroutine `func_0`. Inside `func_0`, it performs subtraction and shift operations on various registers before returning. The program halts after executing these operations.

; subroutine calls
; initialization
  LDI r11, 650
  LDI r7, 0xA1DDC9
  CALL func_0
func_0:
  SUB r6, r23, r9
  SHR r13, r4, r1
  SUB r8, r11, r9
  RET
  HALT
