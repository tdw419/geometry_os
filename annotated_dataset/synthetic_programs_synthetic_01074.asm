; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses these to perform drawing operations on the screen. It sets up a color value in `r10`, fills two areas of memory at addresses specified by `r9` and `r1`, and finally plots a pixel at coordinates determined by `r7` and `r10`. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r14, 1186
  LDI r11, 64
  LDI r4, 1989
  LDI r7, 383
  LDI r10, 0xF3BBA8
  LDI r9, 1761
  FILL r9
  LDI r7, 10
  LDI r10, 2590
  LDI r10, 1434
  PSET r7, r10, r10
  LDI r1, 0x269C68
  FILL r1
  HALT
