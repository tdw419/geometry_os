; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform arithmetic operations, bit manipulations, and conditional jumps based on the register contents. The code ultimately halts after completing the loops.

; counted animation
; initialization
  LDI r10, 3670
  LDI r1, 598
  LDI r4, 119
  LDI r5, 1
  LDI r9, 0x727118
loop_0:
  ADDI r1, r6, 255
  DIV r14, r11, r5
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_0
  LDI r4, 23
loop_1:
  LDI r22, 8
  FILL r22
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_1
  LDI r5, 16
loop_2:
  ANDI r10, r7, 0xC93FF2
  ADDI r15, r14, 232
  LDI r6, 1
  SUB r5, r5, r6
  JNZ r5, loop_2
  HALT
