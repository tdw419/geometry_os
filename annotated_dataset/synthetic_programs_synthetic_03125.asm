; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and sets up a color palette. It then enters an infinite loop where it repeatedly draws the text "HELLO" at different positions and sizes on the screen using various colors, followed by filling the screen with a color and performing bit shifting operations.

; drawing loop program
; initialization
  LDI r15, 10
  LDI r5, 0xDE225A
  LDI r3, 10
  LDI r2, 0x6EF786
  LDI r9, 3322
  LDI r1, 0xD09001
  LDI r6, 0x039413
; palette
  LDI r1, 0x2045
  LDI r7, 1
  LDI r9, 0x550077
  STORE r1, r9
  ADD r1, r1, r7
  LDI r9, 0x000000
  STORE r1, r9
  ADD r1, r1, r7
  LDI r9, 0xDD0044
  STORE r1, r9
  ADD r1, r1, r7
  LDI r9, 0xFFFFFF
  STORE r1, r9
  ADD r1, r1, r7
  LDI r9, 0xFFFF00
  STORE r1, r9
  ADD r1, r1, r7
  LDI r9, 0x00FF44
  STORE r1, r9
  ADD r1, r1, r7
main_0:
  CMPI r7, r3, 85
  LDI r13, 0xD924FF
  LDI r11, 0x0A369A
  LDI r15, 906
  TEXT r13, r11, r15, "HELLO"
  LDI r12, 128
  LDI r9, 2107
  LDI r0, 0x529940
  TEXT r12, r9, r0, "HELLO"
  LDI r15, 32
  LDI r19, 0x5189B1
  LDI r10, 64
  TEXT r15, r19, r10, "HELLO"
  LDI r9, 0xC464FC
  FILL r9
  SHL r15, r14, r8
  SHLI r29, r15, 4
  SHL r3, r12, r9
  SHL r5, r1, r10
  FRAME
  JMP main_0
