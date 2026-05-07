; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific settings and colors, then enters an infinite loop where it performs bitwise operations on registers to manipulate graphics data.

; drawing loop program
; initialization
  LDI r4, 64
  LDI r7, 3077
  LDI r23, 0xD22281
; palette
  LDI r11, 0x3029
  LDI r4, 1
  LDI r12, 0x0000CC
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x00FFFF
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x000066
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0xAAFF00
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x44FF00
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x0044FF
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x0000FF
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0x00AAFF
  STORE r11, r12
  ADD r11, r11, r4
  LDI r12, 0xFFFFFF
  STORE r11, r12
  ADD r11, r11, r4
main_0:
  SHL r3, r13, r4
  OR r1, r9, r4
  XOR r4, r1, r8
  AND r3, r15, r6
  OR r10, r7, r4
  XOR r13, r9, r0
  OR r3, r12, r6
  CMPI r2, r10, 2
  SHR r10, r27, r6
  SHL r6, r14, r0
  FRAME
  JMP main_0
