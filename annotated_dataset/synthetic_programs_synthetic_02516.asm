; DESCRIPTION: The GeOS assembly code initializes a palette of colors and then enters a loop where it draws a line, sets a pixel, compares input values, displays text, and handles specific key inputs. The loop continues indefinitely until interrupted or terminated.

; drawing loop program
; initialization
  LDI r12, 404
  LDI r0, 255
; palette
  LDI r14, 0x60A0
  LDI r6, 1
  LDI r3, 0x000000
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0xFF4400
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0xFFAA00
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0x444444
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0x0000FF
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0xFFFFFF
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0x00FF44
  STORE r14, r3
  ADD r14, r14, r6
  LDI r3, 0x8800FF
  STORE r14, r3
  ADD r14, r14, r6
main_0:
  LDI r15, 32
  LDI r11, 0xEB5DF9
  LDI r13, 64
  LDI r5, 1599
  LDI r14, 2473
  LINE r15, r11, r13, r5, r14
  LDI r15, 2070
  LDI r2, 32
  LDI r14, 32
  PSETI
  CMPI r4, r8, 184
  LDI r0, 3408
  LDI r2, 8
  LDI r15, 38
  TEXT r0, r2, r15, "HELLO"
  IKEY r7
  CMPI r7, 0x9DF355
  JNZ r7, key_1
  SAR r12, r11, r22
  SHLI r7, r11, 0xCD4358
  SHL r1, r14, r3
  FRAME
  JMP main_0
