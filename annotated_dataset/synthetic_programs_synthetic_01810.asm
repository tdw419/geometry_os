; DESCRIPTION: This GeOS assembly code performs conditional operations based on the comparison of register values. It initializes several registers with specific data and executes different sequences of arithmetic and logical instructions depending on these conditions. The code includes division, shifting, bitwise OR, modulo operations, and calls to drawing functions like `PSETI` and `CIRCLE`. Finally, it halts execution.

; conditional logic
; initialization
  LDI r5, 0x554038
  LDI r3, 2759
  LDI r7, 0x4F0475
  LDI r15, 0xC95444
  LDI r1, 0x427D01
  LDI r6, 3367
  LDI r0, 888
  CMP r14, r8
  JNZ r14, else_0
  DIV r5, r15, r12
  SHL r8, r25, r0
  OR r20, r7, r9
  MOD r5, r3, r7
  JMP endif_1
else_0:
  LDI r2, 256
  LDI r7, 4
  LDI r6, 32
  PSETI
  LDI r9, 0x665AA9
  LDI r12, 0x73C5E2
  LDI r2, 0x0ADCC8
  PSETI
  LDI r2, 256
  LDI r0, 956
  LDI r7, 0x14B49D
  PSETI
endif_1:
  CMP r14, r20
  JNZ r14, else_2
  MOD r7, r9, r25
  OR r4, r15, r10
  MOD r12, r14, r6
  JMP endif_3
else_2:
  LDI r1, 256
  LDI r4, 64
  LDI r1, 0xEC2845
  PSET r1, r4, r1
  LDI r9, 0xC29C7C
  LDI r5, 0
  LDI r0, 16
  LDI r14, 16
  CIRCLE r9, r5, r0, r14
  LDI r2, 506
  LDI r11, 0x783BC8
  LDI r13, 360
  LDI r14, 2998
  CIRCLE r2, r11, r13, r14
  LDI r5, 3933
  LDI r12, 0x7247E8
  LDI r9, 631
  WPIXEL
endif_3:
  HALT
