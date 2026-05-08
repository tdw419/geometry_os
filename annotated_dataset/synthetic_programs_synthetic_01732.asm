; DESCRIPTION: The GeOS assembly code initializes several registers and performs a counted animation loop. It draws lines and rectangles repeatedly with decreasing counts until the loops complete, then halts execution.

; counted animation
; initialization
  LDI r4, 684
  LDI r2, 16
  LDI r11, 1007
  LDI r7, 64
loop_0:
  ADDI r12, r15, 16
  OR r9, r0, r13
  LDI r14, 2702
  LDI r2, 102
  LDI r10, 0x3FDC23
  LDI r30, 0x3DC93F
  LDI r1, 2900
  LINE r14, r2, r10, r30, r1
  LDI r13, 1
  SUB r7, r7, r13
  JNZ r7, loop_0
  LDI r15, 0xE11830
loop_1:
  LDI r4, 128
  LDI r7, 128
  LDI r4, 0xEDA0CA
  LDI r4, 1
  LDI r1, 1
  RECTF r4, r7, r4, r4, r1
  XOR r11, r2, r6
  AND r8, r2, r9
  LDI r10, 1
  SUB r15, r15, r10
  JNZ r15, loop_1
  LDI r3, 2
loop_2:
  CMPI r9, r15, 8
  MUL r3, r14, r10
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_2
  HALT
