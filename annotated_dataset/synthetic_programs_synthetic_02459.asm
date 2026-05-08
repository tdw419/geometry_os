; DESCRIPTION: This GeOS assembly code initializes a drawing environment with specific colors and then enters a loop where it draws lines and text on the screen. The program uses registers to manage color values, drawing coordinates, and character data, and it waits for user input before updating the frame.

; drawing loop program
; initialization
  LDI r15, 0x964581
  LDI r9, 8
  LDI r2, 3182
  LDI r0, 0xDDD39C
  LDI r5, 32
; palette
  LDI r11, 0x211D
  LDI r13, 1
  LDI r15, 0xFF0000
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0x00FFFF
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xFFFFFF
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xFFAA00
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0x0044FF
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xDD0044
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xFFAA00
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xFF8800
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0xFF8800
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0x00FFAA
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0x00FFFF
  STORE r11, r15
  ADD r11, r11, r13
  LDI r15, 0x000000
  STORE r11, r15
  ADD r11, r11, r13
main_0:
  XOR r4, r10, r0
  AND r15, r4, r6
  OR r9, r1, r7
  LDI r9, 32
  LDI r12, 0xDAEFFD
  LDI r4, 0xC2C8D7
  LDI r5, 4052
  LDI r2, 64
  LINE r9, r12, r4, r5, r2
  LDI r8, 64
  LDI r10, 2
  LDI r10, 32
  DRAWTEXT r8, r10, r10, "WORLD"
  IKEY r9
  CMPI r9, 16
  JNZ r9, key_1
  OR r6, r16, r8
  AND r0, r11, r14
  FRAME
  JMP main_0
