; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses these values to draw a line and set a pixel on the screen. The program halts after executing these operations.

; simple draw program
; initialization
  LDI r27, 16
  LDI r8, 1645
  LDI r15, 255
  LDI r15, 1269
  LDI r5, 3878
  LDI r5, 0x6D4559
  LDI r1, 32
  LINE r15, r15, r5, r5, r1
  LDI r28, 1586
  LDI r6, 0x20DB9C
  LDI r28, 1176
  PSET r28, r6, r28
  HALT
