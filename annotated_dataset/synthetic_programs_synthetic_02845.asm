; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations and a subtraction. The loop continues until the result of the subtraction is zero, at which point the system halts.

; counted animation
; initialization
  LDI r1, 1808
  LDI r6, 2296
  LDI r7, 16
  LDI r0, 0
  LDI r9, 0x79F528
  LDI r14, 8
  LDI r15, 0x46E826
loop_0:
  ANDI r15, r2, 0x72B51F
  ANDI r11, r1, 0xD4AB93
  LDI r5, 1
  SUB r15, r15, r5
  JNZ r15, loop_0
  HALT
