; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted loop (`loop_0`) that decrements a counter (`r8`). The loop performs conditional operations based on register comparisons and arithmetic, but ultimately halts execution when the counter reaches zero.

; counted animation
; initialization
  LDI r11, 10
  LDI r13, 2407
  LDI r28, 0x6F78B4
  LDI r5, 32
  LDI r17, 0xD9E2F4
  LDI r10, 32
  LDI r14, 1027
  LDI r15, 0x23EF5A
  LDI r8, 2
loop_0:
  CMPI r2, r4, 0x36BD69
  ANDI r7, r12, 36
  ADDI r12, r2, 0x1DB789
  LDI r6, 1
  SUB r8, r8, r6
  JNZ r8, loop_0
  HALT
