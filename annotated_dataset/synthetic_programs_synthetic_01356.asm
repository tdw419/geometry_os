; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and sets up a color palette in memory. It then enters a loop where it continuously checks for user input to draw frames based on certain conditions.

; drawing loop program
; initialization
  LDI r7, 0x644F99
  LDI r3, 2
  LDI r15, 8
  LDI r5, 4068
  LDI r10, 128
  LDI r4, 0x5A5054
  LDI r13, 0x12A95A
  LDI r27, 128
; palette
  LDI r4, 0x23DE
  LDI r15, 1
  LDI r2, 0x008888
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x00FFFF
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xAAFF00
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xFFAA00
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x00FF00
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xFF4400
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xFF8800
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x44FF00
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x0044FF
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xFF8800
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xFFFFFF
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x00FF00
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x000066
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0x550077
  STORE r4, r2
  ADD r4, r4, r15
  LDI r2, 0xAAFF00
  STORE r4, r2
  ADD r4, r4, r15
main_0:
  IKEY r13
  CMPI r13, 255
  JNZ r13, key_1
  CMPI r9, r4, 0xAFE525
  IKEY r5
  CMPI r5, 0x4F5F5A
  JNZ r5, key_2
  FRAME
  JMP main_0
