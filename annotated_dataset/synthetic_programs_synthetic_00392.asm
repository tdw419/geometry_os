; DESCRIPTION: This GeOS assembly code performs conditional logic to execute different geometric drawing operations based on register values. It initializes registers, compares values, and uses instructions like `MUL`, `DIV`, `WPIXEL`, `RECTF`, `LINE`, and `CIRCLE` to draw shapes and perform pixel manipulations on a display.

; conditional logic
; initialization
  LDI r5, 128
  LDI r12, 3280
  CMP r0, r11
  JZ r0, else_0
  MUL r7, r5, r0
  MUL r6, r8, r0
  JMP endif_1
else_0:
  LDI r29, 16
  LDI r6, 1345
  LDI r3, 0x78D951
  WPIXEL
  LDI r9, 32
  LDI r2, 256
  LDI r14, 1295
  WPIXEL
  LDI r8, 2372
  LDI r9, 3236
  LDI r9, 256
  LDI r3, 128
  LDI r2, 0xC2452E
  RECTF r8, r9, r9, r3, r2
  LDI r2, 0x2BAED8
  LDI r4, 3248
  LDI r4, 0xB40470
  PSETI
endif_1:
  CMP r11, r4
  JNZ r11, else_2
  DIV r0, r14, r6
  JMP endif_3
else_2:
  LDI r30, 128
  LDI r6, 0xCA4F45
  LDI r15, 1737
  LDI r2, 1558
  LDI r5, 686
  LINE r30, r6, r15, r2, r5
endif_3:
  CMP r6, r10
  JZ r6, else_4
  XOR r10, r11, r3
  SHL r2, r4, r10
  JMP endif_5
else_4:
  LDI r29, 0xF05F8F
  LDI r12, 1451
  LDI r3, 10
  WPIXEL
  LDI r11, 0x897F17
  LDI r14, 570
  LDI r12, 8
  LDI r9, 2
  CIRCLE r11, r14, r12, r9
  LDI r2, 2432
  LDI r6, 0x1B7A5A
  LDI r23, 0x77E984
  PSETI
  LDI r20, 256
  FILL r20
endif_5:
  HALT
