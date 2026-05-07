; DESCRIPTION: The GeOS assembly code performs conditional logic based on comparisons between registers. It initializes several registers with specific values and executes different sets of operations depending on the results of these comparisons, including arithmetic operations, bitwise operations, drawing primitives (like rectangles and lines), and pixel manipulation. The code ultimately halts execution after completing its tasks.

; conditional logic
; initialization
  LDI r6, 2739
  LDI r5, 4
  LDI r4, 0xF0FEC2
  CMP r14, r5
  JNZ r14, else_0
  OR r8, r5, r7
  DIV r2, r10, r5
  JMP endif_1
else_0:
  LDI r0, 0
  LDI r9, 347
  LDI r3, 2
  PSET r0, r9, r3
  LDI r5, 0x4F47FC
  LDI r11, 1806
  LDI r7, 2854
  PSET r5, r11, r7
endif_1:
  CMP r13, r6
  JZ r13, else_2
  MOD r6, r7, r14
  OR r11, r2, r0
  SHL r1, r8, r15
  SHL r1, r5, r15
  JMP endif_3
else_2:
  LDI r6, 0xF6CFC3
  LDI r13, 16
  LDI r9, 255
  LDI r14, 1377
  LDI r3, 0x7FCD36
  RECTF r6, r13, r9, r14, r3
  LDI r12, 255
  LDI r4, 255
  LDI r5, 255
  PSETI
endif_3:
  CMP r8, r3
  JNZ r8, else_4
  SHL r13, r9, r20
  JMP endif_5
else_4:
  LDI r13, 2173
  LDI r10, 0
  LDI r13, 8
  PSETI
  LDI r6, 16
  LDI r7, 0xD0E235
  LDI r9, 0
  WPIXEL
  LDI r6, 256
  LDI r3, 0x21423F
  LDI r13, 247
  PSETI
  LDI r11, 0x27F385
  LDI r5, 0xBA163E
  LDI r12, 0xE37042
  LDI r14, 0xE06B19
  LDI r12, 0x539F6D
  LINE r11, r5, r12, r14, r12
endif_5:
  HALT
