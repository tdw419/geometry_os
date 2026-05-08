; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a counted animation. It draws circles using the `CIRCLE` instruction in a loop until a counter reaches zero, then proceeds to manipulate other registers in further loops before halting execution.

; counted animation
; initialization
  LDI r0, 2456
  LDI r11, 2562
  LDI r2, 0xCE0ACC
  LDI r7, 37
loop_0:
  CMPI r7, r13, 0xE57674
  LDI r10, 0x07DCB5
  LDI r0, 0xCF9F1A
  LDI r8, 32
  LDI r1, 0xCC8239
  CIRCLE r10, r0, r8, r1
  LDI r6, 1
  SUB r7, r7, r6
  JNZ r7, loop_0
  LDI r10, 0xBBB2CF
loop_1:
  ADDI r5, r1, 0xA4F2D7
  ANDI r22, r5, 255
  ADDI r13, r6, 0x9B490D
  ADD r6, r11, r12
  LDI r3, 1
  SUB r10, r10, r3
  JNZ r10, loop_1
  LDI r0, 0xA7537D
loop_2:
  ADDI r7, r1, 0
  ANDI r10, r1, 82
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_2
  HALT
