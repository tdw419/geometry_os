; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and calls a function `func_0`. Inside `func_0`, it performs bitwise operations and arithmetic divisions. After returning from the function, the code enters a loop where it multiplies two registers and decrements another register until it reaches zero, then halts execution.

; mixed program
; initialization
  LDI r5, 0xE1C9B1
  LDI r2, 0
  LDI r7, 3586
  LDI r15, 128
  LDI r10, 64
  CALL func_0
func_0:
  OR r13, r3, r0
  DIV r12, r0, r13
  XOR r8, r2, r12
  DIV r0, r14, r11
  RET
  OR r12, r7, r10
  LDI r10, 48
loop_1:
  MUL r1, r0, r11
  LDI r9, 1
  SUB r10, r10, r9
  JNZ r10, loop_1
  HALT
