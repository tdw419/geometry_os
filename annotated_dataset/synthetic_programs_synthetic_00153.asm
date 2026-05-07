; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a drawing loop where it repeatedly draws rectangles on the screen using the initialized parameters and updates the frame buffer before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r2, 0x0CF09E
  LDI r14, 158
  LDI r6, 2805
  LDI r1, 0x65858C
  LDI r13, 8
; palette
  LDI r3, 0x50DD
  LDI r14, 1
  LDI r8, 0x0044FF
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x000000
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FFFF
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0xFFFFFF
  STORE r3, r8
  ADD r3, r3, r14
main_0:
  AND r11, r10, r7
  XOR r4, r5, r31
  AND r2, r3, r7
  AND r13, r14, r10
  AND r5, r9, r6
  XOR r11, r0, r13
  OR r13, r11, r0
  CMP r3, r5
  LDI r2, 2451
  LDI r7, 64
  LDI r1, 2
  LDI r6, 0x58BC80
  LDI r5, 0x226CB6
  RECTF r2, r7, r1, r6, r5
  LDI r10, 929
  LDI r7, 256
  LDI r1, 0xCF4495
  LDI r9, 4
  LDI r7, 0x530C09
  RECTF r10, r7, r1, r9, r7
  FRAME
  JMP main_0
