; DESCRIPTION: This GeOS assembly code initializes various registers with specific values and then uses the `RECTF` instruction to draw a filled rectangle on the screen. The program halts afterward.

; simple draw program
; initialization
  LDI r11, 1
  LDI r5, 4
  LDI r9, 3372
  LDI r15, 1
  LDI r1, 0x26065B
  LDI r12, 0xF81CE7
  LDI r6, 0xD48A71
  LDI r12, 256
  LDI r8, 0xCE927C
  LDI r15, 0x57948D
  LDI r3, 722
  LDI r7, 780
  RECTF r12, r8, r15, r3, r7
  HALT
