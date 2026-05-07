; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, calls a function `func_0` which performs arithmetic and logical operations on these registers, and then checks for a specific key input before potentially halting the system.

; mixed program
; initialization
  LDI r4, 32
  LDI r12, 1998
  LDI r7, 1
  LDI r29, 0x5D089C
  LDI r17, 3739
  LDI r6, 16
  LDI r15, 1613
  CALL func_0
func_0:
  SUB r14, r0, r2
  MUL r11, r13, r3
  SUB r7, r14, r2
  SHL r4, r5, r3
  ADD r9, r5, r13
  RET
  LDI r2, 3624
  LDI r2, 4
  LDI r3, 10
  PSET r2, r2, r3
  IKEY r1
  CMPI r1, 0xE80472
  JNZ r1, key_1
  HALT
