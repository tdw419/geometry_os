; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to write a pixel at the specified coordinates on the screen before halting execution.

; simple draw program
; initialization
  LDI r2, 0x99043F
  LDI r13, 281
  LDI r6, 0x71B4CA
  LDI r4, 256
  LDI r9, 0x35955A
  LDI r7, 0
  LDI r7, 0x251A3E
  LDI r13, 0x00C849
  LDI r4, 1236
  WPIXEL
  HALT
