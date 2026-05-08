; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a series of loops to perform arithmetic operations and draw geometric shapes such as lines and circles on the screen. It also includes text display and halts execution when all tasks are completed.

; mixed program
; initialization
  LDI r28, 2
  LDI r15, 32
  LDI r2, 0xF78ABC
loop_0:
  CMPI r10, r6, 38
  DIV r7, r10, r12
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_0
  LDI r1, 0xED5E1C
loop_1:
  ADD r11, r6, r4
  CMPI r10, r6, 185
  ADDI r7, r15, 0xEC55C4
  LDI r4, 1
  SUB r1, r1, r4
  JNZ r1, loop_1
  CMP r5, r14
  MOD r14, r11, r10
  LDI r13, 128
  LDI r11, 2
  LDI r6, 0x3EA1F8
  TEXT r13, r11, r6, "HELLO"
  LDI r7, 0x57114E
  LDI r14, 64
  LDI r9, 0xB486CF
  LDI r9, 8
  LDI r24, 885
  LINE r7, r14, r9, r9, r24
  LDI r8, 3313
  LDI r5, 1
  LDI r9, 1976
  LDI r0, 394
  CIRCLE r8, r5, r9, r0
  LDI r1, 13
loop_2:
  ADDI r21, r15, 255
  LDI r11, 32
  LDI r0, 2523
  LDI r3, 219
  PSETI
  SHL r10, r14, r5
  LDI r6, 1
  SUB r1, r1, r6
  JNZ r1, loop_2
  HALT
