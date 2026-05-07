; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette for drawing. It then enters a loop where it performs bitwise operations on registers, checks input conditions, and potentially updates the display frame based on those conditions.

; drawing loop program
; initialization
  LDI r0, 0xB33416
  LDI r25, 3607
  LDI r4, 2
; palette
  LDI r5, 0x60FF
  LDI r15, 1
  LDI r11, 0xAAAAAA
  STORE r5, r11
  ADD r5, r5, r15
  LDI r11, 0xFFFF00
  STORE r5, r11
  ADD r5, r5, r15
  LDI r11, 0x44FF00
  STORE r5, r11
  ADD r5, r5, r15
  LDI r11, 0x44FF00
  STORE r5, r11
  ADD r5, r5, r15
  LDI r11, 0x0000CC
  STORE r5, r11
  ADD r5, r5, r15
  LDI r11, 0xFF00FF
  STORE r5, r11
  ADD r5, r5, r15
main_0:
  OR r0, r8, r7
  XOR r13, r9, r8
  AND r7, r12, r11
  AND r2, r13, r12
  CMPI r7, 115
  IKEY r0
  CMPI r0, 28
  JNZ r0, key_1
  FRAME
  JMP main_0
