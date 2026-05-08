; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it performs bitwise operations (AND and XOR) on register contents, sets a pixel using the `PSETI` instruction, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r6, 3320
  LDI r8, 1168
  LDI r14, 0
  LDI r1, 1601
  LDI r12, 0xB144F6
  LDI r9, 1240
  LDI r3, 1461
main_0:
  AND r6, r1, r13
  XOR r3, r15, r10
  LDI r14, 2973
  LDI r2, 8
  LDI r14, 808
  PSETI
  FRAME
  JMP main_0
