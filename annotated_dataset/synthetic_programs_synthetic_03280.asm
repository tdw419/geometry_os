; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a counted loop. Within the loop, it performs bitwise operations and draws a line using the `LINE` instruction. The loop continues until a counter (`r5`) reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r19, 255
  LDI r6, 0x45C67B
  LDI r0, 3995
  LDI r4, 1372
  LDI r1, 10
  LDI r5, 0x0C4C97
loop_0:
  ANDI r15, r9, 232
  LDI r6, 256
  LDI r27, 230
  LDI r12, 2679
  LDI r6, 1036
  LDI r14, 543
  LINE r6, r27, r12, r6, r14
  OR r2, r1, r10
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_0
  HALT
