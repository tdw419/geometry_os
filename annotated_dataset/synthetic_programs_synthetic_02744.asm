; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it draws lines on the screen based on these values. The loop continues until a counter (`r9`) reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r6, 2231
  LDI r11, 2452
  LDI r4, 0x14D5E4
  LDI r9, 64
  LDI r8, 1635
  LDI r2, 718
  LDI r1, 0x6BCCF9
  LDI r7, 256
  LDI r9, 19
loop_0:
  CMPI r7, r15, 0x9A8FB0
  SUBI r5, r12, 0xD364C0
  LDI r5, 0xD42C13
  LDI r7, 2878
  LDI r10, 0x5BE9DE
  LDI r1, 3755
  LDI r3, 0
  LINE r5, r7, r10, r1, r3
  CMPI r11, r15, 32
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_0
  HALT
