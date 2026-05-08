; DESCRIPTION: The GeOS assembly code initializes registers with specific values and then calls a subroutine (`func_0`). The subroutine performs bitwise shift, addition, and multiplication operations on the registers before returning.

; subroutine calls
; initialization
  LDI r7, 0x0D7D03
  LDI r3, 10
  CALL func_0
func_0:
  SHL r10, r1, r12
  ADD r3, r11, r15
  MUL r6, r13, r5
  RET
  HALT
