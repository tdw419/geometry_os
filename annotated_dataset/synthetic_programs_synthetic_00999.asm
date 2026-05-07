; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette in memory, and enters a loop where it performs division operations, draws lines, and sets pixels on a screen. It also includes function calls and conditional logic that manipulate register contents before halting execution.

; mixed program
; initialization
  LDI r6, 885
  LDI r5, 4
  LDI r1, 1143
  LDI r0, 346
  LDI r14, 893
  LDI r11, 0x0BB5BD
; palette
  LDI r6, 0x80F7
  LDI r19, 1
  LDI r25, 0xFF8800
  STORE r6, r25
  ADD r6, r6, r19
  LDI r25, 0x550077
  STORE r6, r25
  ADD r6, r6, r19
  LDI r25, 0xFFAA00
  STORE r6, r25
  ADD r6, r6, r19
  LDI r25, 0x00FF44
  STORE r6, r25
  ADD r6, r6, r19
  LDI r25, 0x000066
  STORE r6, r25
  ADD r6, r6, r19
  LDI r25, 0x0000FF
  STORE r6, r25
  ADD r6, r6, r19
  LDI r4, 11
loop_0:
  DIV r10, r7, r5
  LDI r6, 10
  LDI r0, 0x697DED
  LDI r11, 0x3763FD
  LDI r1, 256
  LDI r4, 0x0776B1
  LINE r6, r0, r11, r1, r4
  LDI r9, 3452
  LDI r11, 10
  LDI r10, 2
  PSET r9, r11, r10
  ANDI r10, r13, 2
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  SHR r7, r13, r0
  SHLI r12, r10, 0x2F2AA5
  SHL r10, r7, r4
  CALL func_1
func_1:
  AND r13, r4, r15
  SHR r14, r11, r4
  XOR r14, r8, r11
  DIV r9, r12, r17
  XOR r9, r10, r4
  AND r15, r5, r11
  RET
  CMPI r5, 62
  OR r5, r15, r0
  OR r10, r5, r12
  OR r15, r13, r10
  LDI r5, 11
loop_2:
  SUBI r0, r8, 16
  MOD r14, r1, r9
  OR r6, r5, r31
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_2
  HALT
