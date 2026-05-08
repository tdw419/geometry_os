; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of arithmetic operations, logical operations, and pixel drawing functions. It includes loops, function calls, and conditional jumps to manipulate data and execute complex sequences of instructions.

; mixed program
; initialization
  LDI r13, 1
  LDI r8, 3995
  LDI r4, 0xB1DCFD
  LDI r10, 0xCC672D
  LDI r3, 1529
  LDI r7, 32
  LDI r6, 1531
  PUSH r1
  PUSH r11
  PUSH r12
  PUSH r11
  SUB r7, r5, r3
  OR r11, r9, r8
  AND r7, r2, r5
  MOD r14, r0, r6
  POP r11
  POP r12
  POP r11
  POP r1
  LDI r12, 2
  LDI r27, 0x2306C8
  LDI r12, 0x6C47C9
  WPIXEL
  PUSH r14
  PUSH r8
  ADD r7, r10, r11
  DIV r2, r10, r7
  MOD r3, r6, r8
  SHR r7, r0, r15
  MUL r1, r0, r14
  POP r8
  POP r14
  LDI r0x4012, 0x40120x401206
  STORE r2, r13
  LOAD r15, r2
  LDI r4, 281
  STORE r4, r6
  LOAD r9, r4
  LDI r3, 2063
  STORE r3, r4
  LOAD r9, r3
  LDI r8, 0
  STORE r8, r8
  LOAD r14, r8
  LDI r7, 64
  STORE r7, r7
  LOAD r4, r7
  LDI r11, 0x48264C
loop_0:
  SHR r3, r7, r25
  SUBI r12, r5, 4
  LDI r11, 0xDCDA69
  FILL r11
  LDI r3, 1
  SUB r11, r11, r3
  JNZ r11, loop_0
  CALL func_1
func_1:
  MUL r9, r2, r5
  SUB r13, r7, r5
  DIV r28, r3, r10
  ADD r10, r2, r15
  AND r11, r9, r4
  RET
  LDI r21, 128
loop_2:
  LDI r0, 0xC37479
  LDI r12, 0x4662B8
  LDI r11, 1813
  WPIXEL
  CMPI r0, r6, 32
  LDI r25, 1
  SUB r21, r21, r25
  JNZ r21, loop_2
  LDI r9, 42
loop_3:
  LDI r2, 2
  LDI r15, 255
  LDI r0, 3471
  WPIXEL
  DIV r9, r15, r1
  LDI r5, 3320
  FILL r5
  SUBI r25, r1, 0x569AB2
  LDI r12, 1
  SUB r9, r9, r12
  JNZ r9, loop_3
  HALT
