; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform geometric operations including shifting, addition, subtraction, comparisons, and drawing rectangles and circles. The loops modify register values to update the animation frame count and draw shapes with varying parameters until the conditions for each loop are met, at which point the program halts.

; counted animation
; initialization
  LDI r7, 0xA60FEF
  LDI r13, 2161
  LDI r4, 64
  LDI r12, 0x07D4B0
  LDI r9, 0x4D8168
  LDI r1, 3788
  LDI r8, 64
  LDI r6, 0x2BD835
loop_0:
  SHL r5, r15, r14
  ADDI r10, r14, 109
  ADD r3, r4, r8
  CMPI r19, r9, 4
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_0
  LDI r10, 0x5380B7
loop_1:
  LDI r5, 0x60F2BC
  LDI r15, 255
  LDI r12, 143
  LDI r14, 1867
  LDI r4, 259
  RECTF r5, r15, r12, r14, r4
  SUBI r12, r15, 111
  ANDI r11, r8, 0xB4BE9D
  LDI r7, 128
  FILL r7
  LDI r20, 1
  SUB r10, r10, r20
  JNZ r10, loop_1
  LDI r12, 43
loop_2:
  SHL r16, r13, r12
  LDI r1, 0xF9A384
  LDI r8, 0x77406A
  LDI r10, 0x43BAE4
  LDI r15, 255
  CIRCLE r1, r8, r10, r15
  XOR r5, r15, r7
  CMPI r3, r13, 56
  LDI r11, 1
  SUB r12, r12, r11
  JNZ r12, loop_2
  HALT
