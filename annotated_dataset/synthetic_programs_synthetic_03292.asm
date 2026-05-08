; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a counted animation. It includes nested loops that manipulate these registers to draw circles and decrement counters until the animation is complete, then halts execution.

; counted animation
; initialization
  LDI r6, 256
  LDI r1, 0x980BF1
  LDI r11, 2229
  LDI r12, 0xF6F2CE
  LDI r9, 3492
  LDI r7, 3514
  LDI r11, 0x0C3626
loop_0:
  OR r2, r12, r27
  LDI r3, 1
  SUB r11, r11, r3
  JNZ r11, loop_0
  LDI r25, 2
loop_1:
  SUBI r6, r2, 0xDFDF71
  LDI r6, 255
  LDI r10, 255
  LDI r7, 1
  LDI r1, 2
  CIRCLE r6, r10, r7, r1
  LDI r12, 1
  SUB r25, r25, r12
  JNZ r25, loop_1
  HALT
