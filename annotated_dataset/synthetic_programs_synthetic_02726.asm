; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it continuously compares the contents of registers `r3` and `r5`, as well as `r15` and `r7`. The `FRAME` instruction is called in each iteration, followed by a jump back to the start of the loop (`main_0`).

; input driven program
; initialization
  LDI r10, 0
  LDI r9, 1411
  LDI r0, 3368
  LDI r12, 2411
main_0:
  CMP r3, r5
  CMP r15, r7
  FRAME
  JMP main_0
