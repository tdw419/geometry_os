; DESCRIPTION: This GeOS assembly code initializes registers with specific values, calls a function that performs arithmetic and logical operations on these registers, and then draws the text "WORLD" at coordinates (10, 2102) using a font size of 4. The program halts after executing these instructions.

; mixed program
; initialization
  LDI r13, 0x6F3CC8
  LDI r7, 0x320C2F
  CALL func_0
func_0:
  SHR r12, r25, r0
  DIV r3, r2, r12
  SUB r11, r3, r27
  AND r15, r0, r5
  ADD r9, r6, r15
  MOD r27, r4, r12
  RET
  PUSH r14
  PUSH r0
  OR r1, r7, r8
  AND r4, r2, r15
  SHL r15, r5, r10
  XOR r10, r5, r8
  SUB r7, r14, r4
  POP r0
  POP r14
  LDI r7, 10
  LDI r8, 2102
  LDI r0, 4
  DRAWTEXT r7, r8, r0, "WORLD"
  HALT
