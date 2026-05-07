; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops that perform geometric operations such as drawing rectangles, modifying pixel colors, and filling areas. The loops execute until certain conditions are met, ultimately halting the program.

; counted animation
; initialization
  LDI r4, 0x69ED8A
  LDI r15, 10
  LDI r8, 0x6120DB
  LDI r11, 0x9B153E
  LDI r0, 276
  LDI r3, 128
  LDI r1, 0x40889A
loop_0:
  LDI r6, 128
  LDI r7, 0x53092F
  LDI r13, 3155
  LDI r13, 0
  LDI r28, 0x18DE4C
  RECTF r6, r7, r13, r13, r28
  MOD r12, r15, r6
  MOD r10, r8, r9
  MUL r1, r2, r8
  LDI r12, 1
  SUB r1, r1, r12
  JNZ r1, loop_0
  LDI r2, 23
loop_1:
  LDI r11, 0x0CC841
  LDI r8, 970
  LDI r3, 4
  WPIXEL
  ANDI r4, r3, 3
  LDI r3, 10
  LDI r6, 255
  LDI r11, 0xC5A3F9
  PSETI
  AND r5, r0, r7
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_1
  LDI r3, 39
loop_2:
  MUL r9, r10, r15
  AND r4, r5, r10
  LDI r0, 0x66E94E
  FILL r0
  SUBI r15, r4, 2
  LDI r13, 1
  SUB r3, r3, r13
  JNZ r3, loop_2
  HALT
