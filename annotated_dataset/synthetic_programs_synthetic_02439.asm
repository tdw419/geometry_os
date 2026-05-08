; DESCRIPTION: This GeOS assembly code initializes a drawing environment by setting up a color palette and then enters a loop where it waits for specific key inputs to draw shapes on the screen. If certain keys are pressed, it draws circles or updates the frame.

; drawing loop program
; initialization
  LDI r12, 32
  LDI r16, 0xC23167
; palette
  LDI r14, 0x7047
  LDI r8, 1
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x008888
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x00AAFF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xFF00FF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xFFFFFF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x000000
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x550077
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xAAAAAA
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xAA00AA
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x888800
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xFF4400
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x550077
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0xFFFFFF
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x44FF00
  STORE r14, r6
  ADD r14, r14, r8
  LDI r6, 0x44FF00
  STORE r14, r6
  ADD r14, r14, r8
main_0:
  SUBI r0, r7, 0xFD4E16
  AND r5, r15, r11
  IKEY r1
  CMPI r1, 0xCB198C
  JNZ r1, key_1
  LDI r15, 22
  LDI r10, 0
  LDI r14, 878
  LDI r4, 3707
  CIRCLE r15, r10, r14, r4
  IKEY r11
  CMPI r11, 194
  JNZ r11, key_2
  CMP r6, r8
  FRAME
  JMP main_0
