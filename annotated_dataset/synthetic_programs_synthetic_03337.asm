; DESCRIPTION: This GeOS assembly code initializes various registers and sets up a color palette. It then performs graphical operations including drawing pixels, circles, rectangles, and potentially filling areas with specific colors. The code includes conditional branches to handle different execution paths based on register values, performing arithmetic and logical operations as needed.

; mixed program
; initialization
  LDI r14, 0xAA50A4
  LDI r15, 32
; palette
  LDI r11, 0x6075
  LDI r6, 1
  LDI r5, 0x00AAFF
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0x0000FF
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0xAAFF00
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0xFF4400
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0x008888
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0xAAFF00
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0x00FFAA
  STORE r11, r5
  ADD r11, r11, r6
  LDI r5, 0x44FF00
  STORE r11, r5
  ADD r11, r11, r6
  CMP r12, r15
  JZ r12, else_0
  OR r11, r5, r9
  ADD r13, r26, r1
  JMP endif_1
else_0:
  LDI r22, 128
  LDI r7, 10
  LDI r2, 32
  PSET r22, r7, r2
  LDI r28, 2212
  LDI r8, 0xE74026
  LDI r9, 1
  LDI r4, 1791
  CIRCLE r28, r8, r9, r4
  LDI r11, 0xC73ACC
  LDI r1, 4
  LDI r2, 0xC61A79
  LDI r9, 3148
  LDI r0, 3204
  RECTF r11, r1, r2, r9, r0
  LDI r11, 3507
  LDI r2, 1912
  LDI r8, 0x1C5049
  WPIXEL
endif_1:
  LDI r5, 0x207FCA
  LDI r4, 128
  LDI r10, 2
  PSETI
  PUSH r6
  SUB r13, r3, r5
  MOD r2, r23, r13
  MOD r1, r10, r2
  ADD r12, r15, r1
  POP r6
  CMP r5, r2
  JNZ r5, else_2
  DIV r7, r5, r6
  MOD r3, r0, r5
  XOR r14, r13, r12
  SHR r7, r0, r3
  JMP endif_3
else_2:
  LDI r7, 255
  LDI r12, 128
  LDI r11, 16
  PSETI
  LDI r1, 2479
  LDI r2, 3825
  LDI r0, 16
  LDI r5, 10
  LDI r16, 0x6D4150
  RECTF r1, r2, r0, r5, r16
  LDI r15, 0xF6F0F8
  LDI r9, 0xACE074
  LDI r6, 0x6BFC2F
  WPIXEL
endif_3:
  LDI r11, 0
loop_4:
  MOD r8, r3, r5
  ADD r14, r2, r9
  LDI r15, 1
  SUB r11, r11, r15
  JNZ r11, loop_4
  AND r2, r16, r8
  OR r2, r7, r14
  CMP r8, r1
  JZ r8, else_5
  ADD r10, r6, r11
  JMP endif_6
else_5:
  LDI r4, 0x1471C9
  LDI r10, 8
  LDI r12, 0x53E5EB
  LDI r1, 0xBFBAB4
  LDI r5, 2172
  RECTF r4, r10, r12, r1, r5
  LDI r14, 256
  FILL r14
  LDI r13, 4
  LDI r22, 64
  LDI r12, 2200
  WPIXEL
endif_6:
  CMP r1, r5
  HALT
