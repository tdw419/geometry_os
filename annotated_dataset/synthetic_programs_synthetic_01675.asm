; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a subroutine `func_0`. Within the subroutine, it performs bitwise operations including XOR, OR, MOD, and SHR on the registers, then returns to the caller. The code ends with a HALT instruction.

; subroutine calls
; initialization
  LDI r15, 10
  LDI r1, 0x40DACA
  LDI r6, 2180
  LDI r13, 255
  LDI r2, 0x9354F4
  LDI r0, 10
  CALL func_0
func_0:
  XOR r13, r10, r5
  OR r16, r7, r13
  MOD r5, r12, r13
  SHR r11, r2, r9
  RET
  HALT
