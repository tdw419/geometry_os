; DESCRIPTION: This GeOS assembly code initializes a drawing loop program by setting up registers and loading a color palette into memory. It then enters a main loop where it checks for a specific key press (likely to initiate drawing) and, upon detection, switches to a frame-drawing mode before returning to the main loop.

; drawing loop program
; initialization
  LDI r12, 4
  LDI r15, 1440
; palette
  LDI r15, 0x6001
  LDI r5, 1
  LDI r9, 0x0044FF
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x550077
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x000066
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0xFFFFFF
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x00FF44
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x00FFFF
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x00FF44
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x00FFAA
  STORE r15, r9
  ADD r15, r15, r5
  LDI r9, 0x888800
  STORE r15, r9
  ADD r15, r15, r5
main_0:
  CMP r14, r1
  IKEY r9
  CMPI r9, 0xA67B17
  JNZ r9, key_1
  FRAME
  JMP main_0
