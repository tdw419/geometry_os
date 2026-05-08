; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons between register contents. It includes drawing a circle, line, setting pixels, and filling areas conditionally. The program halts after executing the final conditional block.

; conditional logic
; initialization
  LDI r7, 4
  LDI r14, 2070
  LDI r13, 128
  CMP r12, r3
  JNZ r12, else_0
  MOD r6, r12, r5
  JMP endif_1
else_0:
  LDI r11, 10
  LDI r13, 0xBFF20B
  LDI r11, 823
  LDI r5, 0x0D8D67
  CIRCLE r11, r13, r11, r5
  LDI r15, 3299
  LDI r9, 965
  LDI r2, 2835
  LDI r6, 1324
  LDI r13, 3616
  LINE r15, r9, r2, r6, r13
  LDI r13, 32
  LDI r9, 256
  LDI r9, 256
  PSETI
  LDI r31, 961
  LDI r13, 2616
  LDI r2, 0x0FB468
  LDI r14, 742
  LDI r8, 4
  LINE r31, r13, r2, r14, r8
endif_1:
  CMP r5, r12
  JZ r5, else_2
  XOR r2, r6, r10
  JMP endif_3
else_2:
  LDI r7, 4
  LDI r4, 2603
  LDI r5, 0x43C9AA
  PSETI
  LDI r13, 0x5FBE0D
  LDI r3, 0x1FFA41
  LDI r7, 49
  LDI r3, 1071
  LDI r10, 0
  RECTF r13, r3, r7, r3, r10
  LDI r15, 1
  LDI r9, 3410
  LDI r3, 1858
  LDI r4, 1111
  LDI r4, 621
  RECTF r15, r9, r3, r4, r4
endif_3:
  CMP r6, r8
  JNZ r6, else_4
  SUB r17, r2, r6
  JMP endif_5
else_4:
  LDI r11, 0xABBB7C
  LDI r10, 0xAE15FF
  LDI r6, 725
  PSET r11, r10, r6
  LDI r8, 2261
  FILL r8
endif_5:
  HALT
