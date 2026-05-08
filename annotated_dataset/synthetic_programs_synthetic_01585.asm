; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of operations including conditional branching, shifting, multiplying, filling, drawing lines, setting pixels, and updating frame information in a loop. The program repeatedly executes a main section that involves bitwise operations, arithmetic calculations, and register manipulations until a condition is met.

; mixed program
; initialization
  LDI r5, 0x3B780A
  LDI r2, 0x0C2335
  LDI r13, 0x703BF6
  LDI r1, 3120
  LDI r7, 641
  CMP r3, r9
  JNZ r3, else_0
  SHL r4, r5, r2
  JMP endif_1
else_0:
  LDI r1, 2
  LDI r10, 0x92737C
  LDI r13, 3995
  WPIXEL
  LDI r11, 0xA9A406
  LDI r19, 16
  LDI r5, 0x9D6CC5
  LDI r5, 0x58B5AD
  LDI r8, 3381
  LINE r11, r19, r5, r5, r8
  LDI r10, 2
  LDI r9, 3032
  LDI r11, 1558
  PSET r10, r9, r11
endif_1:
  LDI r25, 0x97B4EB
loop_2:
  MUL r24, r15, r13
  LDI r5, 2487
  FILL r5
  ADDI r14, r13, 47
  LDI r0, 557
  LDI r2, 10
  LDI r3, 1
  WPIXEL
  LDI r1, 1
  SUB r25, r25, r1
  JNZ r25, loop_2
  PUSH r9
  PUSH r12
  PUSH r1
  ADD r1, r18, r14
  AND r22, r13, r8
  AND r15, r9, r27
  OR r3, r14, r0
  POP r1
  POP r12
  POP r9
main_3:
  OR r2, r12, r7
  OR r1, r29, r15
  XOR r6, r7, r11
  XOR r1, r11, r15
  SHL r15, r14, r5
  SHL r11, r13, r3
  SHR r13, r10, r7
  SUBI r4, r11, 0
  SHLI r11, r0, 0x7D8F26
  SAR r11, r9, r15
  SHLI r9, r6, 3
  SHR r14, r8, r22
  AND r11, r0, r2
  XOR r2, r14, r10
  OR r7, r5, r12
  FRAME
  JMP main_3
