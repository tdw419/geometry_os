; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for input. If the input matches certain criteria (key values 2 and 205), it performs XOR operations on specific registers and then calls a function or routine labeled `FRAME` before returning to the main loop.

; input driven program
; initialization
  LDI r15, 1132
  LDI r4, 2
  LDI r1, 1572
  LDI r8, 3994
  LDI r13, 256
  LDI r3, 8
  LDI r24, 256
main_0:
  IKEY r6
  CMPI r6, 2
  JNZ r6, key_1
  IKEY r3
  CMPI r3, 205
  JNZ r3, key_2
  XOR r15, r2, r14
  XOR r10, r21, r4
  FRAME
  JMP main_0
