; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, draws a circle using the `CIRCLE` instruction, fills a rectangle with the `RECTF` instruction, and then writes a pixel at a specified coordinate before halting execution.

; simple draw program
; initialization
  LDI r6, 3374
  LDI r3, 3010
  LDI r11, 0
  LDI r7, 0
  LDI r1, 32
  LDI r15, 256
  LDI r5, 0x92D17D
  CIRCLE r7, r1, r15, r5
  LDI r21, 0x692675
  LDI r14, 1
  LDI r12, 832
  LDI r8, 0x62F063
  LDI r7, 2
  RECTF r21, r14, r12, r8, r7
  LDI r6, 1529
  LDI r0, 8
  LDI r15, 1112
  WPIXEL
  HALT
