; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a drawing loop. Within the loop, it performs various bitwise operations, conditional checks, and text rendering before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r7, 0x91E87F
  LDI r14, 8
  LDI r1, 3174
  LDI r11, 0x54D40B
  LDI r12, 0xC5A063
  LDI r30, 32
  LDI r0, 64
  LDI r15, 0x0BD982
main_0:
  CMPI r15, 0x6113CE
  SHL r9, r15, r5
  SHLI r11, r14, 0xFA0963
  LDI r0, 1352
  LDI r7, 2
  LDI r4, 3149
  TEXT r0, r7, r4, "HELLO"
  OR r12, r6, r23
  OR r14, r9, r10
  AND r13, r7, r14
  OR r9, r15, r2
  XOR r0, r5, r14
  XOR r11, r7, r4
  AND r15, r4, r9
  SHL r1, r11, r10
  SHLI r5, r12, 0xFBCE47
  FRAME
  JMP main_0
