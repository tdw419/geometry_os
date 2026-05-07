; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a filled rectangle using the `RECTF` instruction. After drawing the rectangle, it sets a single pixel at a specified coordinate using the `PSET` instruction before halting execution.

; simple draw program
; initialization
  LDI r11, 1345
  LDI r3, 2254
  LDI r5, 0x172500
  LDI r6, 8
  LDI r14, 0x44DF27
  LDI r9, 256
  LDI r0, 0x11FC7E
  LDI r13, 0x50A856
  LDI r4, 256
  LDI r8, 2703
  LDI r5, 1766
  LDI r29, 0xE3E0F9
  RECTF r13, r4, r8, r5, r29
  LDI r6, 164
  LDI r9, 745
  LDI r3, 0
  PSET r6, r9, r3
  LDI r3, 255
  LDI r4, 0x5C0DC6
  LDI r7, 0
  LDI r2, 0x2AC968
  LDI r2, 0xAA05D8
  RECTF r3, r4, r7, r2, r2
  HALT
