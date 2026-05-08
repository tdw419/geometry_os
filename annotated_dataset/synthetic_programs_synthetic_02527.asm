; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. The loops perform bitwise operations, arithmetic calculations, and conditional jumps based on the register values, simulating an animated sequence or pattern.

; counted animation
; initialization
  LDI r2, 0x8FC35F
  LDI r15, 0xF19865
  LDI r10, 3830
  LDI r12, 32
  LDI r24, 0xFDD140
  LDI r4, 8
  LDI r9, 0x60E47E
  LDI r1, 0xE5E1FD
loop_0:
  ANDI r4, r25, 0xF7903D
  ADD r3, r1, r11
  LDI r6, 1
  SUB r1, r1, r6
  JNZ r1, loop_0
  LDI r6, 128
loop_1:
  SUBI r3, r0, 2
  LDI r10, 1
  SUB r6, r6, r10
  JNZ r6, loop_1
  LDI r14, 44
loop_2:
  MOD r14, r13, r3
  SUB r13, r4, r3
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_2
  HALT
