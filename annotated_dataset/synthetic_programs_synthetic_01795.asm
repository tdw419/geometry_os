; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then performs a series of drawing operations. It draws a circle using the `CIRCLE` instruction, sets a pixel using `WPIXEL`, fills an area using `FILL`, and finally halts execution with `HALT`.

; simple draw program
; initialization
  LDI r1, 1846
  LDI r3, 0xEF3159
  LDI r8, 596
  LDI r1, 0
  LDI r10, 630
  LDI r14, 2
  LDI r2, 0xDC43C3
  CIRCLE r1, r10, r14, r2
  LDI r4, 256
  LDI r3, 0x62A142
  LDI r13, 1157
  WPIXEL
  LDI r7, 32
  FILL r7
  HALT
