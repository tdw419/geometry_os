; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, checks a key input against a predefined value, and conditionally calls functions that perform arithmetic operations, bit manipulations, memory access, and drawing primitives like setting pixels and rectangles. The code includes loops and conditional branches to handle different execution paths based on register comparisons.

; mixed program
; initialization
  LDI r11, 0x7E7C93
  LDI r3, 1566
  LDI r24, 0x425C1F
  LDI r9, 10
  LDI r14, 128
  LDI r1, 2791
  LDI r10, 10
  IKEY r13
  CMPI r13, 0x5BC4BE
  JNZ r13, key_0
  CALL func_1
func_1:
  MUL r3, r11, r5
  MOD r0, r14, r13
  OR r4, r10, r14
  AND r2, r13, r17
  OR r0, r11, r3
  RET
  PUSH r12
  SHL r0, r7, r15
  MUL r11, r8, r4
  POP r12
  LDI r7, 0x7E5C10x246D
  STORE r7, r13
  LOAD r12, r7
  LDI r15, 0x707A81
  STORE r15, r13
  LOAD r8, r15
  CMP r9, r7
  JZ r9, else_2
  SUB r12, r9, r11
  DIV r5, r7, r9
  ADD r11, r13, r9
  SHR r4, r31, r12
  JMP endif_3
else_2:
  LDI r4, 0x027921
  LDI r5, 0xEE51E4
  LDI r9, 255
  WPIXEL
  LDI r0, 32
  LDI r4, 0x749A0C
  LDI r14, 3603
  WPIXEL
  LDI r11, 1
  LDI r12, 16
  LDI r8, 4
  LDI r5, 64
  LDI r15, 3857
  RECTF r11, r12, r8, r5, r15
  LDI r9, 0x732A1A
  LDI r2, 2874
  LDI r15, 0xBF2AE9
  PSETI
endif_3:
  MOD r23, r6, r3
  MOD r13, r9, r2
  CALL func_4
func_4:
  ADD r0, r10, r7
  MUL r14, r6, r5
  SHL r11, r4, r0
  SUB r15, r0, r2
  SHL r14, r7, r0
  SUB r13, r11, r3
  RET
  HALT
