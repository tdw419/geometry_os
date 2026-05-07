; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then enters a loop where it repeatedly draws a circle with varying parameters and updates the frame until a condition is met (when `r11` equals `0xF938A3`).

; drawing loop program
; initialization
  LDI r15, 0x494D70
  LDI r10, 0xBFC3B2
  LDI r5, 2322
  LDI r13, 0x57F5C4
  LDI r0, 0xC85A13
  LDI r14, 3641
; palette
  LDI r12, 0x2490
  LDI r8, 1
  LDI r1, 0x444444
  STORE r12, r1
  ADD r12, r12, r8
  LDI r1, 0x00FFAA
  STORE r12, r1
  ADD r12, r12, r8
  LDI r1, 0xFF8800
  STORE r12, r1
  ADD r12, r12, r8
  LDI r1, 0x00FF44
  STORE r12, r1
  ADD r12, r12, r8
main_0:
  CMPI r11, 0xF938A3
  LDI r3, 0x93EBF7
  LDI r7, 0x1D8420
  LDI r5, 0xE67E7E
  LDI r14, 8
  CIRCLE r3, r7, r5, r14
  FRAME
  JMP main_0
