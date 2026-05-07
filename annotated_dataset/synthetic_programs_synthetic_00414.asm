; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it repeatedly loads, fills, and performs bitwise operations on registers. The loop decrements a counter (r13) until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r6, 0x86BCE9
  LDI r0, 0x0ACCB0
  LDI r3, 1819
  LDI r2, 0x996DB2
  LDI r11, 3579
  LDI r13, 8
loop_0:
  LDI r9, 3922
  FILL r9
  ANDI r4, r3, 32
  ANDI r0, r4, 16
  LDI r10, 1
  SUB r13, r13, r10
  JNZ r13, loop_0
  HALT
