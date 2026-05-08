; DESCRIPTION: This GeOS assembly code initializes two registers (r1 and r2) to 128. It then enters a loop where it waits for a keyboard input stored in r14. If the input is not equal to 195, it jumps to label key_1. Otherwise, it computes the modulus of r2 with r8 and stores the result in r3, then creates a frame, and loops back to wait for another input.

; input driven program
; initialization
  LDI r1, 128
  LDI r2, 128
main_0:
  IKEY r14
  CMPI r14, 195
  JNZ r14, key_1
  MOD r3, r2, r8
  FRAME
  JMP main_0
