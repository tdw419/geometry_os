; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette, and performs conditional operations based on register comparisons. It includes operations like storing data in memory, loading data from registers, performing arithmetic and logical operations, and drawing lines or pixels on the screen. The code also checks for key presses and executes different branches of logic accordingly before halting execution.

; mixed program
; initialization
  LDI r11, 1
  LDI r1, 4
  LDI r5, 0x3487EF
  LDI r6, 873
; palette
  LDI r13, 0x60B5
  LDI r7, 1
  LDI r4, 0x00FF00
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0xFF8800
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0x0000FF
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0x0044FF
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0xFFFF00
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0x444444
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0x550077
  STORE r13, r4
  ADD r13, r13, r7
  LDI r4, 0x00FFFF
  STORE r13, r4
  ADD r13, r13, r7
  CMP r20, r8
  LDI r3, 10
  STORE r3, r1
  LOAD r2, r3
  LDI r11, 2
  STORE r11, r11
  LOAD r13, r11
  LDI r1, 0xC61725
  STORE r1, r10
  LOAD r14, r1
  CMP r3, r10
  JZ r3, else_0
  OR r13, r5, r0
  MUL r10, r0, r23
  ADD r13, r2, r11
  ADD r13, r12, r6
  JMP endif_1
else_0:
  LDI r19, 2378
  LDI r14, 0x3C4476
  LDI r2, 295
  LDI r2, 10
  LDI r12, 3711
  LINE r19, r14, r2, r2, r12
endif_1:
  CMP r6, r15
  JZ r6, else_2
  SHR r29, r11, r8
  DIV r12, r2, r8
  AND r12, r9, r2
  ADD r14, r1, r20
  JMP endif_3
else_2:
  LDI r1, 2708
  LDI r14, 2452
  LDI r5, 0x860356
  PSET r1, r14, r5
  LDI r10, 0x33ED6E
  LDI r13, 0x472415
  LDI r0, 880
  LDI r8, 0x3B1A41
  LDI r9, 10
  LINE r10, r13, r0, r8, r9
  LDI r11, 0x288C04
  LDI r8, 2
  LDI r28, 2086
  WPIXEL
  LDI r5, 2
  FILL r5
endif_3:
  LDI r5, 0x6C7BC8
  STORE r5, r2
  LOAD r8, r5
  LDI r7, 3278
  STORE r7, r13
  LOAD r5, r7
  LDI r3, 1355
  STORE r3, r5
  LOAD r1, r3
  LDI r15, 0x0419F1
  STORE r15, r11
  LOAD r3, r15
  IKEY r2
  CMPI r2, 0xAEE325
  JNZ r2, key_4
  IKEY r3
  CMPI r3, 10
  JNZ r3, key_5
  CMP r15, r12
  JZ r15, else_6
  AND r11, r5, r6
  AND r4, r3, r7
  JMP endif_7
else_6:
  LDI r5, 16
  FILL r5
  LDI r8, 4
  LDI r3, 1857
  LDI r9, 0xD312C6
  PSET r8, r3, r9
endif_7:
  HALT
