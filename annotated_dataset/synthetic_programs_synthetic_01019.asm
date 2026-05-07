; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs arithmetic operations including subtraction, addition, and exclusive OR. The loop iterates 10 times before halting execution.

; counted animation
; initialization
  LDI r7, 0x5B582C
  LDI r9, 0x28D0EB
  LDI r10, 16
  LDI r8, 16
  LDI r4, 0xABB1D7
  LDI r14, 0xDAD20B
  LDI r17, 10
loop_0:
  SUB r3, r9, r5
  ADDI r1, r14, 0xC71EF2
  XOR r8, r1, r11
  LDI r6, 1
  SUB r17, r17, r6
  JNZ r17, loop_0
  HALT
