; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it repeatedly writes a pixel to the display using specific values, decrementing a counter until it reaches zero, at which point the system halts.

; counted animation
; initialization
  LDI r14, 4
  LDI r4, 4047
  LDI r5, 255
loop_0:
  LDI r1, 255
  LDI r3, 1337
  LDI r2, 3231
  WPIXEL
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_0
  HALT
