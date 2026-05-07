; DESCRIPTION: This GeOS assembly code initializes several registers and then enters loops to perform geometric drawing operations such as lines, pixels, and circles. The code uses a decrementing counter to control the number of iterations for each loop, ultimately halting execution after completing all animations.

; counted animation
; initialization
  LDI r11, 0xEB58F4
  LDI r15, 256
  LDI r7, 15
loop_0:
  LDI r1, 0xC5448D
  LDI r11, 0
  LDI r1, 255
  LDI r10, 4
  LDI r11, 3709
  LINE r1, r11, r1, r10, r11
  ADDI r14, r0, 0x44CE44
  LDI r13, 1
  SUB r7, r7, r13
  JNZ r7, loop_0
  LDI r0, 0x68C980
loop_1:
  CMPI r8, r5, 0x4AE6DE
  XOR r13, r6, r15
  ADD r7, r15, r13
  DIV r5, r1, r11
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_1
  LDI r7, 32
loop_2:
  LDI r10, 10
  LDI r7, 8
  LDI r13, 3655
  PSET r10, r7, r13
  LDI r8, 2578
  LDI r9, 0xA16A19
  LDI r14, 0x98D693
  WPIXEL
  LDI r6, 0xA8E0F5
  LDI r10, 0x00A075
  LDI r9, 255
  LDI r0, 3718
  CIRCLE r6, r10, r9, r0
  LDI r12, 1233
  LDI r11, 2754
  LDI r5, 2640
  LDI r1, 0xC55E31
  LDI r3, 64
  LINE r12, r11, r5, r1, r3
  LDI r13, 1
  SUB r7, r7, r13
  JNZ r7, loop_2
  HALT
