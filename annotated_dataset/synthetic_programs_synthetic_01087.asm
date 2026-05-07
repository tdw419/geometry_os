; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, enters a loop where it repeatedly writes pixels to the display and performs arithmetic operations, including multiplication, subtraction, and bit shifting. It also calls a function `func_1` which further manipulates registers through additional arithmetic and bitwise operations before returning control. The program halts when a condition between registers r7 and r11 is met.

; mixed program
; initialization
  LDI r7, 1
  LDI r5, 10
  LDI r11, 0x6363A8
  LDI r4, 32
  LDI r15, 0xACEB0A
  LDI r0, 0x0BE884
  LDI r4, 0xD54F7C
loop_0:
  LDI r11, 1
  LDI r3, 0x0D9073
  LDI r1, 0xC181D1
  WPIXEL
  CMPI r27, r1, 0x4D019E
  LDI r1, 1
  SUB r4, r4, r1
  JNZ r4, loop_0
  SHR r7, r12, r15
  SHLI r8, r4, 128
  SHL r10, r13, r0
  PUSH r13
  PUSH r13
  MUL r8, r7, r2
  MOD r9, r8, r0
  SUB r31, r14, r4
  MOD r14, r10, r1
  MUL r3, r6, r5
  POP r13
  POP r13
  LDI r10, 354
  LDI r9, 0x431896
  LDI r6, 64
  DRAWTEXT r10, r9, r6, "WORLD"
  SHLI r4, r5, 0xC0E133
  SHR r6, r8, r3
  SHL r14, r3, r7
  CALL func_1
func_1:
  SHL r8, r14, r10
  ADD r3, r5, r12
  SHR r3, r6, r14
  SHL r1, r0, r9
  ADD r14, r1, r15
  OR r1, r10, r7
  RET
  CMP r7, r11
  HALT
