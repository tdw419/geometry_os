; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly loads new values into the registers and calls the `TEXT` function to display the string "HELLO" at different positions. The `FRAME` instruction is called within the loop, and the program uses an unconditional jump (`JMP`) to return to the start of the main loop, creating an infinite loop.

; input driven program
; initialization
  LDI r2, 1994
  LDI r12, 1895
  LDI r1, 0x3C366F
  LDI r0, 2
  LDI r11, 0x20C93B
  LDI r6, 0xC8F4EC
main_0:
  LDI r2, 2562
  LDI r0, 2975
  LDI r12, 0
  TEXT r2, r0, r12, "HELLO"
  LDI r1, 255
  LDI r11, 3774
  LDI r2, 0x5FD883
  TEXT r1, r11, r2, "HELLO"
  FRAME
  JMP main_0
