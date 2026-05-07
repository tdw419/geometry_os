; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a loop where it draws pixels at specified coordinates, calculates a modulus operation, draws text, and updates the frame before repeating the process indefinitely.

; drawing loop program
; initialization
  LDI r1, 16
  LDI r8, 0x758D54
  LDI r4, 64
  LDI r15, 0x41E8BB
  LDI r14, 255
; palette
  LDI r1, 0x30B0
  LDI r13, 1
  LDI r14, 0x0044FF
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FFFF
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x550077
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x00FF44
  STORE r1, r14
  ADD r1, r1, r13
  LDI r14, 0x44FF00
  STORE r1, r14
  ADD r1, r1, r13
main_0:
  LDI r2, 3826
  LDI r14, 0x82F3E8
  LDI r5, 0x3E211B
  WPIXEL
  MOD r15, r19, r3
  LDI r13, 16
  LDI r15, 0xB0766A
  LDI r13, 3678
  DRAWTEXT r13, r15, r13, "WORLD"
  FRAME
  JMP main_0
