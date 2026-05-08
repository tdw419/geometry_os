; DESCRIPTION: This GeOS assembly code initializes registers with various values and performs conditional operations based on register comparisons. It includes loading and storing data, setting pixels, drawing a line, and handling a key input event. The program ends with a halt instruction.

; mixed program
; initialization
  LDI r2, 255
  LDI r11, 3581
  CMP r15, r4
  JZ r15, else_0
  OR r13, r6, r10
  JMP endif_1
else_0:
  LDI r9, 2103
  FILL r9
  LDI r1, 4
  LDI r3, 3708
  LDI r6, 1
  PSET r1, r3, r6
endif_1:
  CMP r1, r5
  JNZ r1, else_2
  MUL r5, r11, r6
  MOD r10, r24, r2
  JMP endif_3
else_2:
  LDI r4, 0xB76199
  LDI r0, 1916
  LDI r8, 0x288117
  PSETI
  LDI r13, 0x0EB3F7
  LDI r10, 2205
  LDI r2, 8
  PSETI
endif_3:
  IKEY r15
  CMPI r15, 10
  JNZ r15, key_4
  LDI r14, 740
  STORE r14, r10
  LOAD r15, r14
  LDI r8, 0xDE29FB
  STORE r8, r15
  LOAD r0, r8
  LDI r0, 2623
  STORE r0, r13
  LOAD r3, r0
  LDI r7, 1795
  STORE r7, r8
  LOAD r10, r7
  ADD r14, r15, r10
  LDI r10, 0xBCC95B
  STORE r10, r5
  LOAD r1, r10
  LDI r7, 0x817A27
  STORE r7, r10
  LOAD r13, r7
  CMP r15, r8
  JNZ r15, else_5
  ADD r12, r6, r14
  SHL r5, r14, r8
  SUB r0, r3, r15
  ADD r0, r7, r13
  JMP endif_6
else_5:
  LDI r21, 246
  LDI r2, 0x946A10
  LDI r9, 4010
  LDI r1, 1189
  LDI r6, 32
  LINE r21, r2, r9, r1, r6
endif_6:
  HALT
