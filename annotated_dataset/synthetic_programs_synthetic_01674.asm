; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it compares two registers (`r10` and `r15`). Inside the loop, it multiplies two registers (`r6`, `r21`, and `r2`), loads multiple registers with hexadecimal values, draws the text "WORLD" at a specified location using the `DRAWTEXT` instruction, and then draws the text "HELLO" using the `TEXT` instruction. The program then calls the `FRAME` routine and jumps back to the start of the loop, repeating indefinitely.

; input driven program
; initialization
  LDI r4, 0xB431AA
  LDI r13, 1093
  LDI r6, 64
main_0:
  CMP r10, r15
  MUL r6, r21, r2
  LDI r12, 0xA26A5C
  LDI r2, 0x231DF2
  LDI r8, 0x6A5C16
  DRAWTEXT r12, r2, r8, "WORLD"
  LDI r1, 64
  LDI r11, 0x2CAEFE
  LDI r7, 2055
  TEXT r1, r11, r7, "HELLO"
  FRAME
  JMP main_0
