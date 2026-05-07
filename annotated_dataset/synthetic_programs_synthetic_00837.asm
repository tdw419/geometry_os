; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a counted animation involving conditional loops and register operations. It includes comparisons, logical operations, and drawing commands to render graphics, ultimately halting execution after completing the animation sequence.

; counted animation
; initialization
  LDI r12, 32
  LDI r3, 1
  LDI r10, 0x397733
  LDI r14, 882
  LDI r4, 1
  LDI r15, 0
  LDI r2, 0x259D5A
  LDI r6, 8
  LDI r6, 39
loop_0:
  CMPI r8, r10, 255
  CMPI r12, r3, 0
  AND r12, r2, r10
  CMPI r5, r13, 0xEC2C95
  LDI r11, 1
  SUB r6, r6, r11
  JNZ r6, loop_0
  LDI r7, 4
loop_1:
  OR r2, r9, r4
  LDI r5, 1
  SUB r7, r7, r5
  JNZ r7, loop_1
  LDI r2, 5
loop_2:
  LDI r9, 2
  LDI r5, 32
  LDI r8, 4
  LDI r5, 0x9EF246
  LDI r13, 2837
  RECTF r9, r5, r8, r5, r13
  OR r9, r10, r1
  ANDI r2, r5, 4
  LDI r9, 1
  SUB r2, r2, r9
  JNZ r2, loop_2
  HALT
