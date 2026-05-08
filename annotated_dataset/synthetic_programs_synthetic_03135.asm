; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, sets up a color palette, and enters an infinite loop (`main_0`) where it performs bitwise operations and uses the `RECTF` instruction to draw rectangles on the screen. The loop conditionally modifies register values based on comparisons and continues indefinitely.

; drawing loop program
; initialization
  LDI r3, 2289
  LDI r1, 0x4AE077
  LDI r15, 1241
  LDI r8, 32
  LDI r4, 0x0B42D5
  LDI r31, 1855
  LDI r9, 64
; palette
  LDI r4, 0x2090
  LDI r5, 1
  LDI r6, 0x00FFFF
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0x00FFFF
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0x00FF00
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0xFF8800
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0xAAAAAA
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0xAA00AA
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0xFF8800
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0x00FFFF
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0x00FF00
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0xAAFF00
  STORE r4, r6
  ADD r4, r4, r5
  LDI r6, 0x880088
  STORE r4, r6
  ADD r4, r4, r5
main_0:
  SAR r8, r11, r10
  SHL r10, r1, r3
  SHL r2, r15, r6
  SHL r4, r15, r14
  LDI r8, 774
  LDI r17, 0
  LDI r11, 0x8F32B9
  LDI r14, 4074
  LDI r9, 3225
  RECTF r8, r17, r11, r14, r9
  CMPI r9, r11, 22
  OR r3, r9, r24
  XOR r10, r12, r6
  XOR r7, r14, r8
  AND r3, r7, r17
  SHLI r3, r10, 0x90AD87
  SAR r15, r8, r7
  SHLI r12, r0, 5
  CMP r14, r12
  FRAME
  JMP main_0
