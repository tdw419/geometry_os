; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons. It includes multiplication, bitwise AND operations, pixel drawing, rectangle filling, circle drawing, shifting, addition, and halting the system. The code uses conditional jumps to execute different paths depending on the results of the comparisons.

; conditional logic
; initialization
  LDI r3, 2929
  LDI r9, 3060
  LDI r8, 2465
  LDI r12, 533
  LDI r13, 10
  LDI r6, 2898
  CMP r4, r12
  JZ r4, else_0
  MUL r8, r5, r15
  AND r2, r13, r14
  AND r9, r12, r7
  JMP endif_1
else_0:
  LDI r5, 0x887FC2
  LDI r3, 987
  LDI r2, 4019
  WPIXEL
  LDI r12, 0xE78B88
  LDI r6, 64
  LDI r5, 8
  LDI r21, 3730
  LDI r7, 617
  RECTF r12, r6, r5, r21, r7
  LDI r11, 1776
  FILL r11
endif_1:
  CMP r2, r8
  JZ r2, else_2
  SHL r0, r10, r2
  JMP endif_3
else_2:
  LDI r8, 0x68BE52
  FILL r8
  LDI r8, 64
  LDI r4, 1268
  LDI r1, 3065
  LDI r29, 883
  CIRCLE r8, r4, r1, r29
endif_3:
  CMP r6, r14
  JZ r6, else_4
  ADD r14, r10, r13
  ADD r11, r15, r2
  SHL r15, r1, r14
  JMP endif_5
else_4:
  LDI r1, 2194
  FILL r1
endif_5:
  HALT
