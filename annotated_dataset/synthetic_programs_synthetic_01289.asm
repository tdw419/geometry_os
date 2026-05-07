; DESCRIPTION: This GeOS assembly code initializes several registers and enters a loop where it draws a circle using the `CIRCLE` instruction. The loop continues until a counter (`r24`) decrements to zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 2
  LDI r0, 3666
  LDI r7, 1
  LDI r15, 3655
  LDI r11, 2208
  LDI r24, 128
loop_0:
  CMPI r29, r10, 0x57E710
  LDI r1, 19
  LDI r14, 0x2D8963
  LDI r5, 0
  LDI r15, 649
  CIRCLE r1, r14, r5, r15
  ANDI r2, r15, 128
  CMPI r12, r8, 209
  LDI r6, 1
  SUB r24, r24, r6
  JNZ r24, loop_0
  HALT
