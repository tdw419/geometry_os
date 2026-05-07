; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a counted loop structure. It performs operations such as filling memory, calculating modulo, subtracting counts, drawing rectangles, adding and comparing values, and ultimately halting the system when all loops complete.

; counted animation
; initialization
  LDI r23, 0x4FC71C
  LDI r1, 3787
  LDI r14, 0xA7899D
  LDI r25, 37
loop_0:
  LDI r3, 64
  FILL r3
  MOD r10, r8, r13
  LDI r13, 1
  SUB r25, r25, r13
  JNZ r25, loop_0
  LDI r5, 23
loop_1:
  LDI r4, 0x50B532
  LDI r0, 0x80B2DF
  LDI r13, 64
  LDI r0, 8
  LDI r13, 0x731A03
  RECTF r4, r0, r13, r0, r13
  ADDI r0, r1, 0xBA3BDF
  CMPI r7, r6, 0x9CB141
  SUBI r13, r3, 0x4BABE8
  LDI r13, 1
  SUB r5, r5, r13
  JNZ r5, loop_1
  HALT
