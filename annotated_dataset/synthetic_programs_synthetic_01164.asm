; DESCRIPTION: This GeOS assembly code initializes a drawing loop, sets up a color palette, and continuously draws the text "WORLD" at specific coordinates on the screen. It checks for key input and updates the display frame if the key '8' is pressed, then loops back to continue the process.

; drawing loop program
; initialization
  LDI r1, 1261
  LDI r15, 337
  LDI r13, 0x0C696F
  LDI r6, 0
  LDI r10, 1511
  LDI r3, 1
; palette
  LDI r28, 0x70C6
  LDI r8, 1
  LDI r13, 0xFF8800
  STORE r28, r13
  ADD r28, r28, r8
  LDI r13, 0x550077
  STORE r28, r13
  ADD r28, r28, r8
  LDI r13, 0x000066
  STORE r28, r13
  ADD r28, r28, r8
  LDI r13, 0x00FFFF
  STORE r28, r13
  ADD r28, r28, r8
  LDI r13, 0x550077
  STORE r28, r13
  ADD r28, r28, r8
main_0:
  CMPI r6, 121
  AND r30, r12, r6
  LDI r12, 0x16A2CB
  LDI r9, 16
  LDI r7, 1610
  DRAWTEXT r12, r9, r7, "WORLD"
  LDI r7, 0x2BBA36
  LDI r0, 3395
  LDI r15, 3352
  DRAWTEXT r7, r0, r15, "WORLD"
  SHLI r15, r7, 5
  SHL r20, r5, r7
  SHL r4, r11, r1
  SHR r15, r13, r4
  IKEY r13
  CMPI r13, 8
  JNZ r13, key_1
  FRAME
  JMP main_0
