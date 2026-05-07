; DESCRIPTION: This GeOS assembly code initializes registers with specific values and repeatedly displays the text "HELLO" at two different positions on the screen using the `TEXT` instruction. The program runs in a loop, continuously refreshing the display without exiting.

; input driven program
; initialization
  LDI r3, 1302
  LDI r7, 4057
main_0:
  LDI r11, 0
  LDI r13, 3519
  LDI r9, 0x7351C1
  TEXT r11, r13, r9, "HELLO"
  LDI r12, 4
  LDI r15, 0xCA7128
  LDI r4, 0xD3C0BD
  TEXT r12, r15, r4, "HELLO"
  FRAME
  JMP main_0
