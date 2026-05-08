; DESCRIPTION: The GeOS assembly code initializes several registers with specific values, sets up a color palette, and enters a loop where it waits for a key press. If the key pressed matches `0xACD460`, it calculates new values for `r5` and `r13`, calls a function to draw a frame, and then loops back.

; drawing loop program
; initialization
  LDI r8, 0x0D61CD
  LDI r7, 0x16321D
  LDI r3, 8
  LDI r4, 0xE52519
  LDI r9, 3562
  LDI r15, 2286
  LDI r12, 3461
  LDI r21, 10
; palette
  LDI r0, 0x504F
  LDI r3, 1
  LDI r2, 0xFFAA00
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0x00FF44
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0xFF0000
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0x00AAFF
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0x000000
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0x000066
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0x00FF44
  STORE r0, r2
  ADD r0, r0, r3
  LDI r2, 0xFF8800
  STORE r0, r2
  ADD r0, r0, r3
main_0:
  IKEY r10
  CMPI r10, 0xACD460
  JNZ r10, key_1
  SUBI r5, r9, 221
  ADDI r13, r6, 234
  FRAME
  JMP main_0
