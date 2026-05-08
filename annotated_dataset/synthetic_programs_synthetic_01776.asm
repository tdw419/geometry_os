; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then draws various shapes like lines, circles, and rectangles on the screen, with conditional branches based on register comparisons. Finally, it continuously displays text "WORLD" in a loop, updating the frame each time.

; mixed program
; initialization
  LDI r8, 0
  LDI r15, 4
  LDI r10, 4
  LDI r13, 0x074D9E
; palette
  LDI r13, 0x24FF
  LDI r12, 1
  LDI r1, 0x00AAFF
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0xFFEE00
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0x008888
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0x880088
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0x0044FF
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0x880088
  STORE r13, r1
  ADD r13, r13, r12
  LDI r1, 0x888800
  STORE r13, r1
  ADD r13, r13, r12
  LDI r14, 10
  LDI r14, 1
  LDI r4, 8
  TEXT r14, r14, r4, "HELLO"
  CMP r6, r13
  JNZ r6, else_0
  XOR r12, r4, r2
  DIV r8, r14, r5
  MOD r0, r15, r1
  ADD r13, r10, r0
  JMP endif_1
else_0:
  LDI r5, 0x28E972
  LDI r1, 234
  LDI r14, 0xA8415F
  LDI r12, 128
  LDI r7, 32
  LINE r5, r1, r14, r12, r7
  LDI r10, 16
  LDI r10, 0xD46BE0
  LDI r1, 256
  LDI r8, 32
  CIRCLE r10, r10, r1, r8
  LDI r13, 4013
  LDI r6, 3125
  LDI r2, 255
  LDI r1, 128
  LDI r6, 766
  RECTF r13, r6, r2, r1, r6
endif_1:
  LDI r13, 40
loop_2:
  LDI r9, 0x7EE1E7
  LDI r9, 255
  LDI r10, 0x39A16E
  LDI r9, 0x6594E8
  CIRCLE r9, r9, r10, r9
  ANDI r1, r6, 255
  ANDI r10, r8, 203
  LDI r6, 1
  SUB r13, r13, r6
  JNZ r13, loop_2
  SHL r13, r0, r7
  SHR r8, r12, r15
  SHL r4, r15, r3
  SHR r1, r7, r10
main_3:
  LDI r13, 0xFAC7A8
  LDI r9, 0
  LDI r11, 2698
  LDI r8, 1812
  LDI r9, 16
  LINE r13, r9, r11, r8, r9
  SHL r12, r6, r5
  LDI r4, 1
  LDI r14, 128
  LDI r0, 2680
  DRAWTEXT r4, r14, r0, "WORLD"
  OR r7, r4, r1
  AND r0, r12, r11
  FRAME
  JMP main_3
