; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette by storing various RGB color codes into memory locations. It then performs a series of bitwise operations on these registers before halting execution.

; mixed program
; initialization
  LDI r12, 1
  LDI r9, 10
  LDI r1, 32
  LDI r5, 64
  LDI r7, 3509
  LDI r13, 0
  LDI r14, 16
  LDI r3, 256
; palette
  LDI r15, 0x60E7
  LDI r8, 1
  LDI r0, 0xAAFF00
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x00AAFF
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x444444
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x008888
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0xFF00FF
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x00AAFF
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0xDD0044
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x008888
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0xFFEE00
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x44FF00
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0xAA00AA
  STORE r15, r0
  ADD r15, r15, r8
  LDI r0, 0x550077
  STORE r15, r0
  ADD r15, r15, r8
  SHR r6, r5, r15
  SHLI r10, r9, 1
  SHLI r13, r2, 256
  OR r5, r2, r0
  OR r5, r2, r4
  SAR r22, r7, r14
  SHL r9, r5, r6
  SHR r18, r7, r25
  SHL r11, r13, r12
  HALT
