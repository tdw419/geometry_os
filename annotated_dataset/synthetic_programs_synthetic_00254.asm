; DESCRIPTION: The GeOS assembly code initializes several registers and enters an infinite loop where it performs bitwise operations (AND, OR) between registers, compares a register to the value 8, calls a function `FRAME`, and then jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r12, 16
  LDI r7, 3292
  LDI r9, 4026
  LDI r14, 10
  LDI r13, 3937
main_0:
  AND r10, r4, r9
  OR r5, r11, r15
  CMPI r4, 8
  FRAME
  JMP main_0
