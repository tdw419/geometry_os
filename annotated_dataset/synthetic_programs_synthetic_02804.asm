; DESCRIPTION: The GeOS assembly code initializes registers with specific values and performs a series of operations including conditional jumps, arithmetic calculations, bit manipulations, and drawing commands like `LINE` and `CIRCLE`. The program includes loops that execute repeatedly until certain conditions are met, such as register values being zero or equal.

; mixed program
; initialization
  LDI r15, 0xA2FEDC
  LDI r8, 10
  LDI r24, 10
  LDI r14, 32
  CMP r11, r2
  JZ r11, else_0
  MOD r8, r7, r2
  JMP endif_1
else_0:
  LDI r1, 3562
  FILL r1
endif_1:
  LDI r1, 4
loop_2:
  SHR r2, r12, r8
  CMPI r11, r10, 183
  SUBI r7, r14, 165
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_2
  LDI r9, 0
loop_3:
  XOR r2, r1, r4
  LDI r2, 2
  LDI r3, 255
  LDI r15, 1330
  LDI r16, 4079
  LDI r3, 1543
  LINE r2, r3, r15, r16, r3
  ANDI r4, r8, 2
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_3
  CMP r7, r11
  CMP r3, r0
  JZ r3, else_4
  SHR r5, r6, r4
  OR r11, r6, r0
  MUL r30, r1, r0
  JMP endif_5
else_4:
  LDI r0, 1054
  LDI r1, 2088
  LDI r9, 2124
  PSET r0, r1, r9
  LDI r12, 2119
  LDI r11, 599
  LDI r5, 0
  LDI r15, 927
  LDI r3, 1909
  LINE r12, r11, r5, r15, r3
endif_5:
  CMP r4, r14
  JZ r4, else_6
  AND r11, r7, r13
  MUL r14, r0, r1
  JMP endif_7
else_6:
  LDI r4, 0xFA9C49
  FILL r4
  LDI r21, 64
  LDI r0, 0x64B19F
  LDI r13, 0x6FCE22
  LDI r4, 0x186623
  CIRCLE r21, r0, r13, r4
  LDI r0, 724
  LDI r8, 0xD20748
  LDI r4, 0
  LDI r11, 324
  LDI r10, 0xCABA1B
  LINE r0, r8, r4, r11, r10
endif_7:
main_8:
  SHR r8, r3, r2
  SAR r13, r0, r15
  OR r11, r4, r14
  OR r6, r2, r3
  CMPI r1, 0x0FF765
  FRAME
  JMP main_8
