; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters an infinite loop where it compares register `r1` to 128. If the comparison fails, it loads a text string into memory and displays it within a frame, then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r9, 3280
  LDI r8, 1371
  LDI r10, 0x708412
  LDI r13, 1274
  LDI r5, 4
  LDI r12, 1
  LDI r2, 0x8C56FD
main_0:
  CMPI r1, 128
  LDI r14, 0x2AC1AA
  LDI r10, 256
  LDI r3, 16
  TEXT r14, r10, r3, "HELLO"
  FRAME
  JMP main_0
