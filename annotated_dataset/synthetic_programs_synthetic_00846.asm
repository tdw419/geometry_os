; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses them to draw a rectangle, a circle, and another rectangle on the screen. The `RECTF` instruction is used for filled rectangles, while the `CIRCLE` instruction draws a filled circle. The program halts after completing the drawing operations.

; simple draw program
; initialization
  LDI r9, 1630
  LDI r7, 1529
  LDI r10, 1
  LDI r5, 3437
  LDI r13, 32
  LDI r15, 2997
  LDI r7, 2181
  LDI r3, 128
  LDI r0, 32
  LDI r15, 255
  LDI r9, 0xC0DE04
  RECTF r7, r3, r0, r15, r9
  LDI r4, 0
  LDI r13, 3622
  LDI r2, 0x55B4D7
  LDI r11, 1
  CIRCLE r4, r13, r2, r11
  LDI r5, 468
  LDI r9, 0xD5DB14
  LDI r12, 1409
  LDI r6, 0
  LDI r2, 3075
  RECTF r5, r9, r12, r6, r2
  HALT
