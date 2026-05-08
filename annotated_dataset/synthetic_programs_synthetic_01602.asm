; DESCRIPTION: The GeOS assembly code initializes drawing parameters and sets up a color palette. It then enters a loop where it checks for user input; if the input matches a specific key (key code 177), it calls a `FRAME` routine to update the display, otherwise, it continues waiting for input.

; drawing loop program
; initialization
  LDI r26, 1044
  LDI r31, 2014
  LDI r28, 1
  LDI r4, 1241
  LDI r11, 255
  LDI r8, 0xC429BA
; palette
  LDI r10, 0x60B6
  LDI r8, 1
  LDI r4, 0xAAFF00
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0xFFAA00
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0xAAFF00
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0x444444
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0x000066
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0x888800
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0xFFAA00
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0x0000FF
  STORE r10, r4
  ADD r10, r10, r8
  LDI r4, 0xAAFF00
  STORE r10, r4
  ADD r10, r10, r8
main_0:
  SUBI r17, r0, 0
  SUB r14, r2, r7
  IKEY r2
  CMPI r2, 177
  JNZ r2, key_1
  FRAME
  JMP main_0
