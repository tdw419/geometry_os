; DESCRIPTION: This GeOS assembly code initializes drawing parameters and a color palette, then enters a loop where it checks for specific input keys to perform actions like filling a frame with a color. The program continuously waits for key presses and reacts based on the key values to draw or update the display.

; drawing loop program
; initialization
  LDI r14, 2992
  LDI r12, 10
  LDI r1, 0x34710B
  LDI r0, 0x9CA98C
  LDI r10, 256
  LDI r13, 1670
  LDI r11, 184
; palette
  LDI r5, 0x7007
  LDI r4, 1
  LDI r8, 0xFFAA00
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x44FF00
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0xFF00FF
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x00FF44
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x0000FF
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0xAA00AA
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x0000CC
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x550077
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x444444
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0xDD0044
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x000000
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0xAA00AA
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x000000
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x00FFAA
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0x550077
  STORE r5, r8
  ADD r5, r5, r4
  LDI r8, 0xAAAAAA
  STORE r5, r8
  ADD r5, r5, r4
main_0:
  AND r7, r8, r4
  OR r12, r14, r8
  LDI r8, 223
  FILL r8
  IKEY r10
  CMPI r10, 0xE3B0B3
  JNZ r10, key_1
  IKEY r13
  CMPI r13, 1
  JNZ r13, key_2
  CMP r6, r3
  FRAME
  JMP main_0
