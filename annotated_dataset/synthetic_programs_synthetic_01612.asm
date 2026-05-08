; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific colors in a palette and continuously checks for input keys to trigger frame updates.

; drawing loop program
; initialization
  LDI r1, 0x0B311A
  LDI r7, 4
; palette
  LDI r5, 0x5085
  LDI r10, 1
  LDI r2, 0x8800FF
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0x8800FF
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0x00FFFF
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0xFFEE00
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0x00FFAA
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0xFF8800
  STORE r5, r2
  ADD r5, r5, r10
  LDI r2, 0xFFFFFF
  STORE r5, r2
  ADD r5, r5, r10
main_0:
  IKEY r13
  CMPI r13, 0xF0255B
  JNZ r13, key_1
  IKEY r9
  CMPI r9, 110
  JNZ r9, key_2
  FRAME
  JMP main_0
