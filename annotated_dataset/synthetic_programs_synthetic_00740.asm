; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform bitwise operations, arithmetic calculations, and drawing commands on the screen. The loops decrement counters and continue executing until they reach zero, creating a counted animation effect.

; counted animation
; initialization
  LDI r6, 0xE285DB
  LDI r10, 2345
  LDI r9, 1780
  LDI r8, 492
  LDI r4, 315
  LDI r7, 0x2EDF5B
  LDI r2, 3828
  LDI r15, 1210
  LDI r15, 10
loop_0:
  XOR r2, r5, r1
  SUB r10, r5, r7
  LDI r9, 2795
  FILL r9
  SUB r2, r5, r4
  LDI r8, 1
  SUB r15, r15, r8
  JNZ r15, loop_0
  LDI r14, 0x273C8D
loop_1:
  ADDI r10, r9, 255
  OR r4, r5, r9
  LDI r1, 4078
  LDI r2, 3166
  LDI r12, 8
  PSET r1, r2, r12
  ANDI r1, r7, 177
  LDI r7, 1
  SUB r14, r14, r7
  JNZ r14, loop_1
  LDI r13, 34
loop_2:
  ADD r8, r11, r4
  SUBI r23, r5, 4
  SUBI r13, r10, 109
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_2
  HALT
