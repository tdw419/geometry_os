; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted loop to draw circles using the `CIRCLE` instruction. The loops decrement counters until they reach zero, at which point the program halts.

; counted animation
; initialization
  LDI r13, 2
  LDI r0, 2
  LDI r14, 2614
  LDI r1, 3653
  LDI r10, 128
  LDI r6, 0
  LDI r4, 3474
  LDI r15, 2323
  LDI r13, 0x54D66F
loop_0:
  ADDI r8, r6, 0x92F72D
  ANDI r13, r9, 171
  LDI r10, 0xA00E3D
  LDI r10, 3001
  LDI r15, 2940
  LDI r11, 16
  CIRCLE r10, r10, r15, r11
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_0
  LDI r14, 128
loop_1:
  ANDI r2, r5, 0x4179C0
  MOD r15, r11, r6
  MUL r12, r8, r4
  ANDI r5, r15, 0x27AB40
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_1
  HALT
