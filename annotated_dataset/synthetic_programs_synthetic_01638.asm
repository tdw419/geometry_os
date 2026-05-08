; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it draws a line on the screen while decrementing a counter. The loop continues until the counter reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 0xCBBA82
  LDI r13, 128
  LDI r3, 0x03DD9A
  LDI r5, 22
loop_0:
  LDI r4, 0
  LDI r8, 0x4FB346
  LDI r14, 3235
  PSET r4, r8, r14
  LDI r12, 1566
  LDI r5, 0x1F45EE
  LDI r1, 2
  LDI r1, 8
  LDI r15, 8
  LINE r12, r5, r1, r1, r15
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_0
  HALT
