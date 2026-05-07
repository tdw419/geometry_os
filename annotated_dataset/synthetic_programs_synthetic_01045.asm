; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a drawing loop. It performs bitwise operations on registers, checks for a key press, shifts bits, subtracts values, fills a frame, and then repeats the loop.

; drawing loop program
; initialization
  LDI r0, 0x87FEBB
  LDI r28, 0x96C3ED
main_0:
  AND r12, r3, r6
  AND r15, r8, r12
  XOR r3, r13, r6
  AND r4, r2, r8
  IKEY r10
  CMPI r10, 49
  JNZ r10, key_1
  SHR r7, r12, r5
  SHR r3, r0, r14
  SHL r2, r0, r9
  SUB r10, r1, r5
  LDI r3, 742
  FILL r3
  FRAME
  JMP main_0
