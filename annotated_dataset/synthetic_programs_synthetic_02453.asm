; DESCRIPTION: The GeOS assembly code performs a counted animation that involves drawing pixels and shapes on the screen. It initializes registers with specific values and iterates through loops to draw lines, circles, and fill areas with colors until certain conditions are met, after which it halts execution.

; counted animation
; initialization
  LDI r6, 4
  LDI r13, 256
  LDI r15, 119
  LDI r5, 2
  LDI r0, 0xBF9326
  LDI r13, 16
loop_0:
  XOR r8, r1, r5
  SUBI r8, r15, 0x3D2142
  LDI r2, 0x75E647
  LDI r20, 0xCB7F4F
  LDI r1, 468
  WPIXEL
  LDI r7, 8
  LDI r26, 0x6DD8FC
  LDI r12, 32
  LDI r1, 16
  LDI r1, 10
  LINE r7, r26, r12, r1, r1
  LDI r30, 1
  SUB r13, r13, r30
  JNZ r13, loop_0
  LDI r14, 0x533EAD
loop_1:
  LDI r2, 32
  FILL r2
  LDI r8, 0x0811C5
  LDI r6, 285
  LDI r4, 2971
  LDI r25, 128
  CIRCLE r8, r6, r4, r25
  LDI r10, 8
  FILL r10
  LDI r4, 1
  SUB r14, r14, r4
  JNZ r14, loop_1
  LDI r14, 4
loop_2:
  SUBI r1, r2, 119
  ANDI r5, r2, 122
  ANDI r0, r8, 0
  CMPI r13, r9, 221
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_2
  HALT
