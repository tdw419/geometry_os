; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific register values and sets up a color palette in memory. The main loop continuously calculates and updates registers based on input values, potentially drawing graphics or patterns on the screen.

; drawing loop program
; initialization
  LDI r11, 4
  LDI r15, 1911
  LDI r2, 2220
  LDI r3, 0x01C46A
  LDI r9, 3066
; palette
  LDI r4, 0x23D6
  LDI r7, 1
  LDI r0, 0xFFAA00
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x00FFAA
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x550077
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x00FFFF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x0044FF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x0044FF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x888800
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xFF00FF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0x00FFFF
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xFF8800
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xAA00AA
  STORE r4, r0
  ADD r4, r4, r7
  LDI r0, 0xAAAAAA
  STORE r4, r0
  ADD r4, r4, r7
main_0:
  CMPI r8, r6, 255
  ADDI r1, r6, 0x20C016
  MOD r10, r12, r11
  SHL r7, r12, r14
  SHLI r13, r5, 16
  ADDI r14, r5, 16
  OR r1, r15, r0
  FRAME
  JMP main_0
