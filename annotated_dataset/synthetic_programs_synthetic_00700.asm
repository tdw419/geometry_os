; DESCRIPTION: The GeOS assembly code initializes various registers with specific values and sets up a color palette. It then enters a drawing loop where it continuously checks for key input. If the key '31' is pressed and certain conditions are met, it performs operations involving shifting and frame updates before repeating the loop.

; drawing loop program
; initialization
  LDI r14, 2887
  LDI r5, 0xD915F9
  LDI r2, 2
  LDI r0, 0xCDFABC
  LDI r15, 128
  LDI r1, 1742
  LDI r6, 0xAD3521
  LDI r7, 10
; palette
  LDI r15, 0x30FE
  LDI r6, 1
  LDI r3, 0x00FF00
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0xFF8800
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0xFFAA00
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0x000000
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0x000066
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0xFF8800
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0xFF8800
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0x8800FF
  STORE r15, r3
  ADD r15, r15, r6
  LDI r3, 0xDD0044
  STORE r15, r3
  ADD r15, r15, r6
main_0:
  IKEY r1
  CMPI r1, 31
  JNZ r1, key_1
  CMPI r7, r12, 215
  CMP r6, r12
  SHR r8, r6, r0
  SHL r1, r2, r13
  FRAME
  JMP main_0
