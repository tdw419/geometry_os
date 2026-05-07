; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` command to plot a single pixel at coordinates (128, 1022) with color value 256. The program then halts execution.

; simple draw program
; initialization
  LDI r15, 8
  LDI r7, 0x4C4CC7
  LDI r13, 2291
  LDI r11, 128
  LDI r28, 1022
  LDI r8, 256
  PSET r11, r28, r8
  HALT
