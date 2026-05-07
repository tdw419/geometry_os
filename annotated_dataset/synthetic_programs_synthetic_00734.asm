; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSET` and `PSETI` instructions to set pixel colors at given coordinates on a graphical display. The program halts after executing these drawing commands.

; simple draw program
; initialization
  LDI r10, 0xEAB117
  LDI r13, 457
  LDI r5, 0x07E2F4
  LDI r12, 1
  LDI r0, 0x218D1B
  LDI r3, 345
  LDI r11, 864
  LDI r11, 0xA79722
  LDI r23, 0x24CFED
  LDI r0, 0xEDA50D
  PSET r11, r23, r0
  LDI r3, 0xBE3FFA
  LDI r2, 2606
  LDI r15, 665
  PSETI
  HALT
