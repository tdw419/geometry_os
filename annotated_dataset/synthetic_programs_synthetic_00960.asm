; DESCRIPTION: This GeOS assembly code initializes a drawing loop with a predefined palette of colors, then continuously checks for user input. If the input key matches a specific value (155), it performs operations involving bitwise logic and arithmetic to draw a circle on the screen before updating the frame and repeating the process.

; drawing loop program
; initialization
  LDI r0, 2825
  LDI r5, 1
; palette
  LDI r12, 0x3040
  LDI r3, 1
  LDI r10, 0x00FF44
  STORE r12, r10
  ADD r12, r12, r3
  LDI r10, 0xFFFF00
  STORE r12, r10
  ADD r12, r12, r3
  LDI r10, 0x888800
  STORE r12, r10
  ADD r12, r12, r3
  LDI r10, 0xFFFFFF
  STORE r12, r10
  ADD r12, r12, r3
  LDI r10, 0x000000
  STORE r12, r10
  ADD r12, r12, r3
  LDI r10, 0x008888
  STORE r12, r10
  ADD r12, r12, r3
main_0:
  CMP r3, r12
  IKEY r2
  CMPI r2, 155
  JNZ r2, key_1
  AND r8, r12, r15
  XOR r10, r13, r4
  XOR r5, r7, r12
  AND r8, r1, r2
  LDI r7, 0x13B537
  LDI r7, 0x78BB66
  LDI r1, 1068
  LDI r2, 0xBE7D3F
  CIRCLE r7, r7, r1, r2
  FRAME
  JMP main_0
