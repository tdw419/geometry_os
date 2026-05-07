; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it performs a bitwise AND operation between `r1` and `r15`, then decrements register `r4`. The loop continues until `r4` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r6, 1516
  LDI r15, 0x90E534
  LDI r22, 0xB8C567
  LDI r0, 0
  LDI r4, 6
loop_0:
  AND r10, r1, r15
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_0
  HALT
