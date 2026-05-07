; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a loop where it performs bitwise operations (shift left and exclusive OR) using input from register `r8`. The `FRAME` instruction is called repeatedly in the loop.

; input driven program
; initialization
  LDI r10, 1084
  LDI r3, 2403
  LDI r5, 0xDC7650
  LDI r11, 3530
  LDI r2, 1
main_0:
  SHL r13, r8, r5
  XOR r12, r10, r8
  FRAME
  JMP main_0
