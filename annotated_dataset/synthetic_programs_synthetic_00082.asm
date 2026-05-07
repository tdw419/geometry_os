; DESCRIPTION: The GeOS assembly code defines a sequence of function calls and operations involving bitwise logic, arithmetic operations (such as multiplication, addition, subtraction), and shifts. It initializes registers with specific values, performs calculations in each function, and eventually halts execution.

; subroutine calls
; initialization
  LDI r14, 0xB7AAA0
  LDI r6, 651
  CALL func_0
func_0:
  OR r2, r8, r15
  MUL r5, r1, r14
  XOR r7, r8, r16
  SHL r1, r11, r14
  SUB r7, r11, r13
  SUB r9, r10, r11
  RET
  CALL func_1
func_1:
  SHR r11, r9, r5
  SHL r4, r0, r6
  SHL r11, r12, r1
  MUL r2, r23, r13
  RET
  CALL func_2
func_2:
  SUB r1, r14, r6
  XOR r7, r11, r10
  SUB r14, r13, r11
  OR r11, r7, r13
  DIV r4, r7, r13
  XOR r8, r10, r2
  RET
  HALT
