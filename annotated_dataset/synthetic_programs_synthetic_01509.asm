; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it repeatedly draws a rectangle and a circle on the screen. The loop continues until a counter (register `r8`) decrements to zero, at which point the program halts.

; counted animation
; initialization
  LDI r6, 8
  LDI r5, 64
  LDI r14, 8
  LDI r10, 649
  LDI r2, 1855
  LDI r7, 0
  LDI r15, 0x5AF329
  LDI r11, 4
  LDI r8, 0x3ACF65
loop_0:
  LDI r1, 2
  LDI r0, 4
  LDI r7, 3952
  LDI r9, 0xB9495A
  LDI r3, 0
  RECTF r1, r0, r7, r9, r3
  ANDI r14, r1, 46
  LDI r9, 0xC9917C
  LDI r13, 0x0ACC84
  LDI r1, 0x0C0016
  LDI r5, 3429
  CIRCLE r9, r13, r1, r5
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_0
  HALT
