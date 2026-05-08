; DESCRIPTION: This GeOS assembly code initializes registers, performs arithmetic operations including multiplication and division, shifts data, stores and loads values to/from memory, and includes a conditional halt based on a comparison. It manipulates register contents and interacts with memory for data processing tasks.

; mixed program
; initialization
  LDI r2, 2050
  LDI r8, 128
  PUSH r6
  PUSH r13
  PUSH r12
  PUSH r13
  MUL r11, r3, r1
  SHR r9, r14, r13
  POP r13
  POP r12
  POP r13
  POP r6
  LDI r9, 16
  STORE r9, r6
  LOAD r5, r9
  LDI r10, 8
  STORE r10, r9
  LOAD r14, r10
  PUSH r5
  DIV r3, r10, r2
  MUL r11, r13, r12
  SHL r1, r6, r7
  POP r5
  CMP r8, r4
  HALT
