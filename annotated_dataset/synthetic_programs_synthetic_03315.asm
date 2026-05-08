; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a counted animation loop. It repeatedly draws a pixel at a specific coordinate and a circle with varying parameters before halting execution.

; counted animation
; initialization
  LDI r4, 32
  LDI r12, 256
  LDI r15, 16
  LDI r9, 128
  LDI r13, 25
loop_0:
  ADDI r2, r0, 0xF37140
  CMPI r5, r13, 64
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_0
  LDI r14, 3
loop_1:
  LDI r7, 850
  LDI r9, 128
  LDI r10, 1123
  PSET r7, r9, r10
  SUBI r7, r0, 0xC4756F
  LDI r1, 4
  LDI r4, 0
  LDI r5, 0x110F6A
  LDI r11, 2688
  CIRCLE r1, r4, r5, r11
  SUBI r4, r3, 134
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_1
  HALT
