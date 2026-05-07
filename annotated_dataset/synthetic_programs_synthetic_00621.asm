; DESCRIPTION: This GeOS assembly code initializes several registers and performs a series of counted loops to manipulate graphics. It includes operations like XOR, division, subtraction, and pixel setting, resulting in a visual animation effect on the screen.

; counted animation
; initialization
  LDI r1, 545
  LDI r6, 54
  LDI r10, 3236
  LDI r20, 8
  LDI r12, 0xFA2B48
  LDI r13, 128
  LDI r6, 0x70886F
loop_0:
  XOR r0, r3, r12
  DIV r8, r6, r1
  SUBI r10, r12, 8
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_0
  LDI r14, 10
loop_1:
  SUBI r1, r15, 0xC82094
  LDI r5, 256
  FILL r5
  LDI r14, 2553
  LDI r12, 1152
  LDI r15, 0x191E9A
  PSET r14, r12, r15
  LDI r0, 2
  LDI r4, 256
  LDI r0, 0x786BD6
  PSET r0, r4, r0
  LDI r4, 1
  SUB r14, r14, r4
  JNZ r14, loop_1
  LDI r9, 28
loop_2:
  LDI r15, 2
  LDI r11, 2989
  LDI r0, 2291
  PSET r15, r11, r0
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_2
  HALT
