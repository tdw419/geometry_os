; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at coordinates (1666, 255) with color 0x8F4441. It then sets another pixel at coordinates (3542, 10) with color 0xB927CC before halting the program.

; simple draw program
; initialization
  LDI r0, 1666
  LDI r13, 255
  LDI r8, 128
  LDI r1, 1
  LDI r3, 10
  LDI r15, 3602
  LDI r6, 0x8F4441
  LDI r3, 0xB927CC
  PSETI
  LDI r15, 3542
  LDI r2, 10
  LDI r3, 0
  PSET r15, r2, r3
  HALT
