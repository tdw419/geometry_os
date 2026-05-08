; DESCRIPTION: This GeOS assembly code initializes system registers and sets up a color palette. It then draws a circle and multiple rectangles with varying colors. The program includes conditional loops for drawing patterns based on input conditions and halts when a specific key is pressed.

; mixed program
; initialization
  LDI r10, 2
  LDI r3, 0x2F9CB9
  LDI r11, 16
  LDI r14, 0x87C42A
  LDI r9, 0x2A0E50
; palette
  LDI r5, 0x2005
  LDI r14, 1
  LDI r15, 0xFF4400
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x444444
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF0000
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x44FF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x00FF44
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x0044FF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x00FF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF00FF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x00FFFF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x888800
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x44FF00
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xAA00AA
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x880088
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0xFF00FF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r15, 0x0000FF
  STORE r5, r15
  ADD r5, r5, r14
  LDI r12, 0x50ED6F
  LDI r1, 256
  LDI r8, 0x005EC7
  LDI r15, 2
  CIRCLE r12, r1, r8, r15
  LDI r15, 39
loop_0:
  AND r4, r15, r14
  LDI r1, 0x5626DF
  LDI r14, 2386
  LDI r25, 0x69C84D
  LDI r6, 0xF5AB1D
  LDI r13, 1613
  RECTF r1, r14, r25, r6, r13
  CMPI r2, r0, 16
  ANDI r5, r15, 0xE6916E
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_0
  CMP r0, r9
  JNZ r0, else_1
  ADD r2, r4, r9
  MUL r4, r1, r3
  SUB r31, r11, r2
  JMP endif_2
else_1:
  LDI r9, 1958
  LDI r5, 16
  LDI r3, 0xFEE184
  PSET r9, r5, r3
  LDI r14, 10
  LDI r15, 0
  LDI r8, 4
  LDI r8, 0xD7D3A1
  CIRCLE r14, r15, r8, r8
endif_2:
  IKEY r14
  CMPI r14, 155
  JNZ r14, key_3
  CMP r9, r2
  JZ r9, else_4
  AND r13, r4, r3
  SUB r2, r30, r10
  JMP endif_5
else_4:
  LDI r6, 256
  FILL r6
  LDI r0, 256
  FILL r0
  LDI r7, 479
  LDI r12, 0xE1E4BF
  LDI r4, 0
  LDI r9, 256
  LDI r10, 123
  LINE r7, r12, r4, r9, r10
endif_5:
  IKEY r3
  CMPI r3, 0x9242CA
  JNZ r3, key_6
  HALT
