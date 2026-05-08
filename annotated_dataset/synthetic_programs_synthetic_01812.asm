; DESCRIPTION: This GeOS assembly code initializes registers `r8`, `r9`, and `r15` with specific values. It then enters a loop where it compares the value of register `r9` to the constant `0xA5ADB0`. If they are not equal, it decrements `r15` by 1 and continues the loop until `r15` reaches zero, at which point it halts execution.

; counted animation
; initialization
  LDI r8, 2
  LDI r9, 401
  LDI r15, 47
loop_0:
  CMPI r9, r8, 0xA5ADB0
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_0
  HALT
