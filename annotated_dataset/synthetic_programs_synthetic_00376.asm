; DESCRIPTION: The GeOS assembly code initializes several registers and then enters a counted animation loop. It decrements a counter `r7` in an inner loop and performs arithmetic operations on other registers in another loop before halting execution.

; counted animation
; initialization
  LDI r12, 10
  LDI r5, 2
  LDI r3, 1465
  LDI r6, 4
  LDI r7, 44
loop_0:
  CMPI r6, r8, 72
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  LDI r15, 32
loop_1:
  CMPI r10, r5, 0x964A98
  MUL r1, r14, r9
  SHL r14, r12, r11
  LDI r5, 1
  SUB r15, r15, r5
  JNZ r15, loop_1
  HALT
