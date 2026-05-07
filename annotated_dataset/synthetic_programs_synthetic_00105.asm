; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It performs operations such as conditional comparisons, bitwise ORs, shifts, pixel setting, and drawing circles, decrementing counters to control the number of iterations for each loop until the program halts.

; counted animation
; initialization
  LDI r1, 3566
  LDI r15, 387
  LDI r2, 32
  LDI r11, 64
  LDI r10, 2
  LDI r14, 9
loop_0:
  CMPI r13, r8, 10
  CMPI r5, r10, 74
  OR r5, r4, r22
  CMPI r13, r1, 130
  LDI r5, 1
  SUB r14, r14, r5
  JNZ r14, loop_0
  LDI r10, 10
loop_1:
  SHR r11, r3, r14
  LDI r6, 883
  LDI r2, 16
  LDI r6, 4
  PSETI
  LDI r6, 0x24862C
  FILL r6
  LDI r29, 86
  LDI r9, 8
  LDI r15, 4025
  LDI r31, 256
  CIRCLE r29, r9, r15, r31
  LDI r12, 1
  SUB r10, r10, r12
  JNZ r10, loop_1
  LDI r3, 22
loop_2:
  CMPI r15, r2, 42
  LDI r3, 1977
  LDI r15, 0x9E9FE2
  LDI r14, 0xD23B17
  WPIXEL
  LDI r0, 64
  LDI r8, 64
  LDI r1, 0x3C3F0D
  PSETI
  CMPI r14, r5, 0xA9AF4E
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_2
  HALT
