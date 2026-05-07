; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It draws a circle, performs arithmetic operations including multiplication and bitwise shift, and uses loops to manipulate pixel settings before halting execution.

; counted animation
; initialization
  LDI r7, 32
  LDI r21, 2640
  LDI r4, 640
  LDI r0, 3939
  LDI r5, 32
  LDI r4, 64
loop_0:
  LDI r2, 0x6103E2
  LDI r3, 238
  LDI r4, 0xA4305E
  LDI r10, 1733
  CIRCLE r2, r3, r4, r10
  MUL r3, r6, r10
  SHR r8, r1, r15
  ANDI r10, r15, 56
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  LDI r11, 10
loop_1:
  LDI r0, 0xCF6C64
  LDI r5, 0x19D4BB
  LDI r0, 8
  PSETI
  ADD r9, r10, r2
  LDI r15, 1
  SUB r11, r11, r15
  JNZ r11, loop_1
  LDI r10, 0x795E0D
loop_2:
  ADDI r14, r2, 16
  ANDI r9, r0, 0x3B6DC2
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_2
  HALT
