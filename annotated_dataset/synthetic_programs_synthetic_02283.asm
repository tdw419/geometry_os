; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops to perform counted animations. It uses arithmetic operations, conditional jumps, and pixel setting instructions to manipulate graphics on the screen.

; counted animation
; initialization
  LDI r14, 10
  LDI r8, 0xB0B02E
  LDI r11, 3304
  LDI r2, 0x2C84D7
  LDI r4, 0x587227
  LDI r1, 128
  LDI r10, 2
  LDI r0, 1842
  LDI r13, 256
loop_0:
  ADDI r1, r6, 2
  CMPI r7, r11, 32
  MOD r24, r7, r8
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_0
  LDI r5, 19
loop_1:
  LDI r14, 10
  LDI r10, 1980
  LDI r4, 0x42A4A1
  PSETI
  LDI r5, 8
  LDI r15, 1810
  LDI r3, 255
  WPIXEL
  LDI r3, 1
  SUB r5, r5, r3
  JNZ r5, loop_1
  LDI r4, 0
loop_2:
  AND r12, r4, r27
  SUBI r13, r7, 186
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_2
  HALT
