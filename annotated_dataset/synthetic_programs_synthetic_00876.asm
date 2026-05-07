; DESCRIPTION: This GeOS assembly code initializes various registers and then uses the `WPIXEL` instruction to write a pixel at coordinates (32, 64) with color 0x93B4BA. It subsequently fills a rectangle starting from this point with a width of 8 and height of 10 using the `FILL` instruction before halting execution.

; simple draw program
; initialization
  LDI r4, 8
  LDI r3, 64
  LDI r7, 2
  LDI r12, 0x93B4BA
  LDI r11, 3406
  LDI r0, 32
  WPIXEL
  LDI r8, 10
  FILL r8
  HALT
