; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it compares input values, loads specific text into memory, and repeatedly calls a function to display it on the screen. The loop continues indefinitely, as indicated by the unconditional jump at the end.

; input driven program
; initialization
  LDI r10, 32
  LDI r4, 0x858986
main_0:
  CMPI r14, r1, 255
  CMP r3, r2
  LDI r7, 3630
  LDI r10, 983
  LDI r5, 128
  TEXT r7, r10, r5, "HELLO"
  FRAME
  JMP main_0
