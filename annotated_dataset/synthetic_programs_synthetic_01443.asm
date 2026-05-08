; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it repeatedly loads the string "WORLD" into register `r9` and draws it at a position determined by the value in `r3`, which is shifted left by the value in `r1`. The program then updates the frame and jumps back to the start of the main loop.

; input driven program
; initialization
  LDI r1, 84
  LDI r8, 0xC9F099
  LDI r2, 0x4B8676
  LDI r5, 953
  LDI r4, 501
main_0:
  LDI r9, 10
  LDI r3, 128
  LDI r9, 443
  DRAWTEXT r9, r3, r9, "WORLD"
  SHL r3, r1, r15
  FRAME
  JMP main_0
