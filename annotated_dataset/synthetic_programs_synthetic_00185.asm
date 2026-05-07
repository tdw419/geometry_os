; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a counted animation. It draws pixels in a loop, modifies register values, and uses conditional jumps to repeat segments of the code until certain conditions are met, ultimately halting execution.

; counted animation
; initialization
  LDI r1, 461
  LDI r5, 3043
  LDI r7, 4
loop_0:
  LDI r6, 10
  LDI r10, 0x8B6EB7
  LDI r5, 546
  WPIXEL
  LDI r8, 1
  SUB r7, r7, r8
  JNZ r7, loop_0
  LDI r13, 6
loop_1:
  CMPI r3, r12, 0x85B18A
  SUB r8, r3, r6
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_1
  LDI r15, 47
loop_2:
  ADDI r13, r9, 237
  LDI r1, 1440
  LDI r14, 1541
  LDI r2, 545
  PSET r1, r14, r2
  SUBI r31, r13, 2
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_2
  HALT
