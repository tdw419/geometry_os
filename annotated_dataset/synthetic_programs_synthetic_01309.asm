; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it calculates a circle's parameters, performs bitwise operations, and sets pixels on the screen. The loop continues until a condition is met, at which point the program halts.

; counted animation
; initialization
  LDI r0, 1509
  LDI r8, 1582
  LDI r7, 187
  LDI r2, 1494
  LDI r3, 64
  LDI r5, 1918
  LDI r4, 1375
  LDI r3, 0x155291
loop_0:
  SUBI r4, r2, 1
  LDI r3, 0x329A57
  LDI r6, 32
  LDI r6, 2
  LDI r13, 10
  CIRCLE r3, r6, r6, r13
  OR r7, r11, r0
  LDI r7, 16
  LDI r11, 2878
  LDI r11, 0x6D4FAF
  PSET r7, r11, r11
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_0
  HALT
