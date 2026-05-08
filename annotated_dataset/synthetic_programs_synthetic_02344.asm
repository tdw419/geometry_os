; DESCRIPTION: This GeOS assembly code initializes registers with specific values and executes two loops. The first loop decrements a counter (`r3`) until it reaches zero, performing bitwise operations and additions in each iteration. The second loop also decrements another counter (`r5`) until it reaches zero, involving bitwise AND and addition operations. After the loops complete, the program halts.

; counted animation
; initialization
  LDI r14, 32
  LDI r12, 10
  LDI r4, 2133
  LDI r23, 4
  LDI r5, 4012
  LDI r0, 0
  LDI r7, 0x44C4A7
  LDI r3, 0xA224EF
loop_0:
  ADDI r12, r7, 0xE73A02
  OR r14, r6, r13
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_0
  LDI r5, 0x969C7F
loop_1:
  ANDI r10, r8, 59
  ADD r11, r13, r7
  LDI r3, 1
  SUB r5, r5, r3
  JNZ r5, loop_1
  HALT
