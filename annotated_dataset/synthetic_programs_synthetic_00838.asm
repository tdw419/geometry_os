; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls a series of subroutines (`func_0`, `func_1`, `func_2`, `func_3`) that perform arithmetic operations such as division, multiplication, subtraction, bitwise logic (OR, XOR), shifts (SHL, SHR), and modulus. The final operation is a halt instruction.

; subroutine calls
; initialization
  LDI r5, 2514
  LDI r15, 255
  LDI r0, 0x83D61F
  LDI r3, 0x4D2499
  LDI r4, 255
  LDI r6, 0x3D6826
  CALL func_0
func_0:
  DIV r7, r11, r2
  OR r9, r8, r13
  SHL r1, r6, r2
  XOR r4, r0, r8
  OR r10, r0, r12
  RET
  CALL func_1
func_1:
  MUL r4, r6, r10
  OR r12, r13, r6
  SUB r3, r13, r15
  SHR r13, r7, r15
  RET
  CALL func_2
func_2:
  SHR r5, r7, r4
  MOD r12, r11, r15
  MUL r2, r4, r11
  RET
  CALL func_3
func_3:
  MUL r1, r7, r15
  OR r8, r11, r5
  MUL r1, r12, r9
  MOD r21, r1, r9
  RET
  HALT
