; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at coordinates (446, 3469) with color 0xEED315. It then draws a circle centered at (1581, 1002) with a radius of 64 using color 0x32452C before halting the program.

; simple draw program
; initialization
  LDI r9, 730
  LDI r7, 1
  LDI r13, 0xEED315
  LDI r10, 446
  LDI r11, 3469
  LDI r5, 1513
  PSETI
  LDI r15, 0x32452C
  LDI r3, 1581
  LDI r9, 64
  LDI r13, 1002
  CIRCLE r15, r3, r9, r13
  HALT
