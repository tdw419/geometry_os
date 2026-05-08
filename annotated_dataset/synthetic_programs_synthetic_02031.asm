; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons. It involves storing and loading data, modifying pixel colors, drawing lines, and using bitwise operations to manipulate register contents before halting the program.

; mixed program
; initialization
  LDI r1, 0x71A20F
  LDI r12, 2
  LDI r10, 0x6B8C2C
  LDI r14, 4
  LDI r13, 16
  IKEY r14
  CMPI r14, 183
  JNZ r14, key_0
  LDI r15, 2644
  STORE r15, r9
  LOAD r8, r15
  LDI r9, 0x088D3F
  STORE r9, r2
  LOAD r3, r9
  LDI r6, 433
  STORE r6, r12
  LOAD r7, r6
  LDI r9, 8
  STORE r9, r13
  LOAD r15, r9
  LDI r2, 8
  STORE r2, r3
  LOAD r6, r2
  CMP r4, r1
  JZ r4, else_1
  SUB r8, r3, r0
  MOD r6, r13, r15
  JMP endif_2
else_1:
  LDI r3, 3457
  LDI r11, 2
  LDI r7, 0xC42323
  LDI r6, 128
  LDI r14, 0x01E941
  LINE r3, r11, r7, r6, r14
  LDI r15, 16
  LDI r13, 2178
  LDI r12, 4
  WPIXEL
  LDI r10, 2169
  LDI r18, 2470
  LDI r9, 2444
  LDI r12, 4
  LDI r7, 0x558DD6
  LINE r10, r18, r9, r12, r7
  LDI r2, 0
  LDI r4, 8
  LDI r6, 1387
  PSETI
endif_2:
  CMP r4, r7
  JZ r4, else_3
  SHL r6, r5, r2
  ADD r7, r10, r4
  AND r15, r11, r3
  MOD r6, r3, r12
  JMP endif_4
else_3:
  LDI r12, 8
  LDI r9, 0x567524
  LDI r9, 256
  WPIXEL
  LDI r10, 0x224CD3
  LDI r13, 256
  LDI r7, 3879
  WPIXEL
  LDI r4, 1144
  LDI r24, 0x7EF8E4
  LDI r1, 64
  LDI r18, 0xA9CEB8
  LDI r12, 0x9C1A73
  LINE r4, r24, r1, r18, r12
  LDI r3, 0xD79850
  LDI r0, 0x8ADC1C
  LDI r8, 0xDFECD0
  LDI r6, 255
  LDI r14, 457
  LINE r3, r0, r8, r6, r14
endif_4:
  CMP r11, r1
  CMP r1, r12
  JNZ r1, else_5
  SUB r13, r2, r24
  JMP endif_6
else_5:
  LDI r15, 1004
  FILL r15
endif_6:
  PUSH r5
  PUSH r10
  PUSH r9
  ADD r13, r8, r5
  MOD r0, r12, r22
  POP r9
  POP r10
  POP r5
  HALT
