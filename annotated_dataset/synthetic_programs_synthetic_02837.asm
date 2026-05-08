; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, and then enters a loop where it draws circles and performs logical operations. The program halts after completing the specified iterations and conditions.

; mixed program
; initialization
  LDI r9, 1828
  LDI r14, 0xECA334
  LDI r8, 0xD45999
  LDI r28, 1142
  LDI r12, 1534
  LDI r10, 0xF8C175
  LDI r4, 0xC1E969
; palette
  LDI r13, 0x21B1
  LDI r6, 1
  LDI r9, 0xFFEE00
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x550077
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x00FFAA
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0xFF8800
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x00FF00
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0xFFEE00
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x8800FF
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x0000CC
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0xFF4400
  STORE r13, r9
  ADD r13, r13, r6
  LDI r9, 0x44FF00
  STORE r13, r9
  ADD r13, r13, r6
  MOD r14, r15, r1
  LDI r7, 18
loop_0:
  CMPI r8, r2, 0x5454FD
  LDI r8, 3483
  LDI r10, 0x5BE8C8
  LDI r25, 427
  LDI r8, 3503
  CIRCLE r8, r10, r25, r8
  ANDI r9, r7, 0x8E0334
  ADDI r2, r4, 10
  LDI r1, 1
  SUB r7, r7, r1
  JNZ r7, loop_0
  CMP r9, r11
  JZ r9, else_1
  AND r7, r11, r16
  JMP endif_2
else_1:
  LDI r14, 8
  LDI r25, 2679
  LDI r4, 16
  LDI r12, 10
  LDI r4, 0
  RECTF r14, r25, r4, r12, r4
  LDI r1, 4
  LDI r8, 2955
  LDI r8, 1110
  WPIXEL
endif_2:
  HALT
