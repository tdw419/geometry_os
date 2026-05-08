; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs various operations including conditional jumps, arithmetic calculations like multiplication and division, bitwise operations such as AND and OR, and drawing functions like setting pixels, circles, rectangles, and lines on the screen. The code also handles keyboard input to execute different graphical operations based on key presses.

; mixed program
; initialization
  LDI r6, 3436
  LDI r8, 255
  LDI r13, 64
  CMP r12, r2
  JZ r12, else_0
  SHR r7, r14, r2
  MUL r0, r4, r1
  MOD r7, r13, r8
  JMP endif_1
else_0:
  LDI r20, 3268
  LDI r12, 0x90255F
  LDI r9, 1
  WPIXEL
endif_1:
  IKEY r0
  CMPI r0, 207
  JNZ r0, key_2
  IKEY r11
  CMPI r11, 161
  JNZ r11, key_3
  SHR r13, r9, r3
  SHR r0, r10, r9
  SHR r1, r14, r3
  SAR r7, r6, r15
  CMP r27, r10
  JNZ r27, else_4
  DIV r3, r2, r10
  SHR r14, r27, r3
  JMP endif_5
else_4:
  LDI r4, 255
  LDI r13, 4
  LDI r5, 3610
  PSETI
  LDI r14, 256
  LDI r4, 0xA9886A
  LDI r1, 64
  LDI r9, 744
  LDI r2, 3059
  RECTF r14, r4, r1, r9, r2
endif_5:
  CMP r7, r9
  JZ r7, else_6
  AND r15, r10, r2
  OR r1, r11, r12
  AND r7, r0, r2
  JMP endif_7
else_6:
  LDI r0, 64
  LDI r1, 2849
  LDI r13, 0x9C63AF
  LDI r15, 797
  CIRCLE r0, r1, r13, r15
  LDI r5, 0xE04835
  FILL r5
  LDI r3, 0
  FILL r3
  LDI r3, 10
  LDI r12, 929
  LDI r10, 1
  WPIXEL
endif_7:
  CMP r2, r6
  JZ r2, else_8
  MOD r15, r1, r8
  DIV r6, r2, r11
  JMP endif_9
else_8:
  LDI r14, 0x4CCE7A
  LDI r8, 32
  LDI r3, 3587
  LDI r5, 199
  CIRCLE r14, r8, r3, r5
  LDI r3, 0xB09602
  LDI r14, 255
  LDI r0, 0xFCB771
  WPIXEL
  LDI r27, 2892
  LDI r6, 0x777298
  LDI r15, 16
  LDI r15, 0x56ABBC
  LDI r5, 4
  RECTF r27, r6, r15, r15, r5
  LDI r0, 10
  LDI r15, 1
  LDI r9, 1
  LDI r6, 255
  LDI r11, 365
  LINE r0, r15, r9, r6, r11
endif_9:
main_10:
  CMP r23, r10
  OR r6, r4, r10
  AND r6, r5, r3
  OR r14, r1, r9
  FRAME
  JMP main_10
