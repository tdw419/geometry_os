; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws a rectangle using the `RECTF` instruction. The loop continues until a counter (`r10`) decrements to zero, at which point the program halts.

; counted animation
; initialization
  LDI r12, 3198
  LDI r10, 0x3CE352
  LDI r6, 0x146787
  LDI r8, 0xE43E4D
  LDI r9, 2
  LDI r10, 0xDB8A58
loop_0:
  LDI r6, 440
  LDI r9, 2460
  LDI r0, 0x63E115
  LDI r15, 2
  LDI r2, 0
  RECTF r6, r9, r0, r15, r2
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_0
  HALT
