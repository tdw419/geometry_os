; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette by storing RGB values at consecutive memory addresses, and enters a loop where it draws circles on the screen. The program halts after completing the circle drawing process.

; mixed program
; initialization
  LDI r15, 32
  LDI r14, 0x2C822E
  LDI r9, 255
  LDI r13, 0x03F248
  LDI r8, 1652
  LDI r5, 3250
  LDI r4, 16
; palette
  LDI r9, 0x8081
  LDI r14, 1
  LDI r26, 0xAAAAAA
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x00FF00
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x00FF44
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x00AAFF
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x550077
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x00FF44
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0xAAAAAA
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0xFF0000
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x0000FF
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x008888
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0xFFFFFF
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x550077
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x00AAFF
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0xFFAA00
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x0000CC
  STORE r9, r26
  ADD r9, r9, r14
  LDI r26, 0x0044FF
  STORE r9, r26
  ADD r9, r9, r14
  XOR r2, r3, r10
  IKEY r8
  CMPI r8, 69
  JNZ r8, key_0
  CMP r15, r8
  LDI r12, 0x34D3F8
loop_1:
  SUB r15, r1, r20
  SUBI r10, r7, 0x6D4DBC
  LDI r6, 128
  LDI r5, 0x5CA920
  LDI r11, 442
  LDI r11, 4
  CIRCLE r6, r5, r11, r11
  LDI r6, 1
  SUB r12, r12, r6
  JNZ r12, loop_1
  HALT
