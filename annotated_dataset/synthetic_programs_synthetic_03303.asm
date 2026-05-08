; DESCRIPTION: This GeOS assembly code initializes several registers and enters a series of loops that perform drawing operations on the screen. The first loop uses `PSET` to set pixels, while subsequent loops use `RECTF` to draw rectangles, with conditions controlled by register manipulations and jumps based on non-zero values.

; counted animation
; initialization
  LDI r2, 128
  LDI r9, 3002
  LDI r4, 255
  LDI r22, 3631
  LDI r10, 1
  LDI r6, 32
  LDI r11, 2780
  LDI r8, 26
loop_0:
  LDI r1, 3012
  LDI r12, 1647
  LDI r5, 3640
  PSET r1, r12, r5
  ADD r11, r6, r14
  LDI r3, 1
  SUB r8, r8, r3
  JNZ r8, loop_0
  LDI r15, 0x1383C9
loop_1:
  ADDI r15, r6, 23
  ADDI r8, r1, 0xC4D8FB
  MOD r7, r6, r14
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_1
  LDI r14, 0
loop_2:
  LDI r14, 0x898AEB
  LDI r0, 1031
  LDI r10, 0xADCBE5
  LDI r8, 8
  LDI r29, 2743
  RECTF r14, r0, r10, r8, r29
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_2
  HALT
