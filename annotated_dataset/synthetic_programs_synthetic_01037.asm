; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it continuously subtracts 1 from the value in register `r10`, starting at `0x9CD436`. The loop continues until `r10` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 2
  LDI r17, 0
  LDI r0, 325
  LDI r7, 3150
  LDI r10, 0x9CD436
loop_0:
  ADDI r5, r9, 0x75E8F6
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_0
  HALT
