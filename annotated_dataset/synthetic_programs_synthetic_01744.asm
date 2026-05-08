; DESCRIPTION: This GeOS assembly code initializes a simple drawing program by setting up registers and then using the `WPIXEL` instruction to draw pixels at specific coordinates. It draws a circle using the `CIRCLE` instruction with defined parameters for radius, center, and color, followed by another pixel write operation, and finally halts execution.

; simple draw program
; initialization
  LDI r11, 0
  LDI r5, 0x431AD0
  LDI r4, 1
  LDI r10, 0x15A2D1
  LDI r0, 32
  LDI r11, 64
  WPIXEL
  LDI r9, 16
  LDI r13, 3668
  LDI r4, 0x4581FA
  LDI r1, 0x4FE51D
  CIRCLE r9, r13, r4, r1
  LDI r5, 256
  LDI r7, 256
  LDI r2, 128
  WPIXEL
  HALT
