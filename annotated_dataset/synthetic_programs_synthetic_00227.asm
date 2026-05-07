; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it performs bitwise operations, arithmetic calculations, and graphics drawing commands. The loop continues until the value in register r10 reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r5, 0
  LDI r30, 16
  LDI r4, 2451
  LDI r14, 0x423E59
  LDI r10, 0x6E27E5
loop_0:
  XOR r11, r4, r3
  ADDI r9, r2, 0x86D2EF
  LDI r0, 8
  LDI r12, 32
  LDI r6, 0xF52889
  PSETI
  LDI r11, 0x7C6F99
  FILL r11
  LDI r14, 1
  SUB r10, r10, r14
  JNZ r10, loop_0
  HALT
