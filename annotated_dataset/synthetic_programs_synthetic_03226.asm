; DESCRIPTION: The GeOS assembly code initializes registers and performs a counted animation by drawing a circle using the `CIRCLE` instruction. It then enters a loop that decrements a counter until it reaches zero, after which the program halts.

; counted animation
; initialization
  LDI r1, 1149
  LDI r3, 2
  LDI r3, 256
loop_0:
  XOR r11, r28, r1
  LDI r14, 2119
  LDI r7, 1451
  LDI r5, 1819
  LDI r11, 0x317217
  CIRCLE r14, r7, r5, r11
  LDI r5, 1715
  LDI r3, 814
  LDI r8, 256
  PSETI
  CMPI r12, r29, 0x7A9963
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_0
  LDI r10, 1
loop_1:
  SUBI r0, r10, 0x85E6C5
  LDI r3, 1
  SUB r10, r10, r3
  JNZ r10, loop_1
  HALT
