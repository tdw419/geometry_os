; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a series of loops. The first loop decrements a counter until it reaches zero. The second loop draws circles and lines using the `CIRCLE` and `LINE` instructions, respectively, by manipulating register values in each iteration. The third loop performs bitwise operations and arithmetic before halting execution.

; counted animation
; initialization
  LDI r4, 0x1744FE
  LDI r15, 1798
  LDI r9, 0x443427
  LDI r1, 0x3987B4
  LDI r12, 10
  LDI r2, 10
  LDI r6, 46
loop_0:
  OR r28, r10, r3
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_0
  LDI r5, 10
loop_1:
  SHL r7, r5, r0
  LDI r14, 128
  LDI r15, 0x89112E
  LDI r3, 128
  LDI r13, 0
  CIRCLE r14, r15, r3, r13
  LDI r15, 3041
  LDI r1, 64
  LDI r9, 3309
  LDI r12, 3053
  LDI r14, 0xC6CE44
  LINE r15, r1, r9, r12, r14
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_1
  LDI r6, 4
loop_2:
  SUBI r11, r6, 64
  ANDI r4, r11, 2
  DIV r1, r0, r4
  LDI r1, 1
  SUB r6, r6, r1
  JNZ r6, loop_2
  HALT
