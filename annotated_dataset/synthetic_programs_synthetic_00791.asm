; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for user input. If the input is '8', it performs a shift operation on register `r2` and then calls a subroutine, after which it returns to the main loop.

; input driven program
; initialization
  LDI r6, 0x622302
  LDI r12, 256
  LDI r8, 1
  LDI r10, 128
  LDI r0, 0xDE7C4C
  LDI r5, 256
main_0:
  XOR r9, r5, r2
  CMP r3, r2
  IKEY r14
  CMPI r14, 8
  JNZ r14, key_1
  SHR r2, r13, r3
  FRAME
  JMP main_0
