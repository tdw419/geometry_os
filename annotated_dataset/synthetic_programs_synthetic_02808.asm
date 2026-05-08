; DESCRIPTION: This GeOS assembly code performs conditional logic operations and geometric drawing commands. It initializes several registers with specific values, compares register values to determine execution paths, and executes drawing functions such as rectangles, pixels, circles, and lines based on the conditions met.

; conditional logic
; initialization
  LDI r4, 0xC807C3
  LDI r11, 0
  LDI r9, 0xB2D80B
  LDI r7, 64
  LDI r5, 954
  LDI r14, 313
  CMP r6, r4
  JZ r6, else_0
  MOD r1, r10, r11
  DIV r5, r13, r4
  JMP endif_1
else_0:
  LDI r0, 2990
  LDI r6, 0xC8E20E
  LDI r14, 1443
  LDI r13, 1036
  LDI r1, 0x713278
  RECTF r0, r6, r14, r13, r1
  LDI r3, 0x70A6B3
  LDI r1, 0
  LDI r10, 256
  PSET r3, r1, r10
  LDI r16, 320
  LDI r10, 0xEF8C71
  LDI r5, 0x0CC291
  PSET r16, r10, r5
  LDI r0, 0x3BF2FF
  LDI r4, 16
  LDI r8, 0xD0D0F4
  LDI r1, 1008
  CIRCLE r0, r4, r8, r1
endif_1:
  CMP r10, r11
  JZ r10, else_2
  SHR r15, r3, r9
  MOD r2, r11, r4
  XOR r11, r10, r13
  MUL r1, r2, r0
  JMP endif_3
else_2:
  LDI r15, 4068
  LDI r2, 103
  LDI r3, 0x7E05B1
  LDI r5, 255
  LDI r15, 0x30ACFD
  LINE r15, r2, r3, r5, r15
  LDI r3, 0x1B623B
  LDI r8, 2167
  LDI r0, 0x02B6A9
  PSET r3, r8, r0
endif_3:
  HALT
