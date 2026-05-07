; DESCRIPTION: This GeOS assembly code initializes a drawing loop with specific register values and sets up a color palette. It then enters a main loop where it performs bit shifts, comparisons, and pixel operations to draw pixels on the screen, updating frames until certain conditions are met.

; drawing loop program
; initialization
  LDI r9, 3661
  LDI r6, 2679
  LDI r2, 532
  LDI r4, 2221
; palette
  LDI r15, 0x80B0
  LDI r5, 1
  LDI r11, 0x000066
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0x008888
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0xFFFF00
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0xFFEE00
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0x00FFAA
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0x8800FF
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0x008888
  STORE r15, r11
  ADD r15, r15, r5
  LDI r11, 0x00FFAA
  STORE r15, r11
  ADD r15, r15, r5
main_0:
  SHL r10, r14, r0
  SHR r14, r11, r8
  CMPI r11, r7, 64
  CMP r4, r6
  CMPI r8, 2
  LDI r9, 3065
  LDI r8, 0xA0347C
  LDI r5, 0x65285A
  WPIXEL
  CMPI r10, 248
  FRAME
  JMP main_0
