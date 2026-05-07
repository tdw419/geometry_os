; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly decrements a register value until it reaches zero. After exiting the first loop, it enters another loop that performs line drawing operations using the `LINE` instruction, decrementing a counter until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r5, 1
  LDI r8, 1
  LDI r11, 3040
  LDI r10, 16
  LDI r0, 0xAC423C
  LDI r15, 0
  LDI r4, 3449
  LDI r7, 4089
  LDI r4, 0x4F516D
loop_0:
  CMPI r13, r14, 255
  OR r6, r10, r12
  LDI r11, 1
  SUB r4, r4, r11
  JNZ r4, loop_0
  LDI r18, 32
loop_1:
  SUBI r11, r28, 0x894699
  LDI r3, 266
  LDI r0, 128
  LDI r0, 0xEA9412
  LDI r4, 0
  LDI r13, 3293
  LINE r3, r0, r0, r4, r13
  LDI r9, 1
  SUB r18, r18, r9
  JNZ r18, loop_1
  HALT
