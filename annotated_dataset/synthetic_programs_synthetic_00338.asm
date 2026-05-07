; DESCRIPTION: This GeOS assembly code initializes registers with specific values and performs conditional operations based on comparisons. It includes arithmetic operations like addition and subtraction, bitwise operations such as XOR and OR, and geometric drawing commands like `LINE`, `RECTF`, and pixel manipulation functions like `WPIXEL` and `FILL`. The code also calls a function (`func_4`) that involves multiplication, shifting, and logical operations on registers.

; mixed program
; initialization
  LDI r12, 4
  LDI r6, 10
  CMP r23, r5
  JNZ r23, else_0
  ADD r10, r12, r2
  JMP endif_1
else_0:
  LDI r11, 3678
  LDI r7, 0xF5CE33
  LDI r13, 3028
  LDI r5, 0x8810CF
  LDI r6, 4
  LINE r11, r7, r13, r5, r6
  LDI r15, 1887
  LDI r13, 0x99C0E9
  LDI r25, 959
  WPIXEL
  LDI r6, 3673
  FILL r6
endif_1:
  CMP r0, r9
  JZ r0, else_2
  SUB r5, r8, r26
  ADD r15, r5, r6
  JMP endif_3
else_2:
  LDI r3, 0x097B8C
  LDI r4, 1572
  LDI r1, 0x015203
  LDI r11, 4014
  LDI r18, 498
  RECTF r3, r4, r1, r11, r18
  LDI r12, 312
  LDI r0, 0xA74936
  LDI r8, 649
  PSETI
  LDI r6, 0x8C64EB
  LDI r7, 4043
  LDI r5, 0x37277F
  WPIXEL
  LDI r11, 0xAA2CD3
  FILL r11
endif_3:
  CALL func_4
func_4:
  MUL r15, r3, r1
  XOR r7, r2, r13
  SHL r20, r11, r25
  OR r12, r0, r2
  SHR r0, r2, r6
  SHR r12, r9, r6
  RET
  HALT
