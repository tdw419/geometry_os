; DESCRIPTION: This GeOS assembly code initializes system registers and sets up a color palette. It then checks for key inputs to display text and manipulate colors or data, finally halting execution if certain conditions are met.

; mixed program
; initialization
  LDI r10, 64
  LDI r5, 0
  LDI r1, 975
  LDI r4, 128
; palette
  LDI r2, 0x2408
  LDI r12, 1
  LDI r10, 0xAAFF00
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0xFFEE00
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0x8800FF
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0xFF00FF
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0x008888
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0x44FF00
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r12
  LDI r10, 0xFF4400
  STORE r2, r10
  ADD r2, r2, r12
  IKEY r5
  CMPI r5, 80
  JNZ r5, key_0
  LDI r14, 0xBF78F6
  LDI r9, 8
  LDI r1, 0x6AB1F8
  DRAWTEXT r14, r9, r1, "WORLD"
  OR r7, r10, r6
  XOR r1, r10, r2
  IKEY r12
  CMPI r12, 180
  JNZ r12, key_1
  CMPI r9, 0xD62A84
  LDI r12, 0xF44144
  STORE r12, r0
  LOAD r9, r12
  LDI r30, 4
  STORE r30, r15
  LOAD r14, r30
  LDI r13, 1284
  STORE r13, r24
  LOAD r9, r13
  HALT
