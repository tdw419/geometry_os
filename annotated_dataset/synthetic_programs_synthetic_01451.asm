; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters an infinite loop where it performs bitwise AND operations, fills a frame with data, and draws it repeatedly.

; drawing loop program
; initialization
  LDI r7, 79
  LDI r8, 3926
  LDI r1, 3408
  LDI r5, 0x0B7A99
  LDI r14, 64
  LDI r12, 3114
  LDI r4, 16
  LDI r0, 0xA7D4E0
; palette
  LDI r7, 0x3054
  LDI r1, 1
  LDI r5, 0xDD0044
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x00FFFF
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x00FF44
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x000066
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0xAAFF00
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x00FFFF
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x880088
  STORE r7, r5
  ADD r7, r7, r1
  LDI r5, 0x880088
  STORE r7, r5
  ADD r7, r7, r1
main_0:
  AND r8, r14, r9
  AND r10, r3, r28
  LDI r1, 256
  FILL r1
  FRAME
  JMP main_0
