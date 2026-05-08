; DESCRIPTION: The GeOS assembly code performs conditional logic comparisons and initializes various registers with specific values. It then executes different drawing operations based on the results of these comparisons, including shifting, adding, and drawing lines, circles, pixels, and rectangles using geometric primitives like LINE, CIRCLE, PSET, and RECTF.

; conditional logic
; initialization
  LDI r0, 0xFF38E1
  LDI r3, 4
  LDI r2, 1521
  LDI r9, 128
  CMP r8, r4
  JNZ r8, else_0
  SHL r11, r15, r7
  ADD r7, r11, r9
  JMP endif_1
else_0:
  LDI r14, 32
  LDI r14, 0x59DF2E
  LDI r13, 3996
  LDI r10, 255
  LDI r10, 1
  LINE r14, r14, r13, r10, r10
  LDI r2, 3937
  LDI r11, 256
  LDI r9, 0x96B4A3
  LDI r9, 3488
  CIRCLE r2, r11, r9, r9
  LDI r8, 789
  LDI r7, 64
  LDI r10, 255
  PSET r8, r7, r10
endif_1:
  CMP r15, r14
  JZ r15, else_2
  XOR r11, r6, r4
  MUL r13, r4, r0
  SHR r7, r12, r14
  SHR r10, r3, r2
  JMP endif_3
else_2:
  LDI r12, 0xB4DAB1
  LDI r1, 492
  LDI r15, 241
  LDI r3, 16
  CIRCLE r12, r1, r15, r3
endif_3:
  CMP r10, r7
  JNZ r10, else_4
  MUL r15, r5, r0
  XOR r3, r1, r9
  JMP endif_5
else_4:
  LDI r11, 2794
  LDI r5, 1752
  LDI r10, 0xE8EC0A
  PSET r11, r5, r10
  LDI r11, 0x2A853F
  FILL r11
  LDI r14, 589
  LDI r8, 3800
  LDI r13, 255
  LDI r14, 42
  LDI r13, 113
  RECTF r14, r8, r13, r14, r13
endif_5:
  HALT
