; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two subroutines (`func_0` and `func_1`). Each subroutine performs a series of bitwise operations (AND, XOR, OR), arithmetic operations (ADD, SUB, MUL, DIV), and shifts (SHR) on the register values. The code terminates with a HALT instruction after executing both subroutines.

; subroutine calls
; initialization
  LDI r10, 0x3B2CA5
  LDI r9, 8
  LDI r3, 0xFBFDD6
  LDI r14, 0x5ED688
  LDI r22, 2264
  LDI r12, 559
  LDI r15, 538
  LDI r8, 0x2F34C3
  CALL func_0
func_0:
  AND r11, r13, r15
  XOR r1, r12, r7
  SHR r11, r4, r15
  DIV r11, r4, r13
  OR r4, r13, r6
  RET
  CALL func_1
func_1:
  AND r10, r2, r9
  XOR r6, r5, r12
  SHR r14, r8, r11
  SUB r12, r14, r1
  MUL r11, r1, r4
  SUB r11, r9, r0
  RET
  HALT
