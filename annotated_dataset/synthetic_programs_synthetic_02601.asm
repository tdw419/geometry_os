; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on the comparison of register values. It includes operations such as subtraction, division, bitwise OR, AND, shifting, drawing rectangles (`RECTF`), lines (`LINE`), circles (`CIRCLE`), setting pixels (`WPIXEL`, `PSET`), and halting execution (`HALT`).

; conditional logic
; initialization
  LDI r2, 436
  LDI r6, 1138
  LDI r9, 3123
  LDI r13, 1
  CMP r1, r7
  JZ r1, else_0
  SUB r12, r27, r2
  OR r20, r4, r7
  DIV r7, r8, r5
  SUB r8, r0, r2
  JMP endif_1
else_0:
  LDI r1, 2
  LDI r3, 1948
  LDI r0, 2
  LDI r11, 16
  LDI r5, 4
  RECTF r1, r3, r0, r11, r5
  LDI r0, 3986
  LDI r7, 3382
  LDI r4, 0x42A304
  LDI r5, 16
  LDI r5, 1885
  LINE r0, r7, r4, r5, r5
  LDI r15, 2644
  LDI r1, 4
  LDI r12, 1331
  WPIXEL
endif_1:
  CMP r14, r7
  JZ r14, else_2
  OR r2, r10, r11
  ADD r0, r5, r13
  JMP endif_3
else_2:
  LDI r0, 510
  LDI r9, 2821
  LDI r13, 0
  WPIXEL
  LDI r6, 1354
  LDI r3, 256
  LDI r8, 0xC59E8B
  LDI r12, 0x1D68EE
  CIRCLE r6, r3, r8, r12
  LDI r12, 0x8F5A1A
  LDI r11, 1014
  LDI r6, 3558
  LDI r2, 256
  LDI r7, 0xFC4338
  LINE r12, r11, r6, r2, r7
  LDI r15, 0x5A0FA1
  LDI r4, 0xC0B229
  LDI r13, 1
  LDI r13, 16
  LDI r7, 10
  RECTF r15, r4, r13, r13, r7
endif_3:
  CMP r14, r9
  JNZ r14, else_4
  AND r7, r15, r2
  ADD r11, r7, r8
  SHR r2, r8, r6
  ADD r7, r9, r15
  JMP endif_5
else_4:
  LDI r7, 0xA9DF4B
  LDI r13, 0x676F6C
  LDI r15, 836
  PSET r7, r13, r15
  LDI r10, 4033
  LDI r13, 1745
  LDI r5, 817
  PSET r10, r13, r5
  LDI r7, 255
  LDI r12, 0x3F2E61
  LDI r3, 2543
  PSET r7, r12, r3
endif_5:
  HALT
