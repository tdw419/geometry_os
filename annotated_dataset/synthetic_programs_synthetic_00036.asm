; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters an infinite loop where it compares two registers, loads new values into other registers, draws the text "WORLD" at a specified position, updates the frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r2, 3174
  LDI r15, 8
  LDI r10, 0x2223DC
main_0:
  CMP r3, r12
  LDI r8, 0x710293
  LDI r2, 0x6ADFB8
  LDI r2, 2956
  DRAWTEXT r8, r2, r2, "WORLD"
  FRAME
  JMP main_0
