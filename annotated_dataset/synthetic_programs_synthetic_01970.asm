; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a series of loops to perform geometric operations. It draws circles and sets pixels, decrementing counters until certain conditions are met before halting execution.

; counted animation
; initialization
  LDI r7, 3256
  LDI r4, 0xE1B161
  LDI r15, 0xD99E72
  LDI r9, 4
  LDI r13, 255
  LDI r5, 10
  LDI r8, 10
loop_0:
  LDI r9, 1229
  LDI r7, 2
  LDI r3, 10
  LDI r6, 2762
  CIRCLE r9, r7, r3, r6
  LDI r14, 1
  SUB r8, r8, r14
  JNZ r8, loop_0
  LDI r9, 40
loop_1:
  SUBI r6, r2, 8
  LDI r2, 255
  LDI r1, 0xAD72AC
  LDI r2, 3951
  PSET r2, r1, r2
  LDI r10, 1
  FILL r10
  ADDI r13, r2, 128
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_1
  LDI r4, 1
loop_2:
  SUBI r9, r15, 143
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_2
  HALT
