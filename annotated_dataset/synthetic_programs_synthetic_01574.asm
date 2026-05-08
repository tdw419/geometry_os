; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs arithmetic and logical operations including multiplication, OR, XOR, shift, add, compare, and branch instructions. It conditionally executes a block of code based on the comparison result, then halts execution.

; mixed program
; initialization
  LDI r7, 0xBDA2D2
  LDI r3, 958
  LDI r10, 2148
  LDI r6, 2884
  LDI r15, 3638
  LDI r4, 0xCEF3F7
  PUSH r4
  PUSH r2
  PUSH r4
  MUL r8, r15, r7
  OR r13, r8, r12
  POP r4
  POP r2
  POP r4
  SAR r7, r10, r25
  SAR r11, r1, r6
  SHL r9, r13, r3
  SAR r5, r8, r22
  ADD r14, r3, r9
  CMP r10, r12
  JNZ r10, else_0
  SUB r7, r1, r10
  XOR r9, r13, r1
  JMP endif_1
else_0:
  LDI r2, 0x2C632A
  LDI r15, 8
  LDI r11, 0x39501A
  WPIXEL
endif_1:
  SAR r13, r14, r0
  SHLI r8, r2, 0x912A20
  SHR r1, r6, r4
  SHLI r14, r4, 128
  HALT
