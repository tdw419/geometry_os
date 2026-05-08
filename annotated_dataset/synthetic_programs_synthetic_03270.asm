; DESCRIPTION: This GeOS assembly code initializes registers and then uses the `WPIXEL` instruction to write a pixel at a specified coordinate with a given color before halting the program.

; simple draw program
; initialization
  LDI r0, 1790
  LDI r15, 64
  LDI r14, 10
  LDI r14, 2296
  LDI r10, 2943
  LDI r15, 0x42F21B
  WPIXEL
  HALT
