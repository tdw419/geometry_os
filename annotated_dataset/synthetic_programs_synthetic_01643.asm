; DESCRIPTION: The GeOS assembly code initializes several registers and enters a counted loop structure. It performs division and subtraction operations to decrement counters, shifts bits, compares values, and finally halts execution.

; counted animation
; initialization
  LDI r1, 0x34B6B2
  LDI r7, 0x7018BF
  LDI r8, 255
  LDI r2, 1
  LDI r9, 255
loop_0:
  DIV r0, r8, r5
  LDI r26, 1
  SUB r9, r9, r26
  JNZ r9, loop_0
  LDI r13, 19
loop_1:
  SHL r9, r6, r4
  CMPI r2, r14, 175
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_1
  HALT
