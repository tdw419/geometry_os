; DESCRIPTION: This GeOS assembly code initializes registers for a drawing loop and sets up a color palette. It then enters a main loop where it checks for key inputs to display the text "HELLO" on the screen and performs various bitwise operations, including shifts and frame updates.

; drawing loop program
; initialization
  LDI r15, 10
  LDI r6, 255
  LDI r8, 0
  LDI r7, 255
  LDI r16, 8
  LDI r0, 2126
  LDI r10, 0xAFFEAC
; palette
  LDI r9, 0x21F4
  LDI r3, 1
  LDI r8, 0x550077
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x0044FF
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xFF8800
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x00FF00
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xFF0000
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x0000CC
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x00FFAA
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x0000CC
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xFF8800
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xFFFF00
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xFFEE00
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0x00AAFF
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xAA00AA
  STORE r9, r8
  ADD r9, r9, r3
  LDI r8, 0xAAAAAA
  STORE r9, r8
  ADD r9, r9, r3
main_0:
  IKEY r9
  CMPI r9, 10
  JNZ r9, key_1
  IKEY r0
  CMPI r0, 5
  JNZ r0, key_2
  LDI r14, 2414
  LDI r11, 4
  LDI r1, 0xA3E760
  TEXT r14, r11, r1, "HELLO"
  SUBI r6, r12, 10
  SAR r6, r2, r4
  SHR r8, r5, r15
  SHLI r11, r7, 64
  FRAME
  JMP main_0
