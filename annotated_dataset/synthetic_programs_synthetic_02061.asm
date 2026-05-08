; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it repeatedly draws a circle using the `CIRCLE` instruction with specified parameters, subtracts values from registers, updates the frame, and jumps back to the start of the loop.

; input driven program
; initialization
  LDI r10, 128
  LDI r0, 1
  LDI r6, 560
main_0:
  LDI r15, 8
  LDI r2, 0xCEED10
  LDI r13, 311
  LDI r7, 719
  CIRCLE r15, r2, r13, r7
  SUB r14, r9, r3
  FRAME
  JMP main_0
