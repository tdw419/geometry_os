; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and calls a subroutine (`func_0`). The subroutine performs arithmetic operations involving register manipulation, including subtraction and bitwise XOR, before returning.

; subroutine calls
; initialization
  LDI r11, 1050
  LDI r6, 64
  LDI r14, 0xC8E7BA
  LDI r4, 0
  LDI r9, 0xE2DD2F
  LDI r25, 4
  LDI r8, 1
  LDI r1, 256
  CALL func_0
func_0:
  SUB r1, r13, r2
  XOR r8, r9, r2
  SUB r4, r0, r15
  RET
  HALT
