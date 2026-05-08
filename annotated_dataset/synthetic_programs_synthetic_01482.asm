; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls two functions, `func_0` and `func_1`. `func_0` performs multiplication, bitwise OR, division, and shift operations, while `func_1` executes modulo, XOR, and subtraction. The program halts after executing these operations.

; subroutine calls
; initialization
  LDI r1, 2425
  LDI r8, 2668
  LDI r13, 1434
  LDI r7, 409
  LDI r9, 1823
  LDI r12, 3425
  CALL func_0
func_0:
  MUL r11, r7, r4
  OR r11, r0, r12
  DIV r12, r5, r13
  OR r6, r21, r7
  SHR r6, r8, r12
  RET
  CALL func_1
func_1:
  MOD r14, r7, r6
  XOR r8, r6, r12
  SUB r13, r4, r2
  RET
  HALT
