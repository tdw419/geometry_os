; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it performs arithmetic operations and conditional checks. The code decrements a register value in a loop until it reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r7, 0
  LDI r3, 0xD7DA38
  LDI r2, 3801
  LDI r9, 0x06BC8D
  LDI r12, 954
  LDI r15, 2420
  LDI r13, 255
  LDI r5, 0xE9D310
  LDI r0, 0x76B0F5
loop_0:
  ADDI r4, r24, 0x141259
  CMPI r5, r9, 128
  LDI r11, 1
  SUB r0, r0, r11
  JNZ r0, loop_0
  LDI r10, 64
loop_1:
  ANDI r2, r9, 128
  LDI r7, 1
  SUB r10, r10, r7
  JNZ r10, loop_1
  HALT
