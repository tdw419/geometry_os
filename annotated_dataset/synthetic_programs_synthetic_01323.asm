; DESCRIPTION: This GeOS assembly code initializes various registers and performs a series of conditional operations based on key input. It includes arithmetic operations like addition, subtraction, and modulo, as well as graphical functions such as setting pixels, drawing circles, and rectangles, with loops for repetitive tasks. The program halts after completing its execution.

; mixed program
; initialization
  LDI r13, 256
  LDI r15, 128
  LDI r14, 0xE900C8
  LDI r6, 32
  LDI r21, 128
  LDI r3, 32
  LDI r9, 0xEC8640
  LDI r0, 8
  IKEY r4
  CMPI r4, 161
  JNZ r4, key_0
  CMP r24, r10
  JNZ r24, else_1
  ADD r24, r14, r7
  SUB r11, r9, r17
  MOD r12, r6, r0
  JMP endif_2
else_1:
  LDI r2, 16
  LDI r7, 3620
  LDI r10, 2515
  PSET r2, r7, r10
endif_2:
  XOR r11, r5, r14
  XOR r4, r14, r27
  CMP r28, r14
  JNZ r28, else_3
  MOD r5, r15, r2
  XOR r3, r8, r13
  JMP endif_4
else_3:
  LDI r5, 3572
  LDI r3, 0xC6F710
  LDI r5, 0x0025E9
  LDI r0, 0x0FDB22
  CIRCLE r5, r3, r5, r0
  LDI r11, 32
  LDI r13, 1166
  LDI r11, 2223
  LDI r21, 10
  LDI r1, 64
  RECTF r11, r13, r11, r21, r1
  LDI r3, 0x8AF298
  LDI r9, 3656
  LDI r25, 0x732C49
  LDI r8, 919
  LDI r14, 1239
  RECTF r3, r9, r25, r8, r14
endif_4:
  LDI r1, 8
loop_5:
  ADDI r5, r27, 231
  LDI r3, 1
  FILL r3
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_5
  LDI r12, 47
loop_6:
  ADDI r8, r15, 128
  LDI r9, 16
  LDI r0, 0x696096
  LDI r13, 0xDC1453
  WPIXEL
  ADDI r0, r10, 64
  LDI r7, 1
  SUB r12, r12, r7
  JNZ r12, loop_6
  SAR r11, r9, r10
  SHR r0, r2, r10
  HALT
