; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to write a pixel at coordinates (2499, 3669) on the display. The program then halts execution.

; simple draw program
; initialization
  LDI r3, 0xB566D4
  LDI r7, 470
  LDI r10, 2802
  LDI r0, 0xBD4733
  LDI r11, 0x979103
  LDI r15, 1420
  LDI r6, 1648
  LDI r0, 3669
  LDI r7, 2499
  WPIXEL
  HALT
