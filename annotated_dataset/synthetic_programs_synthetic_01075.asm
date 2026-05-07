; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs conditional logic based on comparisons between register values. It includes operations such as subtraction, addition, modulo, multiplication, drawing lines, rectangles, circles, setting pixels, and halting execution.

; conditional logic
; initialization
  LDI r4, 8
  LDI r13, 1792
  LDI r6, 242
  LDI r9, 619
  LDI r11, 7
  LDI r0, 692
  LDI r5, 10
  LDI r14, 588
  CMP r2, r13
  JNZ r2, else_0
  SUB r2, r9, r14
  ADD r6, r9, r8
  JMP endif_1
else_0:
  LDI r7, 765
  LDI r5, 0xD53FE1
  LDI r12, 320
  LDI r11, 2175
  LDI r23, 1669
  LINE r7, r5, r12, r11, r23
endif_1:
  CMP r1, r12
  JZ r1, else_2
  MOD r11, r12, r2
  ADD r15, r14, r30
  JMP endif_3
else_2:
  LDI r17, 1448
  LDI r8, 2262
  LDI r1, 4
  WPIXEL
  LDI r12, 8
  LDI r6, 0
  LDI r18, 2
  PSET r12, r6, r18
endif_3:
  CMP r14, r6
  JZ r14, else_4
  MUL r13, r5, r0
  MUL r6, r9, r3
  MOD r9, r5, r1
  JMP endif_5
else_4:
  LDI r7, 2
  LDI r7, 64
  LDI r3, 0x38E0BC
  LDI r2, 0x9DF36F
  LDI r13, 1716
  RECTF r7, r7, r3, r2, r13
  LDI r12, 1165
  LDI r5, 0x074A3C
  LDI r10, 0x37C377
  LDI r10, 0xBE2128
  CIRCLE r12, r5, r10, r10
  LDI r12, 2210
  LDI r8, 256
  LDI r6, 4
  PSET r12, r8, r6
  LDI r4, 8
  LDI r0, 4069
  LDI r15, 0x97725F
  LDI r6, 3742
  CIRCLE r4, r0, r15, r6
endif_5:
  HALT
