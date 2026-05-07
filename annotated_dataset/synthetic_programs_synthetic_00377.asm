; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. The loop draws lines on the screen and performs arithmetic operations before halting execution.

; counted animation
; initialization
  LDI r8, 2975
  LDI r11, 0xFB274F
  LDI r22, 32
  LDI r12, 0x22CB9B
  LDI r15, 32
  LDI r14, 0
loop_0:
  LDI r5, 3425
  LDI r29, 3129
  LDI r9, 0
  LDI r0, 3855
  LDI r9, 1
  LINE r5, r29, r9, r0, r9
  MOD r10, r12, r3
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_0
  LDI r9, 14
loop_1:
  CMPI r13, r3, 16
  ADDI r11, r13, 256
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_1
  HALT
