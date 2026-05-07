; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It repeatedly draws rectangles using the `RECTF` instruction while decrementing counters until they reach zero, at which point it halts execution.

; counted animation
; initialization
  LDI r1, 0xBAE0E9
  LDI r8, 64
  LDI r12, 0x73FC0D
  LDI r3, 32
  LDI r15, 1
  LDI r2, 204
  LDI r7, 0x2A6C6E
  LDI r6, 0x58C7FE
  LDI r6, 5
loop_0:
  ADD r5, r11, r7
  LDI r1, 1
  SUB r6, r6, r1
  JNZ r6, loop_0
  LDI r8, 36
loop_1:
  LDI r10, 0x0E2CC6
  LDI r7, 16
  LDI r0, 0
  LDI r11, 3401
  LDI r12, 0x1762C7
  RECTF r10, r7, r0, r11, r12
  SUB r4, r8, r15
  LDI r1, 1
  SUB r8, r8, r1
  JNZ r8, loop_1
  HALT
