; DESCRIPTION: This GeOS assembly code performs a series of conditional operations and geometric drawing functions based on the values of registers. It initializes several registers with specific values, compares register contents to execute different branches of logic, and uses commands like `RECTF` for rectangles, `CIRCLE` for circles, and `PSETI` for pixel setting. The code ultimately halts execution after completing its operations.

; conditional logic
; initialization
  LDI r3, 1436
  LDI r19, 0xBDE12C
  LDI r4, 4
  CMP r12, r1
  JZ r12, else_0
  ADD r2, r6, r11
  ADD r11, r8, r7
  SUB r15, r10, r3
  SHL r7, r16, r9
  JMP endif_1
else_0:
  LDI r9, 1
  LDI r2, 0x200565
  LDI r12, 0x88876A
  LDI r10, 3966
  LDI r11, 64
  RECTF r9, r2, r12, r10, r11
  LDI r12, 0x6E9CF2
  LDI r15, 4
  LDI r9, 0x068984
  LDI r0, 4
  LDI r9, 0x276BB6
  RECTF r12, r15, r9, r0, r9
  LDI r12, 0x9A915F
  LDI r29, 0xA8C8F2
  LDI r12, 3623
  LDI r5, 3232
  CIRCLE r12, r29, r12, r5
endif_1:
  CMP r13, r14
  JZ r13, else_2
  ADD r1, r11, r14
  SUB r5, r3, r10
  MUL r7, r12, r9
  JMP endif_3
else_2:
  LDI r11, 32
  LDI r9, 16
  LDI r9, 2606
  PSETI
  LDI r11, 0x6D7EBF
  FILL r11
  LDI r9, 10
  LDI r12, 2993
  LDI r10, 3605
  WPIXEL
  LDI r10, 2993
  LDI r0, 0x7E9A4F
  LDI r14, 115
  LDI r9, 1
  LDI r3, 1527
  RECTF r10, r0, r14, r9, r3
endif_3:
  CMP r10, r1
  JNZ r10, else_4
  MOD r31, r3, r2
  OR r14, r3, r6
  MUL r10, r3, r15
  SHR r6, r15, r8
  JMP endif_5
else_4:
  LDI r9, 256
  LDI r1, 0x04A026
  LDI r15, 1
  PSETI
  LDI r0, 2528
  LDI r13, 3699
  LDI r13, 0x85E981
  LDI r27, 2
  LDI r11, 2
  RECTF r0, r13, r13, r27, r11
  LDI r2, 256
  LDI r14, 0
  LDI r11, 0xEE46F4
  LDI r2, 8
  LDI r11, 1956
  RECTF r2, r14, r11, r2, r11
  LDI r7, 4
  LDI r11, 3982
  LDI r6, 10
  LDI r13, 8
  LDI r2, 255
  RECTF r7, r11, r6, r13, r2
endif_5:
  HALT
