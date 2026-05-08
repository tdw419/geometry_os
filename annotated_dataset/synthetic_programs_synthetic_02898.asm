; DESCRIPTION: This GeOS assembly code initializes a drawing loop with a palette of colors and continuously checks for specific key inputs to update the frame.

; drawing loop program
; initialization
  LDI r0, 2504
  LDI r6, 0x852F63
; palette
  LDI r2, 0x608B
  LDI r8, 1
  LDI r9, 0x0044FF
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0xFF8800
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0x550077
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0xFFFFFF
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0xFFEE00
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0x550077
  STORE r2, r9
  ADD r2, r2, r8
  LDI r9, 0x888800
  STORE r2, r9
  ADD r2, r2, r8
main_0:
  AND r1, r2, r15
  SUBI r2, r10, 0x9A919B
  CMPI r11, r3, 64
  SUB r3, r22, r0
  IKEY r8
  CMPI r8, 10
  JNZ r8, key_1
  IKEY r4
  CMPI r4, 8
  JNZ r4, key_2
  FRAME
  JMP main_0
