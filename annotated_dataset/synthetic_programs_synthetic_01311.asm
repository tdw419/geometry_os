; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls a subroutine (`func_0`). Within `func_0`, it performs arithmetic operations including multiplication, XOR, division, subtraction, and returns to the caller. The code ends with a halt instruction.

; subroutine calls
; initialization
  LDI r3, 1272
  LDI r7, 1
  LDI r8, 264
  LDI r14, 0x3AAB09
  LDI r11, 0x7C2967
  LDI r4, 2917
  LDI r2, 1
  LDI r15, 874
  CALL func_0
func_0:
  MUL r2, r10, r4
  XOR r5, r3, r10
  DIV r7, r15, r8
  XOR r0, r12, r14
  SUB r11, r5, r8
  RET
  HALT
