; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations, arithmetic calculations, and sets pixels on the screen. The loop continues until a condition is met, at which point the program halts.

; counted animation
; initialization
  LDI r6, 2667
  LDI r3, 923
  LDI r11, 255
  LDI r12, 0xAD548F
  LDI r0, 0xD8173F
  LDI r4, 128
loop_0:
  XOR r7, r14, r13
  LDI r20, 256
  LDI r13, 0x5C408E
  LDI r11, 0xC8E90D
  PSETI
  SUBI r13, r16, 0xD88866
  LDI r15, 2392
  LDI r22, 0xD3551A
  LDI r4, 1402
  PSET r15, r22, r4
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_0
  HALT
