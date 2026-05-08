; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a palette of colors. It then enters a loop where it checks for key presses, performs bitwise operations based on those inputs, and updates the frame accordingly. The code continuously loops back to check for further input and update the display.

; drawing loop program
; initialization
  LDI r1, 3754
  LDI r12, 64
  LDI r13, 0x1B1F60
  LDI r0, 0xA796C5
  LDI r7, 0x51E2C7
  LDI r4, 0x3B0DFF
  LDI r9, 0xABC7A8
  LDI r3, 2
; palette
  LDI r9, 0x22E2
  LDI r6, 1
  LDI r0, 0x0000FF
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0xFF0000
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0xAAAAAA
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0x0044FF
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0xFF0000
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0xFFEE00
  STORE r9, r0
  ADD r9, r9, r6
  LDI r0, 0x00FFFF
  STORE r9, r0
  ADD r9, r9, r6
main_0:
  IKEY r7
  CMPI r7, 0x77321D
  JNZ r7, key_1
  IKEY r14
  CMPI r14, 40
  JNZ r14, key_2
  IKEY r7
  CMPI r7, 0x90B48F
  JNZ r7, key_3
  AND r14, r10, r13
  OR r2, r15, r9
  XOR r18, r10, r5
  OR r3, r9, r14
  CMPI r1, r14, 78
  FRAME
  JMP main_0
