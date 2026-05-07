; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of register `r13` with other registers. Depending on these comparisons, it either executes operations like modulo calculation, bitwise XOR, circle drawing, or line drawing, or modifies register values accordingly before halting execution.

; conditional logic
; initialization
  LDI r2, 0x551207
  LDI r1, 234
  LDI r11, 1095
  LDI r5, 0xAD9D52
  LDI r12, 0x39B875
  LDI r0, 0x79D5CA
  LDI r15, 0xE3ED71
  CMP r13, r2
  JNZ r13, else_0
  MOD r6, r14, r3
  XOR r8, r1, r15
  JMP endif_1
else_0:
  LDI r5, 1
  LDI r12, 1573
  LDI r1, 0x710EF0
  PSETI
  LDI r14, 2728
  LDI r4, 10
  LDI r8, 0x4CA8DA
  LDI r2, 128
  CIRCLE r14, r4, r8, r2
endif_1:
  CMP r13, r5
  JNZ r13, else_2
  OR r9, r10, r15
  SHR r14, r3, r7
  JMP endif_3
else_2:
  LDI r15, 1021
  LDI r2, 0x4F5A2D
  LDI r9, 2729
  LDI r3, 1979
  LDI r14, 3409
  LINE r15, r2, r9, r3, r14
  LDI r14, 3667
  LDI r1, 727
  LDI r5, 2391
  WPIXEL
endif_3:
  HALT
