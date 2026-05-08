; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two subroutines, `func_0` and `func_1`. Each subroutine performs a series of arithmetic operations including subtraction, modulo, bitwise AND, shift right, shift left, XOR, OR, multiplication, and division on the registers. The execution halts after calling `func_1`.

; subroutine calls
; initialization
  LDI r0, 3510
  LDI r5, 16
  LDI r2, 3675
  LDI r9, 0x145539
  LDI r13, 512
  LDI r3, 1120
  LDI r30, 0x5041F8
  LDI r15, 1372
  CALL func_0
func_0:
  SUB r2, r19, r4
  MOD r14, r7, r0
  AND r9, r13, r27
  SHR r8, r2, r6
  SHL r0, r9, r14
  RET
  CALL func_1
func_1:
  XOR r11, r13, r15
  XOR r4, r0, r2
  OR r13, r7, r5
  MUL r9, r10, r20
  DIV r9, r10, r8
  DIV r10, r15, r0
  RET
  HALT
