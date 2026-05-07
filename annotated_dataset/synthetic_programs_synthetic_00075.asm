; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette, performs several arithmetic and bitwise operations, compares register values, and conditionally executes drawing commands like lines and rectangles. It concludes by setting individual pixels in a loop until a condition is met, then halts execution.

; mixed program
; initialization
  LDI r3, 3735
  LDI r11, 2751
  LDI r5, 64
  LDI r13, 3583
  LDI r19, 0x08690D
  LDI r1, 1735
; palette
  LDI r12, 0x50D3
  LDI r15, 1
  LDI r27, 0xFFAA00
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xAA00AA
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xFF4400
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x880088
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x000000
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x888800
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xAA00AA
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x00FFFF
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x00AAFF
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x8800FF
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xFF8800
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0x0000CC
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xFFEE00
  STORE r12, r27
  ADD r12, r12, r15
  LDI r27, 0xFF8800
  STORE r12, r27
  ADD r12, r12, r15
  SHR r13, r0, r11
  SAR r13, r12, r21
  SHLI r5, r3, 1
  SHLI r8, r5, 1
  SHR r4, r2, r0
  PUSH r27
  PUSH r7
  DIV r7, r12, r1
  MOD r4, r3, r9
  MOD r2, r11, r6
  SHR r0, r15, r18
  POP r7
  POP r27
  CMP r12, r14
  JNZ r12, else_0
  MOD r5, r1, r10
  SHL r0, r8, r6
  JMP endif_1
else_0:
  LDI r4, 0xBAD2F2
  LDI r6, 0x46F1FE
  LDI r4, 0xF690FB
  LDI r2, 2411
  LDI r15, 1581
  LINE r4, r6, r4, r2, r15
endif_1:
  LDI r8, 128
loop_2:
  LDI r31, 128
  LDI r10, 3516
  LDI r11, 526
  LDI r1, 16
  LDI r11, 10
  RECTF r31, r10, r11, r1, r11
  MUL r2, r11, r10
  LDI r10, 0xA4A3AC
  LDI r2, 1781
  LDI r8, 612
  PSET r10, r2, r8
  LDI r13, 1
  SUB r8, r8, r13
  JNZ r8, loop_2
  HALT
