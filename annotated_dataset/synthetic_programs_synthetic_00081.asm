; DESCRIPTION: This GeOS assembly code initializes registers with specific values and then calls three subroutines (`func_0`, `func_1`, `func_2`) which perform arithmetic operations such as division, subtraction, AND, OR, XOR, multiplication, modulo, addition, and shift left. The final subroutine call is followed by a HALT instruction.

; subroutine calls
; initialization
  LDI r7, 0x1C57B1
  LDI r6, 148
  LDI r1, 2
  LDI r13, 1
  LDI r11, 0
  LDI r2, 256
  LDI r16, 0
  LDI r4, 10
  CALL func_0
func_0:
  DIV r20, r15, r2
  SUB r6, r11, r7
  AND r11, r9, r7
  OR r10, r3, r13
  XOR r2, r4, r7
  MOD r6, r4, r7
  RET
  CALL func_1
func_1:
  AND r16, r1, r12
  MOD r2, r12, r1
  DIV r5, r1, r11
  ADD r10, r8, r6
  ADD r13, r1, r12
  RET
  CALL func_2
func_2:
  OR r8, r12, r7
  MUL r8, r7, r9
  SHL r1, r11, r8
  XOR r9, r10, r5
  RET
  HALT
