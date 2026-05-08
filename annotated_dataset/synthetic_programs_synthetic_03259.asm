; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop that decrements register `r4` until it reaches zero, at which point the program halts. The loop also performs a subtraction operation involving registers `r12`, `r15`, and a constant value of 255, but this result is not stored or used further in the provided code snippet.

; counted animation
; initialization
  LDI r1, 0x57F8C6
  LDI r10, 0xD5D08A
  LDI r4, 1
  LDI r3, 128
  LDI r13, 0xE5CF43
  LDI r4, 29
loop_0:
  SUBI r12, r15, 255
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  HALT
