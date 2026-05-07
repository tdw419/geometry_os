; DESCRIPTION: This GeOS assembly code initializes a palette with various colors and sets up a loop to draw pixels on the screen. It also includes logic to handle user input and display text when a specific key is pressed.

; mixed program
; initialization
  LDI r1, 1082
  LDI r12, 0xE9C642
  LDI r11, 2
; palette
  LDI r8, 0x403F
  LDI r13, 1
  LDI r2, 0x880088
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0xAAFF00
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x008888
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x888800
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x008888
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x0044FF
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x00FFAA
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0xAAFF00
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x00AAFF
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x00FF44
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x444444
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x0044FF
  STORE r8, r2
  ADD r8, r8, r13
  LDI r2, 0x00FF44
  STORE r8, r2
  ADD r8, r8, r13
  AND r13, r5, r3
  XOR r0, r12, r9
  XOR r0, r12, r7
  SUB r29, r13, r11
  LDI r20, 256
loop_0:
  ANDI r14, r3, 168
  ANDI r7, r6, 0x896216
  SUBI r5, r14, 230
  LDI r4, 1229
  LDI r10, 10
  LDI r13, 966
  PSETI
  LDI r11, 1
  SUB r20, r20, r11
  JNZ r20, loop_0
  LDI r21, 0xEBC8F1
loop_1:
  LDI r8, 2879
  LDI r8, 1728
  LDI r4, 64
  PSET r8, r8, r4
  CMPI r0, r6, 80
  DIV r3, r9, r8
  LDI r14, 1
  SUB r21, r21, r14
  JNZ r21, loop_1
main_2:
  LDI r12, 0x23BB8C
  LDI r7, 0xD99A50
  LDI r11, 0
  LDI r3, 1887
  LDI r7, 0x61C95A
  RECTF r12, r7, r11, r3, r7
  ADDI r9, r2, 85
  ANDI r1, r6, 4
  AND r2, r3, r8
  XOR r15, r6, r13
  IKEY r15
  CMPI r15, 0xA22AAD
  JNZ r15, key_3
  LDI r14, 0xDD1626
  LDI r10, 10
  LDI r6, 0x747319
  DRAWTEXT r14, r10, r6, "WORLD"
  FRAME
  JMP main_2
