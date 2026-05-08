; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and performs a series of bitwise operations, including additions, ANDs, ORs, SHLIs (shift left immediate), and a multiplication. The code ultimately halts execution after completing these computations.

; math computation
; initialization
  LDI r5, 827
  LDI r1, 0x5B8EC7
  LDI r10, 386
  LDI r13, 16
  LDI r14, 128
  LDI r6, 148
  LDI r4, 0x917F8A
  ADDI r9, r1, 231
  ANDI r1, r3, 255
  SHLI r4, r18, 16
  SHLI r5, r10, 0xF65938
  AND r12, r7, r9
  OR r1, r0, r11
  AND r6, r12, r10
  AND r6, r10, r13
  AND r3, r12, r0
  AND r7, r5, r6
  ANDI r7, r15, 1
  MUL r6, r7, r0
  AND r6, r1, r9
  AND r9, r3, r14
  HALT
