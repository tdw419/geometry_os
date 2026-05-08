; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters an infinite loop where it performs bitwise OR operations between registers and compares one of the results to a constant value. It also includes a call to the `FRAME` function before jumping back to the start of the loop.

; input driven program
; initialization
  LDI r11, 64
  LDI r2, 16
  LDI r5, 8
  LDI r15, 803
main_0:
  OR r9, r12, r14
  OR r3, r11, r8
  CMPI r9, 64
  FRAME
  JMP main_0
