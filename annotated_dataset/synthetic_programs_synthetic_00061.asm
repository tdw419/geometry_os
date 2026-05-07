; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons. It includes arithmetic operations like subtraction and division, logical operations such as AND and XOR, and geometric drawing functions like RECTF, LINE, and CIRCLE. The code ultimately halts execution after completing the specified operations.

; conditional logic
; initialization
  LDI r4, 162
  LDI r13, 2459
  LDI r5, 0xED63B1
  LDI r9, 589
  LDI r15, 0x6116A2
  LDI r11, 3232
  CMP r15, r2
  JZ r15, else_0
  SUB r5, r13, r27
  JMP endif_1
else_0:
  LDI r1, 2021
  LDI r1, 256
  LDI r4, 0xE93376
  PSETI
  LDI r7, 1322
  LDI r2, 3257
  LDI r2, 16
  PSETI
  LDI r8, 3135
  LDI r13, 728
  LDI r11, 4
  LDI r12, 2
  LDI r0, 0xD5EF12
  RECTF r8, r13, r11, r12, r0
  LDI r9, 10
  LDI r4, 0x5D2D0C
  LDI r3, 1520
  LDI r5, 16
  LDI r3, 8
  LINE r9, r4, r3, r5, r3
endif_1:
  CMP r3, r10
  JZ r3, else_2
  AND r3, r8, r0
  XOR r1, r0, r8
  JMP endif_3
else_2:
  LDI r13, 2810
  LDI r23, 3100
  LDI r11, 25
  LDI r12, 1137
  CIRCLE r13, r23, r11, r12
  LDI r8, 2036
  FILL r8
  LDI r15, 25
  LDI r26, 0xB86CDE
  LDI r10, 32
  PSET r15, r26, r10
  LDI r2, 3900
  LDI r19, 4
  LDI r1, 0x2C970B
  LDI r14, 0xE47FB0
  CIRCLE r2, r19, r1, r14
endif_3:
  CMP r31, r7
  JZ r31, else_4
  SUB r0, r10, r8
  DIV r15, r19, r10
  JMP endif_5
else_4:
  LDI r2, 256
  LDI r12, 3579
  LDI r7, 0x94FADF
  LDI r2, 1541
  LDI r3, 10
  LINE r2, r12, r7, r2, r3
  LDI r0, 1555
  LDI r13, 255
  LDI r4, 1819
  LDI r0, 2
  CIRCLE r0, r13, r4, r0
endif_5:
  HALT
