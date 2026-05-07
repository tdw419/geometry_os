; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and uses them to draw a rectangle on the screen. The `PSETI` instruction likely sets a pixel color or pattern, while `RECTF` fills a rectangular area with a given color. Finally, the program halts execution.

; simple draw program
; initialization
  LDI r25, 3495
  LDI r14, 0xCEC669
  LDI r6, 2
  LDI r13, 0
  LDI r15, 8
  LDI r11, 1156
  LDI r5, 4
  LDI r13, 16
  LDI r10, 0
  LDI r2, 0x59D949
  PSETI
  LDI r8, 256
  LDI r0, 10
  LDI r21, 0xA61426
  LDI r11, 128
  LDI r11, 0x6AC777
  RECTF r8, r0, r21, r11, r11
  HALT
