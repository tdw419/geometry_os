; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations, arithmetic operations, and function calls. The primary operations include AND, SHL (shift left), SUB (subtract), JNZ (jump if not zero), OR, and CALL to a subroutine `func_1`. Within `func_1`, additional operations such as MUL (multiply) are performed before returning control to the main loop. Conditional jumps based on comparisons and IKEY input processing are also included.

; mixed program
; initialization
  LDI r12, 12
  LDI r5, 4
  LDI r14, 3360
  LDI r7, 0x9AEAD3
  LDI r8, 2948
  LDI r1, 166
  LDI r10, 376
  LDI r4, 256
loop_0:
  ANDI r9, r14, 32
  SHL r15, r5, r0
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_0
  OR r4, r0, r5
  CALL func_1
func_1:
  OR r15, r4, r13
  SHL r6, r4, r5
  SUB r3, r0, r10
  OR r5, r4, r15
  MUL r8, r2, r12
  RET
  OR r2, r8, r5
  IKEY r6
  CMPI r6, 0x9A2949
  JNZ r6, key_2
  SHL r14, r3, r12
  SHR r3, r7, r10
  SHR r8, r11, r4
  XOR r8, r31, r5
  XOR r14, r6, r11
  HALT
