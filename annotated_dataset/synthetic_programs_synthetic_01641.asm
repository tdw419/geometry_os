; DESCRIPTION: The GeOS assembly code initializes registers with specific values, sets up a color palette, and enters an infinite loop where it draws text "HELLO" at coordinates (786, 4), sets a pixel at (128, 5C8314), performs bitwise operations, and updates the display frame.

; drawing loop program
; initialization
  LDI r4, 0x3A6194
  LDI r15, 255
  LDI r12, 0x00BB63
  LDI r5, 0x22BCA8
  LDI r7, 3098
; palette
  LDI r8, 0x235E
  LDI r0, 1
  LDI r7, 0xFF4400
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0xAAAAAA
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0xFFAA00
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0x444444
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0x44FF00
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0x008888
  STORE r8, r7
  ADD r8, r8, r0
  LDI r7, 0xDD0044
  STORE r8, r7
  ADD r8, r8, r0
main_0:
  LDI r13, 786
  LDI r8, 4
  LDI r11, 3846
  TEXT r13, r8, r11, "HELLO"
  XOR r20, r14, r15
  OR r3, r6, r8
  AND r11, r8, r1
  LDI r3, 0x5C8314
  LDI r11, 0xFDDD97
  LDI r1, 128
  WPIXEL
  SHR r17, r12, r13
  LDI r10, 3337
  LDI r12, 0
  LDI r12, 1885
  PSETI
  CMP r7, r10
  FRAME
  JMP main_0
