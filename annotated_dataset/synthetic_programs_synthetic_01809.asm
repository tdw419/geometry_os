; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette, draws text "HELLO" and a circle on the screen, and then continuously displays the text "WORLD" in a loop. The program uses conditional jumps to alter execution paths based on register comparisons.

; mixed program
; initialization
  LDI r15, 0x05DC7A
  LDI r1, 64
  LDI r21, 0x426254
  LDI r13, 16
  LDI r6, 0x1B4357
  LDI r4, 0x62DB4F
  LDI r12, 1664
; palette
  LDI r18, 0x2172
  LDI r1, 1
  LDI r4, 0x00FF44
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x444444
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x880088
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0xAA00AA
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x880088
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0xFFFF00
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x00FFFF
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0xDD0044
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x0044FF
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x0000CC
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0xAAAAAA
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0xFF0000
  STORE r18, r4
  ADD r18, r18, r1
  LDI r4, 0x0000CC
  STORE r18, r4
  ADD r18, r18, r1
  LDI r15, 0xCF967E
  LDI r7, 0xFB512F
  LDI r4, 0xB86F66
  TEXT r15, r7, r4, "HELLO"
  LDI r12, 256
  LDI r13, 0xA96886
  LDI r8, 0xB462E8
  LDI r12, 1246
  CIRCLE r12, r13, r8, r12
  CMP r5, r3
  JZ r5, else_0
  XOR r8, r13, r12
  AND r0, r9, r15
  OR r3, r13, r8
  JMP endif_1
else_0:
  LDI r7, 0x73A1CC
  LDI r2, 3085
  LDI r21, 256
  PSETI
  LDI r7, 16
  LDI r14, 0xA19241
  LDI r5, 710
  WPIXEL
  LDI r11, 0x47813B
  FILL r11
  LDI r3, 929
  LDI r5, 10
  LDI r15, 1412
  WPIXEL
endif_1:
main_2:
  LDI r12, 0x0F333B
  LDI r1, 1388
  LDI r0, 255
  DRAWTEXT r12, r1, r0, "WORLD"
  CMPI r0, 0x5EB8BE
  FRAME
  JMP main_2
