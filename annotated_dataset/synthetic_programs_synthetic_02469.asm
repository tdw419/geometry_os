; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations, including multiplication, division, AND, XOR, and MOD, across different functions (`func_0` and `func_1`). The operations involve both logical and mathematical computations on the register contents.

; subroutine calls
; initialization
  LDI r6, 0xB28230
  LDI r5, 8
  LDI r8, 0xB9BC3F
  LDI r0, 0x9B5DD5
  LDI r11, 0x280502
  LDI r2, 1732
  CALL func_0
func_0:
  MUL r13, r9, r0
  AND r11, r12, r3
  XOR r13, r2, r1
  MOD r11, r0, r8
  RET
  CALL func_1
func_1:
  DIV r9, r5, r6
  XOR r12, r2, r11
  MOD r13, r2, r3
  DIV r5, r10, r15
  RET
  HALT
