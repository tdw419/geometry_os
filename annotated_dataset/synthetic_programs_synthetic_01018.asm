; DESCRIPTION: This GeOS assembly code initializes registers and sets up a color palette. It then enters a loop where it draws text "WORLD" in different positions and colors, and fills a rectangle with specified dimensions and color. The program continuously updates the frame and repeats the process.

; mixed program
; initialization
  LDI r1, 0
  LDI r8, 545
  LDI r12, 255
  LDI r11, 3952
; palette
  LDI r14, 0x2409
  LDI r0, 1
  LDI r6, 0xDD0044
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0xFFEE00
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0x00FFAA
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0xFF8800
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0x0000CC
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0x008888
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0xFFFFFF
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0x0044FF
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0x0000FF
  STORE r14, r6
  ADD r14, r14, r0
  LDI r6, 0xAAAAAA
  STORE r14, r6
  ADD r14, r14, r0
  CMPI r13, 0x82238B
  SHL r5, r14, r12
  CALL func_0
func_0:
  XOR r5, r6, r4
  SHR r1, r4, r7
  SHR r1, r15, r7
  RET
main_1:
  LDI r12, 0x324977
  LDI r7, 32
  LDI r6, 2
  DRAWTEXT r12, r7, r6, "WORLD"
  SUBI r11, r8, 0xBF0B8B
  LDI r15, 1879
  LDI r12, 0x8AFF1C
  LDI r5, 32
  DRAWTEXT r15, r12, r5, "WORLD"
  LDI r1, 1208
  LDI r0, 0x8690FD
  LDI r20, 32
  TEXT r1, r0, r20, "HELLO"
  ADD r7, r9, r12
  LDI r4, 3060
  LDI r10, 1396
  LDI r13, 2933
  LDI r5, 2
  LDI r4, 255
  RECTF r4, r10, r13, r5, r4
  FRAME
  JMP main_1
