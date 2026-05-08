; DESCRIPTION: This GeOS assembly code initializes registers and enters an infinite loop where it continuously adds a value to `r1`, compares `r15` with `r13`, calls the `FRAME` subroutine, and jumps back to the beginning of the loop.

; drawing loop program
; initialization
  LDI r14, 255
  LDI r7, 10
  LDI r2, 0x885AB5
main_0:
  ADDI r1, r15, 2
  CMP r15, r13
  FRAME
  JMP main_0
