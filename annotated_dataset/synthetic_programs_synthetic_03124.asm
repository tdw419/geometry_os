; DESCRIPTION: This GeOS assembly code initializes a drawing loop that sets up a palette of colors and continuously draws pixels on the screen when a specific key (key code 178) is pressed. The pixel color, position, and other parameters are updated in each iteration of the loop.

; drawing loop program
; initialization
  LDI r2, 8
  LDI r14, 1
  LDI r7, 0x9949FC
  LDI r13, 602
  LDI r23, 255
  LDI r4, 0xFF92DE
; palette
  LDI r0, 0x2104
  LDI r11, 1
  LDI r6, 0x00FF44
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0x00FF00
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0x550077
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0xFF4400
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0x44FF00
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0xAA00AA
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0xFFAA00
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0xAAAAAA
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0x8800FF
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0xFF8800
  STORE r0, r6
  ADD r0, r0, r11
  LDI r6, 0x0000CC
  STORE r0, r6
  ADD r0, r0, r11
main_0:
  IKEY r4
  CMPI r4, 178
  JNZ r4, key_1
  OR r20, r9, r11
  OR r15, r2, r6
  LDI r15, 0xD429AF
  LDI r8, 645
  LDI r1, 2852
  WPIXEL
  FRAME
  JMP main_0
