; DESCRIPTION: The GeOS assembly code initializes registers `r5` and `r13`, then calls a subroutine named `func_0`. Within `func_0`, it performs multiplication, bitwise OR, right shift, and division operations on various registers before returning to the caller.

; subroutine calls
; initialization
  LDI r5, 1
  LDI r13, 0
  CALL func_0
func_0:
  MUL r15, r1, r2
  OR r8, r14, r11
  SHR r1, r2, r8
  DIV r12, r9, r7
  RET
  HALT
