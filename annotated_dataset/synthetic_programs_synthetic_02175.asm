; DESCRIPTION: The GeOS assembly code initializes registers and enters a counted loop to perform bitwise operations and shifts. It then draws circles repeatedly until a counter reaches zero, after which the system halts.

; counted animation
; initialization
  LDI r2, 0
  LDI r12, 977
  LDI r7, 25
loop_0:
  ANDI r5, r4, 0x9260DE
  SHR r8, r10, r0
  LDI r13, 1
  SUB r7, r7, r13
  JNZ r7, loop_0
  LDI r3, 0x83DA34
loop_1:
  ANDI r5, r2, 32
  SHL r14, r11, r2
  LDI r20, 255
  LDI r15, 2241
  LDI r6, 291
  LDI r14, 0xAE8F06
  CIRCLE r20, r15, r6, r14
  LDI r9, 1
  SUB r3, r3, r9
  JNZ r3, loop_1
  HALT
