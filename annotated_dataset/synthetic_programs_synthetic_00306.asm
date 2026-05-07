; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws a rectangle using the `RECTF` instruction followed by a circle using the `CIRCLE` instruction. Finally, it halts execution.

; simple draw program
; initialization
  LDI r0, 163
  LDI r4, 32
  LDI r6, 0xAB5F23
  LDI r0, 64
  LDI r15, 0x7BB53F
  LDI r15, 256
  LDI r22, 1598
  RECTF r6, r0, r15, r15, r22
  LDI r3, 8
  LDI r7, 3705
  LDI r20, 2
  LDI r0, 0xB42C8D
  CIRCLE r3, r7, r20, r0
  HALT
