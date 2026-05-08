; DESCRIPTION: This GeOS assembly code initializes several registers to specific values and then uses the `WPIXEL` instruction to write a pixel at coordinates (1880, 2) with color 0x24810E. The program halts afterward.

; simple draw program
; initialization
  LDI r6, 1329
  LDI r13, 0x8F6B0C
  LDI r8, 1880
  LDI r14, 2
  LDI r0, 0x3862EE
  LDI r14, 0x24810E
  LDI r8, 3992
  WPIXEL
  HALT
