; DESCRIPTION: The GeOS assembly code initializes registers with specific values and enters a loop where it compares a register value to an input (IKEY). If the input matches a condition, it frames another comparison before looping back.

; input driven program
; initialization
  LDI r13, 652
  LDI r8, 0xAB6B77
  LDI r9, 0xFA4EA5
  LDI r14, 256
main_0:
  CMP r15, r1
  IKEY r9
  CMPI r9, 2
  JNZ r9, key_1
  CMPI r12, 22
  FRAME
  JMP main_0
