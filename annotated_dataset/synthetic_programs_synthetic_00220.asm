; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it compares register `r12` to a constant value. If the comparison is met, it loads additional values into registers, prints "HELLO" using a text function, performs right shifts on several registers, calls a frame function, and then jumps back to the beginning of the loop.

; input driven program
; initialization
  LDI r0, 0xB760DE
  LDI r6, 3343
  LDI r15, 8
main_0:
  CMPI r12, 0x76359E
  LDI r7, 10
  LDI r6, 0x7755F3
  LDI r15, 435
  TEXT r7, r6, r15, "HELLO"
  SHR r1, r14, r6
  SHR r6, r11, r2
  FRAME
  JMP main_0
