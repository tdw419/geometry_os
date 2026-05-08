; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then draws pixels and rectangles on the screen using specific colors and coordinates, performing conditional operations based on register values to control the drawing process. The program ends with a loop that modifies a register value until it reaches zero before halting execution.

; mixed program
; initialization
  LDI r10, 1749
  LDI r6, 0
  LDI r9, 1537
; palette
  LDI r10, 0x2413
  LDI r15, 1
  LDI r14, 0x880088
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0xDD0044
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0xAAAAAA
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0x000066
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0xFF4400
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0xFF0000
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0x00FF00
  STORE r10, r14
  ADD r10, r10, r15
  LDI r14, 0x00AAFF
  STORE r10, r14
  ADD r10, r10, r15
  LDI r7, 16
  LDI r0, 3503
  LDI r9, 4
  WPIXEL
  CMP r12, r9
  JZ r12, else_0
  SHL r5, r11, r14
  SUB r13, r1, r14
  MOD r23, r11, r7
  SHL r6, r7, r2
  JMP endif_1
else_0:
  LDI r7, 0x886D92
  LDI r4, 0xA493C8
  LDI r8, 1907
  WPIXEL
  LDI r9, 399
  LDI r7, 2645
  LDI r14, 10
  PSETI
endif_1:
  CMP r5, r1
  JNZ r5, else_2
  MUL r5, r2, r10
  JMP endif_3
else_2:
  LDI r3, 3367
  LDI r1, 3026
  LDI r7, 1913
  WPIXEL
  LDI r8, 2652
  LDI r5, 1626
  LDI r15, 32
  LDI r2, 2367
  LDI r14, 564
  RECTF r8, r5, r15, r2, r14
  LDI r6, 128
  FILL r6
endif_3:
  LDI r11, 128
loop_4:
  ANDI r14, r6, 0xB83BB3
  LDI r9, 1
  SUB r11, r11, r9
  JNZ r11, loop_4
  HALT
