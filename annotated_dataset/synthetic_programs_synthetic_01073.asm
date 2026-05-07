; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a circle using the `CIRCLE` instruction. It fills the circle with a color specified in register `r9`, sets a pixel at coordinates defined by registers `r12`, `r25`, and `r4`, and finally halts execution.

; simple draw program
; initialization
  LDI r2, 131
  LDI r3, 2
  LDI r12, 0x8EE12E
  LDI r4, 128
  LDI r7, 0x53BD28
  LDI r11, 0x63BD08
  LDI r13, 0x625B1B
  LDI r20, 0xD60AA3
  LDI r12, 1567
  LDI r16, 0xF34415
  LDI r2, 2109
  CIRCLE r20, r12, r16, r2
  LDI r9, 0x4B6179
  FILL r9
  LDI r12, 32
  LDI r25, 900
  LDI r4, 3183
  PSETI
  HALT
