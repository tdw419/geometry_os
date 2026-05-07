; DESCRIPTION: The GeOS assembly code initializes registers with specific values, performs bit shifting and arithmetic operations, stores and loads data from memory addresses, prints a string "HELLO" to the screen, and halts execution.

; mixed program
; initialization
  LDI r13, 747
  LDI r12, 10
  SHR r0, r9, r4
  SHR r7, r4, r14
  SHR r7, r10, r15
  SAR r6, r0, r2
  LDI r0, 3205
  LDI r4, 32
  LDI r10, 16
  TEXT r0, r4, r10, "HELLO"
  LDI r14, 228
  STORE r14, r6
  LOAD r2, r14
  LDI r9, 10
  STORE r9, r0
  LOAD r11, r9
  LDI r1, 2
  STORE r1, r8
  LOAD r6, r1
  LDI r10, 1
  STORE r10, r0
  LOAD r4, r10
  HALT
