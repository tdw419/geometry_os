; DESCRIPTION: This GeOS assembly code initializes system registers, sets up a color palette with various RGB values, and performs graphical operations such as plotting points, drawing rectangles, and displaying text. It also includes conditional logic for handling keyboard inputs and loops for repetitive drawing tasks. The program halts execution upon detecting a specific key press.

; mixed program
; initialization
  LDI r4, 1612
  LDI r9, 0xFCDF1C
; palette
  LDI r13, 0x6012
  LDI r15, 1
  LDI r24, 0x0000FF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xFFFF00
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x008888
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x550077
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x0044FF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x00FFFF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x0044FF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xAAAAAA
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xAAAAAA
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xFFFF00
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xAA00AA
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x0000FF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0x0044FF
  STORE r13, r24
  ADD r13, r13, r15
  LDI r24, 0xFF00FF
  STORE r13, r24
  ADD r13, r13, r15
  CMP r7, r8
  JZ r7, else_0
  SHL r16, r11, r0
  ADD r13, r8, r10
  MOD r5, r29, r10
  SHL r12, r5, r6
  JMP endif_1
else_0:
  LDI r14, 3262
  LDI r1, 64
  LDI r25, 291
  PSET r14, r1, r25
  LDI r9, 0x033879
  LDI r0, 3408
  LDI r7, 4
  LDI r8, 2487
  LDI r8, 3987
  RECTF r9, r0, r7, r8, r8
  LDI r7, 2658
  FILL r7
  LDI r15, 3908
  LDI r4, 0xB1C2BF
  LDI r1, 256
  PSETI
endif_1:
  LDI r11, 2329
  LDI r6, 1854
  LDI r2, 64
  TEXT r11, r6, r2, "HELLO"
  IKEY r8
  CMPI r8, 256
  JNZ r8, key_2
  IKEY r3
  CMPI r3, 10
  JNZ r3, key_3
  PUSH r8
  OR r0, r8, r6
  SHL r22, r13, r7
  ADD r12, r8, r3
  POP r8
  LDI r7, 17
loop_4:
  LDI r12, 1408
  LDI r3, 580
  LDI r7, 2185
  LDI r3, 458
  LDI r5, 2
  RECTF r12, r3, r7, r3, r5
  SUB r0, r10, r3
  LDI r15, 10
  FILL r15
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_4
  IKEY r5
  CMPI r5, 217
  JNZ r5, key_5
  HALT
