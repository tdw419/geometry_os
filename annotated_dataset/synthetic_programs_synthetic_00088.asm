; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws a circle using the `CIRCLE` instruction. The loop decrements a counter (`r6`) until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r9, 0xE11308
  LDI r15, 255
  LDI r5, 0xC577F0
  LDI r6, 255
loop_0:
  LDI r24, 0x6BE3C0
  LDI r14, 0x3B085D
  LDI r5, 10
  PSETI
  SHR r1, r3, r0
  LDI r3, 0xB74C5E
  LDI r14, 3596
  LDI r14, 3271
  LDI r7, 0xBF1601
  CIRCLE r3, r14, r14, r7
  LDI r15, 1
  SUB r6, r6, r15
  JNZ r6, loop_0
  HALT
