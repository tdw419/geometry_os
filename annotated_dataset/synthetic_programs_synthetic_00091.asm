; DESCRIPTION: The GeOS assembly code initializes several registers and then enters a series of loops to draw lines and pixels on a display. The first loop draws lines repeatedly until a counter reaches zero. The second loop shifts bits in a register, performs a bitwise AND operation, and draws pixels. The third loop draws lines with varying parameters until another counter is exhausted. Finally, the system halts.

; counted animation
; initialization
  LDI r8, 16
  LDI r9, 0xD07A43
  LDI r13, 32
  LDI r10, 0x731C3B
  LDI r14, 2693
  LDI r15, 10
  LDI r5, 0
  LDI r2, 22
loop_0:
  LDI r9, 32
  LDI r5, 3402
  LDI r16, 256
  LDI r7, 3100
  LDI r3, 0x6FC5B9
  LINE r9, r5, r16, r7, r3
  LDI r3, 1
  SUB r2, r2, r3
  JNZ r2, loop_0
  LDI r5, 47
loop_1:
  SHL r13, r8, r11
  ANDI r12, r14, 0xE61F16
  LDI r9, 0xAB093C
  LDI r5, 128
  LDI r13, 1836
  WPIXEL
  LDI r2, 187
  LDI r7, 0xF19EA6
  LDI r11, 0xC7577D
  LDI r6, 10
  LDI r7, 0x664A42
  LINE r2, r7, r11, r6, r7
  LDI r9, 1
  SUB r5, r5, r9
  JNZ r5, loop_1
  LDI r0, 0xEC1FBB
loop_2:
  LDI r7, 910
  LDI r10, 2005
  LDI r2, 0x108C95
  LDI r13, 3156
  LDI r13, 991
  LINE r7, r10, r2, r13, r13
  ADDI r1, r12, 20
  OR r14, r3, r8
  ADDI r11, r10, 0x7C737F
  LDI r6, 1
  SUB r0, r0, r6
  JNZ r0, loop_2
  HALT
