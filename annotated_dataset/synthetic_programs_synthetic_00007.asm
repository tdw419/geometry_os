; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop (`main_0`) where it repeatedly loads new values into registers, displays the string "HELLO" at different memory locations using the `TEXT` instruction, performs arithmetic operations (addition and division), creates a frame, and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r6, 873
  LDI r11, 2418
  LDI r12, 0x191C53
  LDI r15, 1885
  LDI r4, 322
main_0:
  LDI r11, 8
  LDI r13, 0x43AA72
  LDI r11, 1347
  TEXT r11, r13, r11, "HELLO"
  LDI r25, 1
  LDI r2, 0x7383C4
  LDI r12, 2996
  TEXT r25, r2, r12, "HELLO"
  ADDI r3, r8, 190
  DIV r10, r7, r14
  FRAME
  JMP main_0
