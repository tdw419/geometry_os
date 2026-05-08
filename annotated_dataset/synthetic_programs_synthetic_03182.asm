; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a loop where it checks for keyboard input to trigger various operations such as drawing lines, pixels, and filling areas on the screen, using conditional branches and arithmetic operations based on input values. The program continues in an infinite loop, processing keyboard inputs to modify the display until interrupted.

; mixed program
; initialization
  LDI r15, 2067
  LDI r5, 0xEE49A0
  LDI r6, 0xD187BE
; palette
  LDI r11, 0x4072
  LDI r8, 1
  LDI r12, 0xFF8800
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x00FFAA
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x0000CC
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0xAAFF00
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x00AAFF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x44FF00
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x0000CC
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0xFF00FF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0xFFFFFF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x0044FF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x0044FF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x00FF44
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x000000
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x0000CC
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0x00FFFF
  STORE r11, r12
  ADD r11, r11, r8
  LDI r12, 0xFF8800
  STORE r11, r12
  ADD r11, r11, r8
  CMP r11, r13
  JNZ r11, else_0
  SHR r14, r8, r12
  AND r29, r13, r3
  ADD r4, r7, r13
  SUB r14, r3, r1
  JMP endif_1
else_0:
  LDI r2, 0x982B37
  LDI r7, 0x4552C2
  LDI r0, 1
  LDI r4, 1
  LDI r7, 16
  LINE r2, r7, r0, r4, r7
  LDI r11, 2
  LDI r1, 128
  LDI r2, 10
  PSET r11, r1, r2
  LDI r4, 255
  FILL r4
endif_1:
  IKEY r10
  CMPI r10, 128
  JNZ r10, key_2
  IKEY r1
  CMPI r1, 25
  JNZ r1, key_3
  CMP r6, r3
  CMP r5, r4
  JNZ r5, else_4
  MUL r8, r10, r12
  XOR r15, r11, r28
  MOD r0, r15, r2
  SUB r12, r7, r15
  JMP endif_5
else_4:
  LDI r13, 1972
  LDI r15, 3078
  LDI r3, 0
  WPIXEL
  LDI r8, 128
  LDI r10, 0x83AD2B
  LDI r0, 0x734DC2
  LDI r0, 3179
  LDI r2, 2
  LINE r8, r10, r0, r0, r2
endif_5:
  IKEY r15
  CMPI r15, 180
  JNZ r15, key_6
main_7:
  IKEY r13
  CMPI r13, 0x778FC6
  JNZ r13, key_8
  LDI r6, 3021
  FILL r6
  FRAME
  JMP main_7
