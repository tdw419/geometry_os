; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop that decrements one register (r5) until it reaches zero. After exiting the first loop, it enters another loop that decrements another register (r11) until it also reaches zero before halting execution.

; counted animation
; initialization
  LDI r15, 173
  LDI r13, 2049
  LDI r4, 0x3725F5
  LDI r0, 0x6F28A9
  LDI r5, 1
loop_0:
  SUBI r14, r4, 0x844754
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_0
  LDI r11, 0xC3D583
loop_1:
  ADDI r1, r10, 120
  ADDI r1, r5, 10
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_1
  HALT
