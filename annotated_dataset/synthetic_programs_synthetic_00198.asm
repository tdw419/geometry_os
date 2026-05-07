; DESCRIPTION: This GeOS assembly code performs conditional logic based on the comparison of registers. If register `r8` equals `r15`, it executes arithmetic operations and a division, then proceeds to draw a pixel using `PSETI`. Otherwise, it draws a circle and fills a rectangle with specific colors. The execution flow is controlled by jumps (`JMP`, `JZ`) and conditional checks (`CMP`).

; conditional logic
; initialization
  LDI r14, 1910
  LDI r15, 4
  LDI r13, 3696
  CMP r15, r8
  JNZ r15, else_0
  SUB r9, r1, r14
  DIV r2, r28, r10
  MOD r1, r11, r9
  JMP endif_1
else_0:
  LDI r3, 0xF7DE28
  LDI r31, 2965
  LDI r11, 64
  LDI r14, 0xC65971
  CIRCLE r3, r31, r11, r14
  LDI r9, 255
  LDI r6, 2112
  LDI r28, 16
  PSETI
  LDI r12, 1490
  FILL r12
  LDI r29, 0x43B1EA
  LDI r15, 0xE2BE74
  LDI r14, 0
  WPIXEL
endif_1:
  CMP r6, r13
  JZ r6, else_2
  AND r5, r14, r2
  ADD r7, r19, r13
  JMP endif_3
else_2:
  LDI r1, 1375
  LDI r5, 0x7BD499
  LDI r4, 0x75A669
  LDI r12, 0xCD61A4
  LDI r0, 3095
  RECTF r1, r5, r4, r12, r0
  LDI r24, 18
  LDI r11, 32
  LDI r12, 8
  LDI r10, 0x18DCE0
  LDI r12, 64
  LINE r24, r11, r12, r10, r12
endif_3:
  HALT
