; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops to manipulate pixel colors and perform geometric operations such as setting pixels and filling areas. The code uses conditional branches (`JNZ`) to repeat certain operations until conditions are met, indicating a counted animation process.

; counted animation
; initialization
  LDI r4, 10
  LDI r11, 1769
  LDI r5, 0x7037D4
  LDI r15, 623
  LDI r10, 0x54983D
  LDI r2, 2370
  LDI r14, 128
loop_0:
  SUBI r11, r0, 255
  ADDI r10, r8, 175
  LDI r12, 2417
  LDI r8, 0x12D416
  LDI r15, 0x7B9C59
  WPIXEL
  LDI r0, 1
  SUB r14, r14, r0
  JNZ r14, loop_0
  LDI r7, 64
loop_1:
  SUBI r7, r0, 0x154AD8
  CMPI r8, r3, 0xD923B4
  LDI r5, 1
  SUB r7, r7, r5
  JNZ r7, loop_1
  LDI r9, 128
loop_2:
  LDI r5, 2
  LDI r3, 0
  LDI r14, 1617
  PSETI
  LDI r5, 2101
  LDI r16, 0x705722
  LDI r14, 256
  PSETI
  LDI r1, 16
  FILL r1
  LDI r2, 1
  SUB r9, r9, r2
  JNZ r9, loop_2
  HALT
