; DESCRIPTION: This GeOS assembly code initializes a drawing loop with a palette of 16 colors and draws a rectangle on the screen. It continuously checks for key presses and updates the frame if a specific key (with ASCII value 35) is pressed.

; drawing loop program
; initialization
  LDI r12, 10
  LDI r11, 1573
; palette
  LDI r2, 0x2135
  LDI r12, 1
  LDI r1, 0x0000FF
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xAAAAAA
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xFF00FF
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0x00FFAA
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0x00FFFF
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0x000066
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xFF0000
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xFFEE00
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0x00AAFF
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xAAFF00
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0x550077
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xAAFF00
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xFF0000
  STORE r2, r1
  ADD r2, r2, r12
  LDI r1, 0xAAAAAA
  STORE r2, r1
  ADD r2, r2, r12
main_0:
  LDI r31, 16
  LDI r0, 0x20ADAC
  LDI r10, 0x427FA8
  LDI r1, 1216
  LDI r2, 0x8F7118
  RECTF r31, r0, r10, r1, r2
  IKEY r5
  CMPI r5, 35
  JNZ r5, key_1
  MOD r15, r9, r13
  FRAME
  JMP main_0
