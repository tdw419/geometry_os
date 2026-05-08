; DESCRIPTION: This GeOS assembly code performs a series of conditional operations and geometric drawing commands. It initializes several registers with specific values, compares register contents to make decisions, and executes drawing routines like circles and lines based on the comparison results. The code concludes by halting execution.

; conditional logic
; initialization
  LDI r2, 0x5362DE
  LDI r13, 0x44323B
  LDI r15, 3146
  LDI r22, 0x1F38B5
  CMP r12, r14
  JZ r12, else_0
  SUB r13, r4, r3
  SHR r30, r2, r11
  JMP endif_1
else_0:
  LDI r11, 255
  LDI r14, 128
  LDI r14, 0xF771E0
  LDI r6, 1
  CIRCLE r11, r14, r14, r6
  LDI r5, 3610
  LDI r6, 256
  LDI r10, 2437
  LDI r6, 0xB2E71B
  LDI r0, 2812
  LINE r5, r6, r10, r6, r0
  LDI r4, 2911
  LDI r2, 4
  LDI r10, 256
  WPIXEL
  LDI r3, 0x63D9BA
  LDI r12, 3880
  LDI r7, 1079
  LDI r6, 0x1D3F12
  LDI r12, 32
  LINE r3, r12, r7, r6, r12
endif_1:
  CMP r10, r13
  JZ r10, else_2
  ADD r8, r10, r2
  MOD r8, r5, r3
  XOR r28, r5, r11
  MUL r15, r0, r9
  JMP endif_3
else_2:
  LDI r3, 3083
  LDI r6, 3119
  LDI r2, 0xFF52C2
  LDI r15, 32
  LDI r8, 0xBA2DCF
  LINE r3, r6, r2, r15, r8
  LDI r7, 380
  LDI r12, 2
  LDI r10, 2040
  LDI r3, 0xCC0E32
  LDI r1, 64
  LINE r7, r12, r10, r3, r1
endif_3:
  CMP r9, r3
  JZ r9, else_4
  DIV r4, r13, r5
  AND r2, r1, r13
  JMP endif_5
else_4:
  LDI r15, 1090
  LDI r14, 4
  LDI r2, 0x55CF73
  LDI r11, 3445
  LDI r0, 0xD08588
  RECTF r15, r14, r2, r11, r0
  LDI r2, 674
  LDI r7, 256
  LDI r3, 32
  LDI r14, 0xFFDCF5
  CIRCLE r2, r7, r3, r14
  LDI r4, 0xF87851
  LDI r26, 2958
  LDI r3, 1351
  LDI r25, 16
  CIRCLE r4, r26, r3, r25
  LDI r22, 32
  LDI r14, 0x915A95
  LDI r4, 0x8B250F
  PSET r22, r14, r4
endif_5:
  HALT
