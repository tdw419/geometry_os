; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a counted animation by executing nested loops that modify register values based on arithmetic operations. The outer loop (`loop_0`) decrements a counter and the inner loop (`loop_1`) subtracts a value from another register until a condition is met, after which the program halts.

; counted animation
; initialization
  LDI r14, 0x05A7F6
  LDI r13, 1057
  LDI r15, 4
  LDI r6, 3889
  LDI r9, 3759
  LDI r0, 16
  LDI r7, 4021
  LDI r1, 32
loop_0:
  ANDI r5, r13, 93
  ADDI r1, r5, 0x95728D
  ADDI r6, r13, 188
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_0
  LDI r10, 4
loop_1:
  SUB r14, r12, r8
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_1
  HALT
