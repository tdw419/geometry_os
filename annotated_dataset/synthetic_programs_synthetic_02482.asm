; DESCRIPTION: The GeOS assembly code initializes registers with specific values and performs a counted animation. It multiplies two registers in a loop, decrements a counter until it reaches zero, then enters another loop that adds and subtracts values to another register before halting the program.

; counted animation
; initialization
  LDI r6, 0x880167
  LDI r3, 2887
  LDI r9, 1
loop_0:
  MUL r7, r6, r8
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_0
  LDI r15, 128
loop_1:
  ADD r11, r0, r15
  SUBI r12, r3, 194
  LDI r1, 1
  SUB r15, r15, r1
  JNZ r15, loop_1
  HALT
