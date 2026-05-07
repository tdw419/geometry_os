; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it waits for user input. If the input is '2', it performs a subtraction operation on specific registers and then calls a subroutine labeled `FRAME`. The program then loops back to the start, awaiting further input.

; input driven program
; initialization
  LDI r12, 128
  LDI r4, 0x20FC1D
main_0:
  ADDI r1, r4, 1
  IKEY r21
  CMPI r21, 2
  JNZ r21, key_1
  SUB r14, r5, r8
  FRAME
  JMP main_0
