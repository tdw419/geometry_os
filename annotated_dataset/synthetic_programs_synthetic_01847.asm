; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly sets pixels on a display using the `WPIXEL` instruction. The loop continues until a condition is met, after which it enters another loop to clear a segment of the screen using the `PSET` instruction. Finally, it halts execution.

; counted animation
; initialization
  LDI r1, 4
  LDI r26, 2
  LDI r8, 321
  LDI r2, 492
  LDI r11, 348
  LDI r4, 0x919C89
  LDI r13, 3374
  LDI r10, 2038
  LDI r14, 0xCB14A4
loop_0:
  LDI r5, 10
  LDI r6, 10
  LDI r14, 256
  WPIXEL
  CMPI r14, r13, 16
  SUB r7, r12, r15
  LDI r4, 1
  SUB r14, r14, r4
  JNZ r14, loop_0
  LDI r12, 17
loop_1:
  ANDI r11, r0, 0
  LDI r3, 2
  LDI r1, 256
  LDI r12, 385
  PSET r3, r1, r12
  LDI r3, 1
  SUB r12, r12, r3
  JNZ r12, loop_1
  LDI r15, 13
loop_2:
  SUBI r11, r2, 203
  LDI r4, 1
  SUB r15, r15, r4
  JNZ r15, loop_2
  HALT
