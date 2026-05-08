; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations including shifts and logicals (AND, OR, XOR), compares register contents, and loops until a condition is met. The program ends with a halt instruction.

; mixed program
; initialization
  LDI r10, 0x1F5F3B
  LDI r0, 3805
  LDI r22, 0
  LDI r13, 256
  LDI r2, 2240
  LDI r1, 4
  LDI r3, 1
  LDI r13, 0x340ED1
  LDI r14, 8
  PSET r3, r13, r14
  SAR r8, r13, r2
  SHL r2, r31, r9
  CMP r5, r11
  CMPI r6, 128
  LDI r10, 3150
  LDI r6, 2439
  LDI r11, 1378
  PSETI
  LDI r13, 2
loop_0:
  SUBI r8, r13, 0xF29228
  SHR r25, r4, r14
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_0
  AND r13, r10, r4
  XOR r8, r13, r9
  AND r11, r15, r1
  XOR r5, r14, r13
  HALT
