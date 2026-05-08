; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then calls two subroutines (`func_0` and `func_1`). The first subroutine performs bitwise operations such as shifting right, division, AND, and returns. The second subroutine executes additional bitwise operations including XOR, shift left/right, multiplication, and also returns. Finally, the program halts execution.

; subroutine calls
; initialization
  LDI r1, 256
  LDI r29, 364
  LDI r4, 3913
  LDI r11, 0xA8E49F
  LDI r0, 128
  CALL func_0
func_0:
  SHR r2, r9, r7
  DIV r12, r4, r13
  SHR r11, r10, r8
  AND r2, r5, r10
  RET
  CALL func_1
func_1:
  XOR r5, r11, r15
  SHR r0, r2, r13
  SHL r5, r1, r10
  SHR r12, r14, r1
  SHR r11, r8, r4
  MUL r2, r15, r12
  RET
  HALT
