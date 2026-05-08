; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then enters a loop that performs arithmetic operations and conditional jumps, followed by another loop that writes pixels using the `WPIXEL` instruction and manipulates registers with bitwise operations before halting execution.

; mixed program
; initialization
  LDI r14, 64
  LDI r4, 0
  LDI r6, 0
  LDI r9, 1
  LDI r10, 0x7B8857
  LDI r15, 3912
  LDI r0, 1
; palette
  LDI r14, 0x30FE
  LDI r13, 1
  LDI r11, 0x550077
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x8800FF
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFF4400
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x008888
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x44FF00
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFF00FF
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x008888
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x880088
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFF00FF
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x0044FF
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFFAA00
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0x444444
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFF8800
  STORE r14, r11
  ADD r14, r14, r13
  LDI r11, 0xFF00FF
  STORE r14, r11
  ADD r14, r14, r13
  LDI r14, 10
loop_0:
  ADD r4, r5, r6
  ADD r7, r11, r6
  SUBI r5, r14, 1
  ADDI r14, r6, 198
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_0
  OR r10, r3, r13
  XOR r7, r11, r12
  LDI r7, 64
loop_1:
  SUBI r14, r3, 0xED6F63
  LDI r14, 16
  LDI r3, 0x7085DC
  LDI r15, 0x433B88
  WPIXEL
  AND r18, r6, r11
  LDI r6, 1
  SUB r7, r7, r6
  JNZ r7, loop_1
  SHL r14, r13, r6
  SHLI r2, r0, 0
  SHL r13, r4, r5
  SHR r30, r11, r1
  HALT
