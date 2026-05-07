; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls a subroutine (`func_0`). Within `func_0`, the code performs a series of bitwise operations including shifts (left and right), XOR, subtraction, AND, and returns to the caller.

; subroutine calls
; initialization
  LDI r10, 0x6B8AC1
  LDI r13, 0x25AAAD
  LDI r3, 1410
  CALL func_0
func_0:
  SHL r7, r0, r8
  XOR r8, r14, r3
  SHR r3, r11, r1
  SUB r5, r15, r13
  SHR r15, r10, r26
  AND r1, r2, r13
  RET
  HALT
