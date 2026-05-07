; DESCRIPTION: This GeOS assembly code initializes registers with specific values and sets up a color palette. It then enters a loop where it performs operations like shifting and arithmetic on registers, draws lines with the `LINE` command, displays text with the `TEXT` command, and refreshes the display frame with `FRAME`. The loop continues indefinitely with a jump to `main_0`.

; drawing loop program
; initialization
  LDI r0, 3070
  LDI r18, 0xE827EF
  LDI r9, 3177
  LDI r14, 0xDA34CC
  LDI r4, 64
  LDI r6, 0x362022
  LDI r12, 8
; palette
  LDI r3, 0x233D
  LDI r4, 1
  LDI r11, 0x008888
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x008888
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0xAA00AA
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x000000
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0xFF8800
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x880088
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x550077
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x00FF00
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x444444
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x00FF00
  STORE r3, r11
  ADD r3, r3, r4
  LDI r11, 0x8800FF
  STORE r3, r11
  ADD r3, r3, r4
main_0:
  SHR r14, r12, r9
  SAR r1, r2, r11
  LDI r6, 1786
  LDI r10, 0x5F411B
  LDI r6, 0xDAE14E
  LDI r6, 1660
  LDI r11, 128
  LINE r6, r10, r6, r6, r11
  LDI r14, 3209
  LDI r4, 0x8A1EE2
  LDI r13, 0xCF7C69
  TEXT r14, r4, r13, "HELLO"
  FRAME
  JMP main_0
