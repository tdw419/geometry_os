; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. It performs arithmetic operations, bitwise ANDs, and modifies pixel data in memory to create visual effects, halting execution after the loops complete.

; counted animation
; initialization
  LDI r10, 1062
  LDI r11, 0xFD84F4
  LDI r0, 256
  LDI r12, 128
  LDI r1, 0
  LDI r6, 0xBE6632
loop_0:
  MUL r3, r12, r1
  ANDI r0, r14, 0x8CB75C
  LDI r12, 0x83DFEE
  FILL r12
  ANDI r4, r7, 128
  LDI r12, 1
  SUB r6, r6, r12
  JNZ r6, loop_0
  LDI r13, 0xC9C6E8
loop_1:
  SUBI r4, r6, 242
  LDI r1, 2323
  LDI r2, 0x2D759C
  LDI r15, 64
  PSET r1, r2, r15
  LDI r3, 2149
  LDI r14, 1656
  LDI r7, 1
  WPIXEL
  LDI r14, 256
  LDI r6, 10
  LDI r5, 32
  LDI r12, 16
  LDI r1, 980
  RECTF r14, r6, r5, r12, r1
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_1
  HALT
