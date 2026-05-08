; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a loop where it checks for key input, performs calculations involving register operations, and displays the text "HELLO" on the screen using the specified colors and positions. The loop continues indefinitely, updating the display based on input and calculated values.

; drawing loop program
; initialization
  LDI r3, 0xF9D65E
  LDI r2, 32
  LDI r1, 1188
  LDI r0, 3650
  LDI r5, 323
  LDI r14, 1819
  LDI r9, 64
  LDI r10, 4
; palette
  LDI r11, 0x2272
  LDI r14, 1
  LDI r8, 0x00FFAA
  STORE r11, r8
  ADD r11, r11, r14
  LDI r8, 0x0000CC
  STORE r11, r8
  ADD r11, r11, r14
  LDI r8, 0x880088
  STORE r11, r8
  ADD r11, r11, r14
  LDI r8, 0xFFFF00
  STORE r11, r8
  ADD r11, r11, r14
  LDI r8, 0x444444
  STORE r11, r8
  ADD r11, r11, r14
  LDI r8, 0x000066
  STORE r11, r8
  ADD r11, r11, r14
main_0:
  IKEY r10
  CMPI r10, 256
  JNZ r10, key_1
  MUL r2, r15, r5
  OR r8, r7, r15
  LDI r10, 256
  LDI r2, 0x3BDCB7
  LDI r6, 0x6F5AB5
  TEXT r10, r2, r6, "HELLO"
  SHLI r9, r8, 1
  SHR r5, r15, r0
  FRAME
  JMP main_0
