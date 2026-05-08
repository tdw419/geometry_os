; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on register comparisons. It includes arithmetic operations like multiplication and shifting, as well as geometric drawing commands such as `LINE`, `PSETI`, `FILL`, and `RECTF`. The code also contains a loop that draws circles and updates registers, followed by a main loop that renders text and handles frame updates.

; mixed program
; initialization
  LDI r13, 3712
  LDI r4, 3426
  LDI r2, 1989
  LDI r6, 2952
  CMP r3, r12
  CMP r2, r14
  JNZ r2, else_0
  MUL r0, r4, r1
  JMP endif_1
else_0:
  LDI r6, 3328
  LDI r25, 0x2A4478
  LDI r2, 0x257498
  LDI r3, 1223
  LDI r13, 1566
  LINE r6, r25, r2, r3, r13
  LDI r8, 1523
  LDI r6, 256
  LDI r2, 2254
  LDI r14, 0x080C46
  LDI r10, 64
  LINE r8, r6, r2, r14, r10
  LDI r1, 10
  LDI r6, 0xD13205
  LDI r1, 0x329FB6
  PSETI
endif_1:
  CMP r5, r3
  CMP r13, r12
  JZ r13, else_2
  AND r11, r13, r6
  MUL r1, r8, r5
  SHR r7, r11, r26
  JMP endif_3
else_2:
  LDI r7, 64
  LDI r0, 4
  LDI r12, 0xBA56C4
  PSET r7, r0, r12
  LDI r9, 0xEE0856
  LDI r4, 16
  LDI r0, 0x056F14
  PSET r9, r4, r0
  LDI r0, 256
  FILL r0
  LDI r3, 32
  LDI r12, 8
  LDI r12, 128
  LDI r9, 255
  LDI r0, 10
  RECTF r3, r12, r12, r9, r0
endif_3:
  LDI r13, 32
  STORE r13, r13
  LOAD r15, r13
  LDI r8, 255
  STORE r8, r9
  LOAD r5, r8
  LDI r5, 3876
  STORE r5, r3
  LOAD r13, r5
  LDI r5, 0x0x503679D50x5036
  STORE r5, r11
  LOAD r1, r5
  SUB r17, r2, r7
  LDI r10, 22
loop_4:
  LDI r2, 128
  LDI r3, 2047
  LDI r5, 10
  PSET r2, r3, r5
  LDI r7, 0x2D37E4
  LDI r18, 0x9929EC
  LDI r14, 0x5025A6
  LDI r1, 10
  CIRCLE r7, r18, r14, r1
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_4
  SUB r4, r1, r7
main_5:
  SAR r7, r9, r10
  SHLI r4, r7, 6
  LDI r8, 16
  LDI r15, 255
  LDI r13, 4
  DRAWTEXT r8, r15, r13, "WORLD"
  FRAME
  JMP main_5
