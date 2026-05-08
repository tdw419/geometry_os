; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. The outer loop decrements a register value until it reaches zero, while the inner loop manipulates another register to draw rectangles on the screen, likely creating an animated effect.

; counted animation
; initialization
  LDI r3, 0x005DAC
  LDI r1, 0x415274
  LDI r4, 0xA5CCD4
  LDI r11, 128
  LDI r15, 16
  LDI r7, 0xBF1BF9
loop_0:
  CMPI r1, r15, 14
  LDI r0, 1
  SUB r7, r7, r0
  JNZ r7, loop_0
  LDI r15, 1
loop_1:
  ADDI r0, r13, 134
  AND r7, r15, r13
  LDI r6, 80
  LDI r15, 128
  LDI r15, 128
  LDI r15, 16
  LDI r22, 0x918AD7
  RECTF r6, r15, r15, r15, r22
  LDI r7, 1
  SUB r15, r15, r7
  JNZ r15, loop_1
  HALT
