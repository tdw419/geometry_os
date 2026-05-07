; DESCRIPTION: This GeOS assembly code initializes several registers and then enters a loop where it subtracts the value in register `r11` from `r14` until `r14` becomes zero. The loop counter is decremented by one (`LDI r11, 1`) each iteration, and the loop continues until `r14` equals zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 3903
  LDI r12, 10
  LDI r9, 10
  LDI r0, 128
  LDI r14, 0
loop_0:
  SUB r11, r4, r3
  LDI r11, 1
  SUB r14, r14, r11
  JNZ r14, loop_0
  HALT
