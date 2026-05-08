; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It repeatedly draws lines using the `LINE` instruction while decrementing counters until they reach zero, at which point it halts execution.

; counted animation
; initialization
  LDI r10, 3309
  LDI r4, 0x6C214E
  LDI r15, 3049
  LDI r11, 155
  LDI r3, 3106
  LDI r12, 8
  LDI r5, 0x49193C
  LDI r13, 1248
  LDI r3, 30
loop_0:
  CMPI r1, r7, 130
  ADDI r2, r9, 201
  LDI r5, 3630
  LDI r14, 8
  LDI r13, 137
  LDI r13, 320
  LDI r29, 0xABC8B6
  LINE r5, r14, r13, r13, r29
  LDI r8, 1
  SUB r3, r3, r8
  JNZ r3, loop_0
  LDI r3, 0xFCB21E
loop_1:
  SHL r0, r11, r7
  ANDI r15, r20, 109
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_1
  HALT
