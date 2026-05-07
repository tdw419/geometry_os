; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs a series of arithmetic operations including multiplication and subtraction within a loop. It checks for a key input and conditionally executes certain instructions based on that input before halting the program.

; mixed program
; initialization
  LDI r5, 8
  LDI r11, 8
  LDI r14, 1859
  IKEY r12
  CMPI r12, 256
  JNZ r12, key_0
  OR r10, r12, r6
  AND r6, r11, r13
  OR r6, r15, r14
  LDI r13, 0x6F31F9
loop_1:
  MUL r13, r14, r6
  MUL r4, r6, r10
  MUL r15, r1, r2
  LDI r0, 1
  SUB r13, r13, r0
  JNZ r13, loop_1
  SHL r10, r11, r4
  HALT
