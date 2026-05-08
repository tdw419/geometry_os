; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, and performs conditional operations based on register comparisons. It includes drawing commands like rectangles and circles, as well as storing and loading data from memory. The program ends with a halt instruction.

; mixed program
; initialization
  LDI r11, 0xE6E7B6
  LDI r7, 2292
  LDI r4, 0x50D021
  LDI r5, 4012
  LDI r9, 2206
  LDI r13, 3036
  LDI r12, 0x4F9BFC
  LDI r22, 256
; palette
  LDI r5, 0x244A
  LDI r1, 1
  LDI r2, 0xFFFF00
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0xFF8800
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0x888800
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0x00FF44
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0xAA00AA
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0x0044FF
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0x0000CC
  STORE r5, r2
  ADD r5, r5, r1
  LDI r2, 0xFF00FF
  STORE r5, r2
  ADD r5, r5, r1
  CMP r0, r12
  JNZ r0, else_0
  SUB r27, r1, r6
  OR r7, r13, r1
  ADD r2, r9, r27
  SHR r13, r2, r5
  JMP endif_1
else_0:
  LDI r14, 0xCA64B2
  LDI r2, 256
  LDI r24, 0xCD1470
  LDI r5, 3565
  LDI r15, 1251
  RECTF r14, r2, r24, r5, r15
endif_1:
  PUSH r1
  PUSH r10
  SUB r15, r2, r5
  DIV r13, r6, r11
  XOR r7, r15, r11
  MOD r5, r1, r8
  POP r10
  POP r1
  MUL r12, r13, r27
  CMP r8, r13
  JZ r8, else_2
  SUB r12, r11, r2
  JMP endif_3
else_2:
  LDI r13, 2
  LDI r4, 1
  LDI r8, 0x717751
  LDI r11, 2
  LDI r13, 906
  RECTF r13, r4, r8, r11, r13
  LDI r8, 0xC94A2F
  LDI r10, 3446
  LDI r8, 0x86D175
  PSETI
  LDI r0, 8
  LDI r11, 2912
  LDI r1, 4
  LDI r15, 0xC6B706
  CIRCLE r0, r11, r1, r15
  LDI r13, 0xCD731C
  LDI r13, 3373
  LDI r10, 8
  LDI r6, 2428
  CIRCLE r13, r13, r10, r6
endif_3:
  LDI r18, 1
  STORE r18, r0
  LOAD r1, r18
  LDI r7, 0xFE1D8C
  STORE r7, r15
  LOAD r0, r7
  LDI r11, 0xB5946A
  STORE r11, r20
  LOAD r14, r11
  LDI r29, 0xC0FBDE
  STORE r29, r8
  LOAD r2, r29
  LDI r12, 0x5AE592
  STORE r12, r0
  LOAD r7, r12
  CMP r10, r6
  JZ r10, else_4
  XOR r6, r10, r11
  JMP endif_5
else_4:
  LDI r15, 2333
  FILL r15
  LDI r0, 0x7F48F6
  LDI r15, 3147
  LDI r5, 0xAEE225
  LDI r9, 128
  LDI r5, 0xC16679
  LINE r0, r15, r5, r9, r5
endif_5:
  HALT
