; DESCRIPTION: This GeOS assembly code initializes registers and performs a counted animation loop. It uses arithmetic operations to update register values and conditional jumps to control the flow of the loops, drawing rectangles and circles on the screen as part of the animation process.

; counted animation
; initialization
  LDI r6, 3991
  LDI r4, 10
  LDI r12, 0
  LDI r3, 0
loop_0:
  ADD r4, r7, r13
  CMPI r15, r12, 185
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_0
  LDI r13, 10
loop_1:
  LDI r4, 1336
  LDI r2, 128
  LDI r4, 0x7FFBB2
  LDI r12, 931
  LDI r8, 967
  RECTF r4, r2, r4, r12, r8
  LDI r14, 0xD41D90
  LDI r8, 255
  LDI r14, 2401
  LDI r0, 1845
  CIRCLE r14, r8, r14, r0
  MUL r5, r29, r9
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_1
  LDI r2, 0x845A02
loop_2:
  ANDI r0, r12, 101
  MOD r12, r15, r8
  SUBI r13, r10, 10
  LDI r23, 3576
  LDI r13, 128
  LDI r12, 0x2A9FD6
  LDI r2, 0xD809B8
  LDI r12, 3036
  RECTF r23, r13, r12, r2, r12
  LDI r1, 1
  SUB r2, r2, r1
  JNZ r2, loop_2
  HALT
