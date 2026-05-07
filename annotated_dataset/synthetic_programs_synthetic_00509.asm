; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and performs conditional logic operations. It includes comparisons, multiplications, divisions, bitwise operations, and calls to draw geometric shapes like circles, lines, and rectangles on a pixel-based display, ultimately halting execution.

; conditional logic
; initialization
  LDI r6, 256
  LDI r9, 2
  LDI r11, 0x038844
  LDI r7, 16
  LDI r10, 0x044415
  CMP r11, r3
  JZ r11, else_0
  MUL r13, r4, r7
  MOD r13, r9, r2
  AND r14, r0, r12
  SHR r8, r0, r9
  JMP endif_1
else_0:
  LDI r13, 2995
  LDI r12, 0x2CC95D
  LDI r1, 32
  WPIXEL
  LDI r4, 2843
  LDI r5, 1023
  LDI r6, 576
  LDI r9, 1
  CIRCLE r4, r5, r6, r9
  LDI r10, 0
  FILL r10
  LDI r1, 32
  LDI r14, 2753
  LDI r4, 0x25E8B7
  LDI r0, 8
  LDI r2, 92
  LINE r1, r14, r4, r0, r2
endif_1:
  CMP r2, r13
  JNZ r2, else_2
  MUL r13, r7, r3
  DIV r13, r5, r15
  OR r8, r9, r12
  JMP endif_3
else_2:
  LDI r7, 32
  LDI r9, 3786
  LDI r2, 8
  WPIXEL
  LDI r8, 255
  FILL r8
endif_3:
  CMP r2, r7
  JZ r2, else_4
  MUL r0, r5, r2
  DIV r15, r1, r13
  JMP endif_5
else_4:
  LDI r13, 128
  LDI r6, 32
  LDI r23, 1417
  LDI r2, 0x794358
  LDI r14, 2808
  RECTF r13, r6, r23, r2, r14
  LDI r6, 0xC069F8
  LDI r1, 32
  LDI r11, 0x5E37BF
  LDI r1, 0x56E6ED
  LDI r2, 0x13F702
  RECTF r6, r1, r11, r1, r2
  LDI r14, 0xBD039F
  LDI r12, 2025
  LDI r9, 0x2B94BA
  PSET r14, r12, r9
  LDI r31, 2245
  LDI r5, 8
  LDI r14, 3803
  LDI r1, 0x4D3A29
  LDI r12, 3965
  LINE r31, r5, r14, r1, r12
endif_5:
  HALT
