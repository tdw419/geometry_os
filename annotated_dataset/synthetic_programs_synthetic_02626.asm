; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then displays the text "HELLO" at a specific location and enters a loop where it repeatedly draws the text "WORLD" with varying colors, handling keyboard input to modify values, and updates the display continuously.

; mixed program
; initialization
  LDI r4, 1215
  LDI r15, 2
  LDI r3, 0xAA5177
; palette
  LDI r14, 0x3041
  LDI r7, 1
  LDI r12, 0x00FFAA
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0xAAAAAA
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0x000066
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0xFF4400
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0x00FFAA
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0x000066
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0x000000
  STORE r14, r12
  ADD r14, r14, r7
  LDI r12, 0xAAFF00
  STORE r14, r12
  ADD r14, r14, r7
  LDI r2, 0x30A94E
  LDI r1, 0x3B5AF2
  LDI r8, 504
  TEXT r2, r1, r8, "HELLO"
  LDI r3, 0x94C1AA
  STORE r3, r4
  LOAD r11, r3
  LDI r2, 256
  STORE r2, r2
  LOAD r5, r2
  LDI r7, 10
  LDI r0, 256
  LDI r4, 10
  DRAWTEXT r7, r0, r4, "WORLD"
  CMP r7, r10
  AND r14, r2, r10
  IKEY r10
  CMPI r10, 228
  JNZ r10, key_0
  XOR r4, r3, r10
  XOR r9, r1, r13
main_1:
  ANDI r2, r14, 145
  LDI r7, 0xCBFD91
  LDI r5, 0
  LDI r2, 1436
  DRAWTEXT r7, r5, r2, "WORLD"
  FRAME
  JMP main_1
