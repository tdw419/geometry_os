; DESCRIPTION: The GeOS assembly code initializes several registers with specific values, calls two functions (`func_0` and `func_1`), performs arithmetic operations such as division, bitwise OR, XOR, and shift left within these functions, and ultimately halts the system.

; subroutine calls
; initialization
  LDI r9, 128
  LDI r6, 32
  LDI r15, 0xCE7B88
  LDI r8, 37
  LDI r10, 0xD86B19
  LDI r1, 0xCB2DA0
  LDI r0, 4
  CALL func_0
func_0:
  DIV r10, r3, r8
  OR r5, r4, r3
  XOR r11, r18, r8
  RET
  CALL func_1
func_1:
  XOR r3, r7, r2
  SHL r2, r12, r0
  OR r5, r12, r9
  RET
  HALT
