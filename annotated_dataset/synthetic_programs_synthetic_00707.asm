; DESCRIPTION: This GeOS assembly code initializes registers and enters a counted loop where it performs bitwise operations, fills memory with a specific value, and decrements a counter. The loop repeats until the counter reaches zero, at which point the system halts.

; counted animation
; initialization
  LDI r9, 8
  LDI r12, 2796
  LDI r15, 0x9B6CF5
  LDI r18, 1
loop_0:
  ANDI r13, r11, 0
  LDI r0, 2133
  FILL r0
  XOR r4, r5, r10
  LDI r6, 1
  SUB r18, r18, r6
  JNZ r18, loop_0
  HALT
