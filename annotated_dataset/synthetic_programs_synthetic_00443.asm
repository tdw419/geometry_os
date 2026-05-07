; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters an infinite loop where it compares a value in register `r5` to the constant `0xB94BD7`, subtracts the values of `r7` and `r6` storing the result in `r0`, creates a frame, and then jumps back to the start of the main loop.

; input driven program
; initialization
  LDI r0, 3905
  LDI r8, 412
  LDI r15, 2
  LDI r7, 871
  LDI r10, 8
main_0:
  CMPI r5, 0xB94BD7
  SUB r0, r7, r6
  FRAME
  JMP main_0
