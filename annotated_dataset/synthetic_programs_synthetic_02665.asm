; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then uses the `FILL` instruction to fill a memory area of size 469 bytes with data from register `r11`, before halting execution.

; simple draw program
; initialization
  LDI r14, 0x6580D6
  LDI r2, 0xEC8036
  LDI r10, 2
  LDI r7, 16
  LDI r11, 0x4EB0FE
  LDI r3, 0xB0484A
  LDI r15, 469
  FILL r15
  HALT
