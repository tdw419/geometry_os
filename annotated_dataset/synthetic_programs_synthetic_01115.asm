; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop that performs bitwise operations and conditional jumps. It repeatedly sets pixels on a display based on the values in the registers, modifies these values through arithmetic operations, and halts execution after completing the loops.

; counted animation
; initialization
  LDI r23, 0x3005BC
  LDI r0, 256
  LDI r1, 0xB485DA
  LDI r11, 2165
  LDI r4, 2216
  LDI r14, 16
  LDI r13, 3814
  LDI r2, 2
loop_0:
  ANDI r3, r4, 2
  CMPI r10, r1, 256
  LDI r5, 2026
  LDI r4, 256
  LDI r3, 4
  PSET r5, r4, r3
  ADDI r3, r6, 1
  LDI r8, 1
  SUB r2, r2, r8
  JNZ r2, loop_0
  LDI r7, 15
loop_1:
  SHL r13, r3, r9
  LDI r11, 1
  SUB r7, r7, r11
  JNZ r7, loop_1
  HALT
