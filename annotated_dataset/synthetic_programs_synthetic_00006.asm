; DESCRIPTION: This GeOS assembly code performs a series of conditional operations and geometric drawing functions. It initializes several registers with specific values, compares them, and executes different branches of logic based on the comparison results. In one branch, it draws circles and rectangles using the `CIRCLE` and `RECTF` instructions, while in another, it fills areas with colors specified by register values. The code ultimately halts execution after completing all operations.

; conditional logic
; initialization
  LDI r1, 0x9B9054
  LDI r7, 0xD514C2
  CMP r7, r12
  JZ r7, else_0
  MOD r13, r1, r3
  DIV r8, r5, r2
  MUL r14, r15, r7
  MOD r14, r7, r6
  JMP endif_1
else_0:
  LDI r4, 584
  FILL r4
  LDI r9, 2364
  FILL r9
  LDI r9, 4045
  LDI r1, 2051
  LDI r7, 169
  LDI r24, 1435
  CIRCLE r9, r1, r7, r24
  LDI r14, 128
  LDI r15, 16
  LDI r3, 256
  LDI r12, 3725
  CIRCLE r14, r15, r3, r12
endif_1:
  CMP r8, r12
  JNZ r8, else_2
  OR r1, r11, r15
  JMP endif_3
else_2:
  LDI r8, 3589
  LDI r15, 0x7A8532
  LDI r9, 763
  WPIXEL
  LDI r19, 2
  LDI r9, 32
  LDI r23, 4
  LDI r4, 16
  LDI r8, 8
  RECTF r19, r9, r23, r4, r8
  LDI r15, 32
  LDI r12, 4
  LDI r23, 16
  WPIXEL
  LDI r15, 3162
  FILL r15
endif_3:
  CMP r20, r1
  JZ r20, else_4
  SUB r14, r4, r8
  SHL r12, r10, r31
  OR r2, r9, r18
  JMP endif_5
else_4:
  LDI r3, 237
  FILL r3
  LDI r1, 0xBFEB2B
  FILL r1
  LDI r13, 1392
  LDI r12, 128
  LDI r14, 255
  LDI r14, 1294
  CIRCLE r13, r12, r14, r14
  LDI r11, 16
  FILL r11
endif_5:
  HALT
