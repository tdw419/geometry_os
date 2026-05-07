; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls a subroutine `func_0`. The subroutine performs bitwise shift right, modulo operation, and exclusive OR operations on the registers before returning.

; subroutine calls
; initialization
  LDI r9, 0xA13717
  LDI r15, 64
  LDI r11, 2685
  CALL func_0
func_0:
  SHR r11, r7, r15
  MOD r11, r13, r5
  XOR r0, r8, r6
  RET
  HALT
