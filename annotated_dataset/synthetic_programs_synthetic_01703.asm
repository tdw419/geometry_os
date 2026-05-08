; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it repeatedly displays the text "HELLO" at coordinates (1175, 1950) on the screen. It also performs a bitwise AND operation between `r13` and `66`, stores the result in `r4`, and calls the `FRAME` subroutine before jumping back to the start of the loop.

; input driven program
; initialization
  LDI r8, 0xBBBFCC
  LDI r12, 64
main_0:
  LDI r11, 1175
  LDI r23, 1950
  LDI r6, 0
  TEXT r11, r23, r6, "HELLO"
  ANDI r4, r13, 66
  FRAME
  JMP main_0
