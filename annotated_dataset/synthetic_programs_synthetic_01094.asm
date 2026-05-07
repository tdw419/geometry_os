; DESCRIPTION: The assembly code initializes a drawing loop in the GeOS operating system, setting up a color palette and repeatedly rendering text and pixels on the screen.

; drawing loop program
; initialization
  LDI r15, 2453
  LDI r1, 0x9C05CE
  LDI r9, 0
; palette
  LDI r13, 0x212D
  LDI r11, 1
  LDI r8, 0x8800FF
  STORE r13, r8
  ADD r13, r13, r11
  LDI r8, 0x00FFAA
  STORE r13, r8
  ADD r13, r13, r11
  LDI r8, 0xFFAA00
  STORE r13, r8
  ADD r13, r13, r11
  LDI r8, 0x00FFFF
  STORE r13, r8
  ADD r13, r13, r11
  LDI r8, 0x00FFAA
  STORE r13, r8
  ADD r13, r13, r11
main_0:
  SHLI r10, r8, 8
  SHLI r2, r12, 0x003E58
  LDI r2, 0
  LDI r4, 0x75F0E4
  LDI r15, 64
  DRAWTEXT r2, r4, r15, "WORLD"
  SHL r7, r2, r10
  SAR r9, r7, r15
  SHL r11, r4, r2
  SHR r10, r13, r1
  LDI r10, 2
  LDI r9, 0xEBD2F6
  LDI r4, 1
  PSETI
  MUL r3, r4, r8
  FRAME
  JMP main_0
