; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on comparisons. It includes operations such as modulo calculation, rectangle drawing, pixel setting, circle drawing, bitwise operations, and shifting, ultimately leading to a halt instruction.

; conditional logic
; initialization
  LDI r0, 0x98B30B
  LDI r6, 0xBBC5CF
  LDI r4, 0xA4A430
  LDI r9, 0xDBF3B8
  LDI r7, 10
  LDI r11, 0xCEDE85
  LDI r29, 0xD318F1
  LDI r14, 256
  CMP r15, r1
  JNZ r15, else_0
  MOD r3, r4, r6
  JMP endif_1
else_0:
  LDI r15, 16
  LDI r14, 2567
  LDI r15, 3697
  LDI r19, 1905
  LDI r4, 32
  RECTF r15, r14, r15, r19, r4
  LDI r11, 0x85772A
  FILL r11
  LDI r15, 1398
  LDI r15, 1014
  LDI r10, 0xA8CE4C
  PSET r15, r15, r10
  LDI r9, 3983
  LDI r28, 0x844F0E
  LDI r3, 0x67BCA6
  PSETI
endif_1:
  CMP r1, r3
  JZ r1, else_2
  XOR r0, r1, r9
  AND r1, r16, r11
  XOR r14, r6, r12
  SUB r0, r10, r3
  JMP endif_3
else_2:
  LDI r6, 742
  LDI r10, 0xCE1D85
  LDI r5, 461
  LDI r11, 4029
  CIRCLE r6, r10, r5, r11
  LDI r13, 3533
  FILL r13
  LDI r7, 10
  LDI r6, 0
  LDI r6, 477
  WPIXEL
  LDI r25, 2
  LDI r3, 0x5BA2F8
  LDI r12, 672
  WPIXEL
endif_3:
  CMP r4, r2
  JNZ r4, else_4
  SHL r1, r11, r9
  AND r6, r9, r12
  JMP endif_5
else_4:
  LDI r6, 64
  LDI r4, 256
  LDI r8, 16
  PSET r6, r4, r8
  LDI r8, 0x6E7B98
  FILL r8
  LDI r14, 2
  LDI r11, 3548
  LDI r11, 2792
  LDI r15, 4
  CIRCLE r14, r11, r11, r15
  LDI r1, 0x96A326
  FILL r1
endif_5:
  HALT
