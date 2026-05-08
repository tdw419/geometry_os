; DESCRIPTION: This GeOS assembly code is an input-driven program that performs a series of bitwise operations and arithmetic shifts on registers. It waits for user input via the `IKEY` instruction and checks if the input matches certain conditions before entering a loop to repeatedly execute the operations and check the input again.

; input driven program
; initialization
  LDI r3, 4
  LDI r11, 3646
main_0:
  AND r12, r4, r9
  OR r4, r8, r5
  XOR r20, r2, r7
  XOR r5, r12, r4
  SHR r13, r7, r15
  SAR r15, r8, r9
  SHR r10, r6, r5
  SHL r7, r2, r13
  SAR r4, r3, r28
  SAR r15, r3, r4
  SAR r9, r5, r14
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_1
  CMPI r0, r5, 55
  FRAME
  JMP main_0
