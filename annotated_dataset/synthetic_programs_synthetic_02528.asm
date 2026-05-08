; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, sets up a color palette in memory, and contains a loop that continuously checks for a keyboard input. If the input matches a specific value (`0x311C7D`), it calls a function to draw a frame on the screen before returning to the start of the loop.

; drawing loop program
; initialization
  LDI r8, 0x1E2C1A
  LDI r9, 0xBAF318
  LDI r4, 2891
  LDI r1, 1069
  LDI r7, 3099
  LDI r3, 255
; palette
  LDI r10, 0x248D
  LDI r15, 1
  LDI r12, 0x44FF00
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x0000FF
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xDD0044
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x00FF00
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xAAFF00
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x0000CC
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x880088
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0x0044FF
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xAAFF00
  STORE r10, r12
  ADD r10, r10, r15
  LDI r12, 0xFF4400
  STORE r10, r12
  ADD r10, r10, r15
main_0:
  AND r3, r8, r2
  XOR r0, r2, r1
  OR r1, r14, r11
  IKEY r6
  CMPI r6, 0x311C7D
  JNZ r6, key_1
  FRAME
  JMP main_0
