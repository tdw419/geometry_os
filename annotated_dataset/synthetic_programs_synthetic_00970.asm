; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it continuously calculates the modulus of `r13` divided by `r6`, decrements a counter in `r5` until it reaches zero, then halts.

; counted animation
; initialization
  LDI r8, 3093
  LDI r5, 0x0E8B1D
  LDI r6, 0x4C7483
  LDI r0, 0x103F0F
  LDI r11, 2048
  LDI r12, 0x4923EA
  LDI r15, 0x71360A
  LDI r5, 31
loop_0:
  MOD r9, r13, r6
  LDI r12, 1
  SUB r5, r5, r12
  JNZ r5, loop_0
  HALT
