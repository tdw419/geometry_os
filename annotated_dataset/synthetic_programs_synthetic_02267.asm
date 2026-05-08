; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific register values and sets up a color palette in memory. The main loop continuously updates the frame buffer based on certain conditions.

; drawing loop program
; initialization
  LDI r7, 0xE1120C
  LDI r3, 3703
  LDI r6, 1614
  LDI r5, 1417
; palette
  LDI r6, 0x70D8
  LDI r2, 1
  LDI r22, 0x000000
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0xFF0000
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0xFF0000
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0x550077
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0xFF4400
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0xFF4400
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0x00FFAA
  STORE r6, r22
  ADD r6, r6, r2
  LDI r22, 0xFF8800
  STORE r6, r22
  ADD r6, r6, r2
main_0:
  ADDI r14, r8, 234
  CMPI r4, r9, 100
  FRAME
  JMP main_0
