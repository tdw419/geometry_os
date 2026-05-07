; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It performs arithmetic operations, including subtraction and modulo, and uses conditional jumps to control the flow. The code also includes a loop that draws circles using the `CIRCLE` instruction, modifies register values, and eventually halts execution.

; counted animation
; initialization
  LDI r7, 0x6242D0
  LDI r9, 3572
  LDI r1, 0x8BA0E7
  LDI r8, 64
  LDI r31, 1
  LDI r13, 739
  LDI r4, 0x3DC4DE
loop_0:
  SUB r3, r10, r12
  SUBI r6, r5, 0x8C9177
  MOD r1, r11, r3
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_0
  LDI r7, 9
loop_1:
  SHL r0, r1, r7
  LDI r11, 1936
  LDI r12, 0xC93417
  LDI r8, 1928
  LDI r5, 3328
  CIRCLE r11, r12, r8, r5
  ANDI r15, r13, 16
  LDI r3, 1
  SUB r7, r7, r3
  JNZ r7, loop_1
  HALT
