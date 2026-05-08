; DESCRIPTION: This GeOS assembly code initializes and executes a counted animation involving pixel drawing, circle rendering, line drawing, and point setting on a graphical display. It uses loops to repeat specific graphic operations a set number of times before halting execution.

; counted animation
; initialization
  LDI r9, 630
  LDI r14, 0xB5C660
  LDI r0, 16
loop_0:
  AND r3, r14, r8
  LDI r10, 3543
  LDI r8, 1
  LDI r11, 1318
  WPIXEL
  ANDI r7, r11, 1
  LDI r12, 3180
  LDI r2, 3053
  LDI r3, 32
  LDI r15, 128
  CIRCLE r12, r2, r3, r15
  LDI r10, 1
  SUB r0, r0, r10
  JNZ r0, loop_0
  LDI r26, 0xA3F1E4
loop_1:
  SUBI r8, r14, 2
  LDI r12, 2883
  LDI r7, 0xF2DA2E
  LDI r2, 256
  LDI r6, 1930
  LDI r14, 2884
  LINE r12, r7, r2, r6, r14
  ANDI r13, r5, 0xCF994B
  LDI r12, 1
  SUB r26, r26, r12
  JNZ r26, loop_1
  LDI r0, 256
loop_2:
  LDI r14, 2
  LDI r5, 258
  LDI r4, 8
  PSET r14, r5, r4
  LDI r2, 1
  SUB r0, r0, r2
  JNZ r0, loop_2
  HALT
