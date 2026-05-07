; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations, conditional branching, and graphics drawing commands such as `PSET`, `CIRCLE`, and `RECTF`. The program also includes bitwise operations like `AND` and `XOR`, stores and loads data to/from memory, and finally halts execution.

; mixed program
; initialization
  LDI r7, 3826
  LDI r11, 2062
  LDI r10, 1616
  LDI r15, 0xC042D1
  LDI r13, 2693
  LDI r4, 505
  LDI r15, 8
  LDI r14, 0xDED089
  LDI r2, 0x8FB59B
  PSETI
  LDI r4, 0xD17D2F
  LDI r14, 0x5BB49B
  LDI r3, 3522
  PSET r4, r14, r3
  CMP r5, r7
  JZ r5, else_0
  ADD r9, r14, r4
  DIV r6, r1, r13
  AND r14, r1, r12
  JMP endif_1
else_0:
  LDI r12, 1179
  LDI r13, 1
  LDI r15, 2380
  PSETI
  LDI r10, 0xEE14BE
  LDI r3, 256
  LDI r10, 2377
  LDI r7, 3860
  CIRCLE r10, r3, r10, r7
endif_1:
  XOR r9, r3, r24
  XOR r2, r3, r10
  LDI r4, 2
  LDI r11, 2984
  LDI r4, 522
  LDI r5, 0xACC7C2
  LDI r7, 3646
  RECTF r4, r11, r4, r5, r7
  XOR r2, r13, r15
  AND r4, r10, r28
  AND r13, r15, r1
  AND r14, r0, r12
  CMP r13, r4
  JZ r13, else_2
  DIV r9, r6, r4
  DIV r15, r7, r2
  SHL r31, r15, r9
  DIV r15, r1, r28
  JMP endif_3
else_2:
  LDI r3, 255
  LDI r16, 16
  LDI r3, 1728
  PSET r3, r16, r3
endif_3:
  LDI r10, 8
  STORE r10, r1
  LOAD r4, r10
  LDI r10, 2
  STORE r10, r8
  LOAD r12, r10
  LDI r1, 245
  STORE r1, r5
  LOAD r6, r1
  HALT
