; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `PSETI` instruction to set a pixel at a coordinate (300, 2643) with color 0x3DFC64. It also draws a line from (8, 255) to (64, 1) using color 0x24E589 before halting execution.

; simple draw program
; initialization
  LDI r3, 2643
  LDI r1, 300
  LDI r2, 0x3DFC64
  LDI r4, 256
  LDI r0, 0xAB5020
  LDI r8, 64
  LDI r5, 1915
  LDI r13, 0x470F90
  LDI r14, 1753
  LDI r0, 0x2013EA
  LDI r2, 2
  PSETI
  LDI r12, 8
  LDI r11, 255
  LDI r9, 64
  LDI r13, 1
  LDI r4, 0x24E589
  LINE r12, r11, r9, r13, r4
  HALT
