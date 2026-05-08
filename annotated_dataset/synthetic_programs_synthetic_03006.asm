; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of memory operations including storing and loading data. It also executes bitwise operations such as shift, OR, AND, and XOR before halting the program.

; mixed program
; initialization
  LDI r15, 8
  LDI r20, 64
  LDI r7, 0xF29D0E
  LDI r1, 2
  LDI r0, 2889
  LDI r14, 4
  STORE r14, r8
  LOAD r4, r14
  LDI r15, 1300
  STORE r15, r9
  LOAD r10, r15
  LDI r12, 3422
  STORE r12, r10
  LOAD r3, r12
  SHL r5, r23, r12
  OR r10, r0, r26
  AND r13, r12, r0
  XOR r6, r7, r14
  HALT
