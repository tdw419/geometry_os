; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it shifts the value in register `r5` left by the amount specified in register `r27` stored in `r11`, decrements `r9` until it reaches zero, and then halts execution.

; counted animation
; initialization
  LDI r1, 91
  LDI r10, 1632
  LDI r5, 1005
  LDI r21, 0x580AA9
  LDI r9, 10
loop_0:
  SHL r5, r27, r11
  LDI r14, 1
  SUB r9, r9, r14
  JNZ r9, loop_0
  HALT
