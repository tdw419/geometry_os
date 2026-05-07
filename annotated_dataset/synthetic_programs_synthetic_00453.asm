; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it shifts bits in register `r9`, compares values in registers `r10` and `r6`, adds values to `r15`, decrements `r1`, and checks if `r1` is non-zero before looping again. The loop halts when `r1` reaches zero.

; counted animation
; initialization
  LDI r3, 2716
  LDI r5, 128
  LDI r14, 165
  LDI r10, 3388
  LDI r12, 0x4D3BF3
  LDI r1, 64
loop_0:
  SHL r9, r0, r2
  CMPI r10, r0, 0xCFDD96
  CMPI r6, r5, 99
  ADD r15, r1, r5
  LDI r15, 1
  SUB r1, r1, r15
  JNZ r1, loop_0
  HALT
