; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It draws pixels and rectangles on the screen, updating their positions in each iteration until certain conditions are met, after which it halts execution.

; counted animation
; initialization
  LDI r0, 0x01180B
  LDI r14, 1144
  LDI r1, 1568
  LDI r8, 3090
  LDI r15, 0x807D17
  LDI r3, 0x87A19C
  LDI r6, 0x3B9E51
  LDI r12, 32
loop_0:
  LDI r12, 2
  LDI r4, 3854
  LDI r6, 10
  WPIXEL
  LDI r23, 1
  SUB r12, r12, r23
  JNZ r12, loop_0
  LDI r8, 8
loop_1:
  LDI r0, 4
  LDI r12, 0xA8CC32
  LDI r8, 0x672AC4
  LDI r11, 256
  LDI r13, 0xCD54CB
  RECTF r0, r12, r8, r11, r13
  ADD r11, r9, r12
  LDI r15, 0xAE77A9
  LDI r11, 0x58B903
  LDI r15, 0x666147
  LDI r5, 3518
  LDI r4, 128
  RECTF r15, r11, r15, r5, r4
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_1
  HALT
