; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then calls a subroutine (`func_0`). Within the subroutine, it performs arithmetic operations including XOR, MUL, OR, DIV, and finally returns. The HALT instruction is called after the subroutine execution to stop the program.

; subroutine calls
; initialization
  LDI r13, 0x592A5C
  LDI r14, 0x926E81
  LDI r4, 4084
  LDI r0, 1
  LDI r19, 702
  LDI r10, 3306
  LDI r6, 64
  LDI r11, 32
  CALL func_0
func_0:
  XOR r15, r9, r12
  MUL r10, r9, r22
  OR r1, r12, r9
  DIV r15, r12, r3
  OR r12, r13, r6
  RET
  HALT
