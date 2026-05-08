; DESCRIPTION: This GeOS assembly code initializes graphics settings and a color palette, then enters an infinite loop where it performs calculations and draws text on the screen. The loop continuously divides values, shifts bits, compares registers, and calls functions to display "HELLO" at specific coordinates with a given color.

; drawing loop program
; initialization
  LDI r10, 0x1966C7
  LDI r13, 1191
  LDI r4, 8
  LDI r5, 8
  LDI r1, 8
  LDI r2, 16
  LDI r25, 1605
  LDI r8, 0xAB644C
; palette
  LDI r14, 0x22F5
  LDI r12, 1
  LDI r11, 0xFF0000
  STORE r14, r11
  ADD r14, r14, r12
  LDI r11, 0xFFAA00
  STORE r14, r11
  ADD r14, r14, r12
  LDI r11, 0xFFFF00
  STORE r14, r11
  ADD r14, r14, r12
  LDI r11, 0x880088
  STORE r14, r11
  ADD r14, r14, r12
  LDI r11, 0x00FF00
  STORE r14, r11
  ADD r14, r14, r12
  LDI r11, 0xDD0044
  STORE r14, r11
  ADD r14, r14, r12
main_0:
  DIV r5, r12, r8
  CMPI r8, 55
  SHLI r15, r8, 7
  SHL r12, r14, r7
  SHLI r5, r10, 7
  SHL r1, r0, r13
  ADDI r7, r3, 152
  CMP r6, r7
  LDI r5, 256
  LDI r7, 128
  LDI r4, 0xEBC3B2
  TEXT r5, r7, r4, "HELLO"
  FRAME
  JMP main_0
