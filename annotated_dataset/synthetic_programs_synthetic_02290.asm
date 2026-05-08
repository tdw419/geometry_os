; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform geometric drawing operations. The first loop draws lines repeatedly, the second loop performs pixel setting operations using shifts, and the third loop involves division and pixel setting in a decrementing loop until a condition is met. The program halts after completing these operations.

; counted animation
; initialization
  LDI r12, 4
  LDI r7, 4
  LDI r6, 0x9B8846
  LDI r11, 1
  LDI r10, 255
  LDI r3, 128
  LDI r18, 255
  LDI r1, 503
  LDI r27, 10
loop_0:
  ADDI r1, r4, 99
  MOD r9, r14, r15
  SUBI r8, r2, 191
  LDI r4, 0x42E2E9
  LDI r8, 2501
  LDI r10, 255
  LDI r4, 64
  LDI r1, 10
  LINE r4, r8, r10, r4, r1
  LDI r8, 1
  SUB r27, r27, r8
  JNZ r27, loop_0
  LDI r11, 16
loop_1:
  SHL r4, r3, r6
  LDI r15, 0x6D7359
  LDI r15, 0x0C3511
  LDI r25, 64
  PSET r15, r15, r25
  LDI r8, 1
  SUB r11, r11, r8
  JNZ r11, loop_1
  LDI r9, 0x9E942C
loop_2:
  DIV r28, r0, r4
  SUBI r0, r15, 116
  LDI r10, 294
  LDI r1, 128
  LDI r5, 1696
  PSETI
  SUB r4, r11, r9
  LDI r4, 1
  SUB r9, r9, r4
  JNZ r9, loop_2
  HALT
