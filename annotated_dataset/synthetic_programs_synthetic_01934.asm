; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and enters a counted loop where it performs division, bitwise operations, and plotting using the `PSET` instruction. The loop iterates 16 times, decrementing the counter until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 1671
  LDI r3, 0x2D2FC4
  LDI r1, 4
  LDI r11, 3182
  LDI r25, 19
  LDI r3, 16
loop_0:
  DIV r4, r9, r15
  ANDI r6, r15, 93
  AND r1, r5, r0
  LDI r12, 442
  LDI r1, 2312
  LDI r1, 0x3AC116
  PSET r12, r1, r1
  LDI r1, 1
  SUB r3, r3, r1
  JNZ r3, loop_0
  HALT
