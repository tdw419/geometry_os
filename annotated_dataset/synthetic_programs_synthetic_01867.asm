; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It performs arithmetic operations, bit manipulations, and conditional jumps to create an animated effect, halting execution after completing the loops.

; counted animation
; initialization
  LDI r12, 4
  LDI r31, 0x15354F
  LDI r13, 2255
  LDI r14, 0x3E75D1
loop_0:
  SUBI r3, r8, 0xDC1B13
  ADDI r7, r11, 9
  ADD r11, r12, r2
  SHR r3, r12, r5
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_0
  LDI r11, 8
loop_1:
  ANDI r4, r7, 64
  LDI r2, 1
  SUB r11, r11, r2
  JNZ r11, loop_1
  LDI r6, 48
loop_2:
  CMPI r8, r1, 0xE6BA2F
  LDI r5, 1
  SUB r6, r6, r5
  JNZ r6, loop_2
  HALT
