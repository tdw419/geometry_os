; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on comparisons. It includes operations such as division, multiplication, shifting, modulo, addition, and drawing functions like `PSET` and `RECTF`, ultimately halting the program after executing the conditional branches.

; conditional logic
; initialization
  LDI r10, 460
  LDI r7, 64
  LDI r0, 0xA7311A
  LDI r3, 0x5BD6E0
  LDI r11, 212
  CMP r13, r24
  JZ r13, else_0
  DIV r9, r6, r12
  JMP endif_1
else_0:
  LDI r7, 323
  LDI r21, 4
  LDI r5, 2461
  PSET r7, r21, r5
endif_1:
  CMP r7, r0
  JZ r7, else_2
  MUL r5, r4, r3
  SHL r19, r1, r2
  JMP endif_3
else_2:
  LDI r5, 0x19BED3
  LDI r8, 0
  LDI r13, 2
  PSETI
endif_3:
  CMP r12, r15
  JZ r12, else_4
  MOD r3, r12, r5
  MOD r3, r1, r10
  DIV r12, r11, r9
  ADD r12, r10, r8
  JMP endif_5
else_4:
  LDI r1, 2467
  FILL r1
  LDI r3, 0x01E15C
  LDI r15, 0x4558F5
  LDI r14, 3937
  LDI r2, 2835
  LDI r2, 1
  RECTF r3, r15, r14, r2, r2
  LDI r12, 1171
  LDI r0, 0xE543CE
  LDI r15, 143
  PSETI
  LDI r0, 0xCE0493
  LDI r4, 16
  LDI r3, 0x5D7788
  PSET r0, r4, r3
endif_5:
  HALT
