; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, enters a loop where it performs arithmetic operations and graphics drawing commands (such as setting pixels and drawing circles), and repeatedly executes these operations by jumping back to the start of the loop. The program is input-driven and continuously updates the display based on the initialized parameters.

; input driven program
; initialization
  LDI r8, 3683
  LDI r0, 1660
  LDI r4, 32
  LDI r12, 1951
  LDI r15, 0x7C9B63
  LDI r1, 3412
  LDI r9, 523
main_0:
  ADD r10, r5, r13
  SUBI r8, r3, 222
  LDI r3, 64
  LDI r18, 32
  LDI r10, 0x5C5167
  PSET r3, r18, r10
  CMP r9, r7
  LDI r6, 0x50FA9E
  LDI r8, 0xDF675B
  LDI r8, 2872
  LDI r8, 16
  CIRCLE r6, r8, r8, r8
  FRAME
  JMP main_0
