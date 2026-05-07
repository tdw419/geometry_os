; DESCRIPTION: This GeOS assembly code initializes various registers and performs a counted animation loop. The outer loop (`loop_0`) decrements a counter in `r0` until it reaches zero, while the inner loop (`loop_1`) draws pixels using the `WPIXEL` instruction based on specific register values, effectively creating an animated visual effect.

; counted animation
; initialization
  LDI r0, 0
  LDI r23, 1407
  LDI r10, 2
  LDI r1, 0
  LDI r8, 165
  LDI r15, 0x8AFCAE
  LDI r4, 32
  LDI r0, 256
loop_0:
  ADDI r15, r7, 8
  ANDI r10, r3, 161
  CMPI r13, r18, 255
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_0
  LDI r3, 4
loop_1:
  ANDI r15, r9, 0xFCD910
  LDI r11, 0x466A8D
  LDI r0, 1758
  LDI r6, 312
  WPIXEL
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_1
  HALT
