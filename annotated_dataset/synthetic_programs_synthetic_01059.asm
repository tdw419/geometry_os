; DESCRIPTION: This GeOS assembly code initializes registers and performs a counted animation loop. It involves bitwise operations, arithmetic calculations, and conditional jumps to repeatedly manipulate register values until specific conditions are met, ultimately leading to a halt.

; counted animation
; initialization
  LDI r14, 0
  LDI r12, 0x76C956
  LDI r10, 15
loop_0:
  ANDI r3, r14, 0xD51BA6
  MOD r31, r8, r11
  ADDI r2, r6, 0x31917F
  LDI r8, 1
  SUB r10, r10, r8
  JNZ r10, loop_0
  LDI r15, 16
loop_1:
  SHR r9, r3, r21
  SUBI r27, r4, 255
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_1
  HALT
