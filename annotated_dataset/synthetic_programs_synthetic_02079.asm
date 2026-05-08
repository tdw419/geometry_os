; DESCRIPTION: This GeOS assembly code initializes a drawing loop, sets up a color palette with various RGB values, and repeatedly draws the text "WORLD" at a specific position on the screen while updating the frame.

; drawing loop program
; initialization
  LDI r2, 148
  LDI r12, 0xDFA3B9
  LDI r0, 255
; palette
  LDI r2, 0x703D
  LDI r10, 1
  LDI r6, 0x00AAFF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x0044FF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x0044FF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xFF8800
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xFFFFFF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xFF4400
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xDD0044
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xFFFFFF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x00FF00
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x550077
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xFFFF00
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x550077
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xAAFF00
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x8800FF
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0xAAAAAA
  STORE r2, r6
  ADD r2, r2, r10
  LDI r6, 0x00FF00
  STORE r2, r6
  ADD r2, r2, r10
main_0:
  ANDI r7, r14, 236
  OR r13, r11, r3
  OR r13, r14, r7
  OR r14, r7, r0
  AND r9, r6, r10
  XOR r15, r7, r13
  OR r7, r3, r10
  AND r19, r12, r5
  XOR r9, r4, r13
  CMPI r6, r5, 0x07291F
  LDI r7, 1721
  LDI r3, 0x7813CA
  LDI r12, 0xF3BCD2
  DRAWTEXT r7, r3, r12, "WORLD"
  FRAME
  JMP main_0
