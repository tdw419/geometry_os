; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a subroutine named `func_0`. Inside `func_0`, it performs division, multiplication, and bitwise operations on the registers before returning to the main program.

; subroutine calls
; initialization
  LDI r8, 2195
  LDI r24, 10
  LDI r14, 0x72CB10
  LDI r1, 0x1EDB03
  CALL func_0
func_0:
  DIV r8, r15, r20
  MUL r15, r13, r14
  MUL r24, r10, r13
  AND r5, r10, r13
  RET
  HALT
