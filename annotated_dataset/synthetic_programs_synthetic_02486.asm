; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and performs conditional operations based on comparisons. It includes arithmetic operations like multiplication and division, logical operations such as AND and OR, and geometric drawing functions like CIRCLE and RECTF. The code ultimately halts execution after completing its tasks.

; conditional logic
; initialization
  LDI r0, 2489
  LDI r10, 2154
  LDI r9, 2175
  LDI r15, 2
  LDI r1, 8
  LDI r2, 0x322932
  CMP r3, r2
  JZ r3, else_0
  AND r0, r2, r7
  MUL r8, r9, r15
  MUL r2, r5, r0
  JMP endif_1
else_0:
  LDI r12, 2901
  LDI r9, 2123
  LDI r5, 399
  LDI r13, 3080
  CIRCLE r12, r9, r5, r13
  LDI r10, 0x19A0F1
  LDI r8, 1956
  LDI r2, 8
  LDI r7, 0xE71242
  LDI r8, 3861
  RECTF r10, r8, r2, r7, r8
  LDI r2, 2
  LDI r4, 255
  LDI r9, 2500
  PSET r2, r4, r9
endif_1:
  CMP r15, r7
  JNZ r15, else_2
  SUB r31, r0, r15
  SHL r4, r15, r1
  JMP endif_3
else_2:
  LDI r9, 128
  LDI r17, 3190
  LDI r14, 0x333B31
  LDI r13, 2155
  LDI r10, 0x9F5642
  RECTF r9, r17, r14, r13, r10
  LDI r6, 256
  LDI r5, 0x39BE7F
  LDI r15, 3980
  WPIXEL
  LDI r14, 8
  LDI r1, 10
  LDI r4, 2014
  LDI r5, 2
  CIRCLE r14, r1, r4, r5
endif_3:
  CMP r24, r2
  JNZ r24, else_4
  DIV r1, r2, r8
  AND r13, r8, r0
  SHL r5, r10, r1
  JMP endif_5
else_4:
  LDI r4, 0x881483
  LDI r20, 3583
  LDI r2, 0xE6DC4E
  LDI r3, 0xD8EE68
  CIRCLE r4, r20, r2, r3
  LDI r2, 0
  FILL r2
  LDI r5, 16
  FILL r5
endif_5:
  HALT
