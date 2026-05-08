; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a counted animation involving pixel drawing, rectangle filling, and circle rendering. The loops decrement counters to control the number of iterations for each graphical operation before halting execution.

; counted animation
; initialization
  LDI r3, 0xC249A4
  LDI r4, 1795
  LDI r15, 2856
  LDI r8, 0xEABC76
loop_0:
  ADDI r15, r3, 98
  LDI r13, 1
  SUB r8, r8, r13
  JNZ r8, loop_0
  LDI r5, 2
loop_1:
  LDI r21, 0x4A7D2D
  LDI r15, 0x1ADB22
  LDI r7, 256
  WPIXEL
  LDI r3, 1
  LDI r11, 0x1A9716
  LDI r1, 3176
  LDI r5, 64
  LDI r15, 3007
  RECTF r3, r11, r1, r5, r15
  CMPI r3, r14, 100
  LDI r3, 1
  SUB r5, r5, r3
  JNZ r5, loop_1
  LDI r9, 128
loop_2:
  ANDI r9, r10, 256
  SUBI r13, r27, 255
  LDI r9, 0xB7056E
  LDI r15, 8
  LDI r3, 2851
  LDI r2, 0xA3CA68
  CIRCLE r9, r15, r3, r2
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_2
  HALT
