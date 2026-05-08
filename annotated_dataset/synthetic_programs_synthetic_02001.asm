; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. In the first loop (`loop_0`), it performs bitwise operations and arithmetic calculations using these registers, decrementing `r13` until it reaches zero, at which point it exits the loop. The second loop (`loop_1`) involves more arithmetic operations and drawing lines based on calculated values, decrementing `r15` until it also reaches zero before halting the program.

; counted animation
; initialization
  LDI r11, 3455
  LDI r0, 1796
  LDI r5, 0x17E2A8
  LDI r10, 2856
  LDI r3, 0xB08ABD
  LDI r4, 2812
  LDI r2, 255
  LDI r12, 3768
  LDI r13, 0x13FD94
loop_0:
  XOR r9, r12, r13
  ANDI r4, r9, 0x4A1768
  SHL r0, r11, r10
  ADDI r5, r13, 4
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_0
  LDI r15, 0x603BF0
loop_1:
  ADDI r2, r6, 16
  DIV r14, r8, r2
  LDI r30, 0x923449
  LDI r2, 2925
  LDI r6, 0xB3BFE3
  LDI r9, 32
  LDI r2, 0x163829
  LINE r30, r2, r6, r9, r2
  LDI r1, 1
  SUB r15, r15, r1
  JNZ r15, loop_1
  HALT
