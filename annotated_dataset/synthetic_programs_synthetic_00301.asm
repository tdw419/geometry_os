; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs bitwise operations including XOR and shift operations, checks input keys against conditions, and halts execution based on certain criteria.

; mixed program
; initialization
  LDI r12, 3160
  LDI r1, 0xB83083
  LDI r6, 1213
  LDI r8, 160
  XOR r14, r15, r6
  IKEY r3
  CMPI r3, 2
  JNZ r3, key_0
  SAR r9, r23, r7
  SHL r8, r7, r10
  SHLI r15, r12, 0x7D6D83
  XOR r9, r1, r10
  XOR r7, r15, r0
  AND r13, r3, r16
  IKEY r1
  CMPI r1, 25
  JNZ r1, key_1
  HALT
