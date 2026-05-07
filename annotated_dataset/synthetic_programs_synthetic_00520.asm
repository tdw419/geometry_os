; DESCRIPTION: This GeOS assembly code initializes a graphics palette with specific colors, sets up variables for screen manipulation, and enters an infinite loop where it draws shapes and handles user input. The code uses various graphics commands like `FILL`, `PSET`, and `RECTF` to render on the screen and checks for key presses to modify its behavior.

; mixed program
; initialization
  LDI r3, 32
  LDI r14, 2
  LDI r9, 1
  LDI r12, 32
  LDI r10, 1504
; palette
  LDI r6, 0x215C
  LDI r3, 1
  LDI r0, 0xFFEE00
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x888800
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x888800
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x00AAFF
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xFF8800
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xFFEE00
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xFF8800
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x008888
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xAAAAAA
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x0044FF
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xFF00FF
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0x008888
  STORE r6, r0
  ADD r6, r6, r3
  LDI r0, 0xFFFF00
  STORE r6, r0
  ADD r6, r6, r3
  LDI r14, 0x9BF4CE
loop_0:
  LDI r11, 0x9F46EB
  FILL r11
  LDI r8, 1
  SUB r14, r14, r8
  JNZ r14, loop_0
  LDI r8, 0x40A3
  STORE r8, r8
  LOAD r4, r8
  LDI r7, 0x10A94E
  STORE r7, r6
  LOAD r2, r7
  LDI r5, 256
  STORE r5, r11
  LOAD r2, r5
  LDI r15, 1289
  STORE r15, r22
  LOAD r0, r15
  LDI r0, 765
  STORE r0, r4
  LOAD r14, r0
  IKEY r3
  CMPI r3, 32
  JNZ r3, key_1
  PUSH r15
  PUSH r5
  PUSH r8
  OR r4, r15, r11
  OR r12, r4, r9
  MUL r1, r3, r2
  SUB r3, r9, r15
  OR r15, r9, r11
  POP r8
  POP r5
  POP r15
  CMP r0, r15
  CMP r15, r1
  JNZ r15, else_2
  DIV r29, r10, r2
  ADD r14, r12, r15
  SHR r8, r12, r1
  SHR r10, r9, r4
  JMP endif_3
else_2:
  LDI r8, 3309
  LDI r11, 0xD88206
  LDI r9, 10
  PSET r8, r11, r9
  LDI r13, 1944
  LDI r10, 8
  LDI r14, 1495
  LDI r4, 895
  LDI r11, 0xC81F35
  RECTF r13, r10, r14, r4, r11
  LDI r10, 4027
  LDI r2, 0xBC0AED
  LDI r12, 1503
  LDI r7, 1497
  LDI r5, 3887
  RECTF r10, r2, r12, r7, r5
endif_3:
main_4:
  OR r6, r15, r5
  OR r12, r5, r8
  LDI r14, 0xD3646B
  LDI r9, 561
  LDI r12, 32
  PSETI
  FRAME
  JMP main_4
