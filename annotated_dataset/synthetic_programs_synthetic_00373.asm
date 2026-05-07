; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons. It includes arithmetic operations like addition and subtraction, bitwise logic such as AND and XOR, and graphics-related instructions like pixel drawing (`WPIXEL`) and line drawing (`LINE`). The code ends with a halt instruction.

; conditional logic
; initialization
  LDI r15, 0x615042
  LDI r1, 0
  LDI r3, 2792
  LDI r2, 435
  LDI r12, 0x61F4C2
  LDI r11, 0xACFA5D
  CMP r12, r0
  JZ r12, else_0
  ADD r4, r10, r2
  SHR r12, r4, r5
  AND r8, r14, r18
  JMP endif_1
else_0:
  LDI r23, 3634
  LDI r11, 256
  LDI r15, 0x00DB7C
  WPIXEL
  LDI r5, 1
  LDI r2, 1414
  LDI r2, 4
  PSETI
endif_1:
  CMP r9, r14
  JNZ r9, else_2
  MUL r13, r0, r2
  XOR r7, r11, r8
  SUB r2, r6, r12
  JMP endif_3
else_2:
  LDI r12, 255
  FILL r12
  LDI r8, 256
  LDI r4, 4003
  LDI r9, 580
  PSETI
  LDI r12, 1854
  LDI r8, 10
  LDI r9, 1
  LDI r13, 3307
  LDI r2, 2232
  LINE r12, r8, r9, r13, r2
  LDI r9, 256
  LDI r6, 0x0EA1B6
  LDI r1, 64
  LDI r7, 256
  LDI r11, 2832
  LINE r9, r6, r1, r7, r11
endif_3:
  CMP r8, r1
  JNZ r8, else_4
  AND r11, r2, r5
  SHR r11, r8, r13
  SHL r13, r10, r3
  JMP endif_5
else_4:
  LDI r1, 64
  LDI r0, 1570
  LDI r13, 1521
  WPIXEL
endif_5:
  HALT
