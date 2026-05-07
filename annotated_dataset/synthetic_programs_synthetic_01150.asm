; DESCRIPTION: This GeOS assembly code initializes registers with specific values and calls three functions (`func_0`, `func_1`, `func_2`) in sequence. Each function performs a series of arithmetic operations such as shifting, bitwise OR, XOR, multiplication, division, addition, and subtraction on the registers.

; subroutine calls
; initialization
  LDI r9, 2
  LDI r13, 1364
  LDI r2, 4
  LDI r14, 256
  LDI r1, 0x204825
  CALL func_0
func_0:
  SHL r10, r2, r8
  OR r11, r8, r6
  OR r13, r9, r8
  XOR r9, r12, r5
  SHL r11, r0, r6
  MUL r7, r13, r21
  RET
  CALL func_1
func_1:
  SUB r23, r1, r14
  XOR r20, r13, r8
  DIV r15, r14, r10
  ADD r11, r3, r5
  AND r9, r4, r0
  DIV r2, r11, r15
  RET
  CALL func_2
func_2:
  SUB r10, r2, r0
  SUB r10, r7, r0
  XOR r4, r12, r11
  MUL r8, r11, r3
  DIV r4, r3, r25
  RET
  HALT
