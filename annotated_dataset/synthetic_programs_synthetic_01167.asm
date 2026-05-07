; DESCRIPTION: The GeOS assembly code initializes registers with specific values, performs a series of logical and arithmetic operations including multiplication, AND, OR, XOR, and stores results in memory locations. It checks for a key input (IKEY), executes a loop based on this input, and finally uses the PSET instruction to set a pixel on the screen before halting execution.

; mixed program
; initialization
  LDI r9, 16
  LDI r6, 1366
  LDI r1, 2395
  LDI r11, 8
  LDI r6, 3015
  STORE r6, r1
  LOAD r5, r6
  LDI r15, 3397
  STORE r15, r0
  LOAD r10, r15
  LDI r14, 3509
  STORE r14, r8
  LOAD r7, r14
  LDI r1, 16
  STORE r1, r7
  LOAD r8, r1
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_0
  OR r3, r0, r14
  AND r6, r3, r9
  XOR r1, r12, r10
  LDI r18, 17
loop_1:
  MUL r11, r5, r14
  ANDI r12, r5, 209
  LDI r0, 1
  SUB r18, r18, r0
  JNZ r18, loop_1
  LDI r15, 11
  STORE r15, r4
  LOAD r11, r15
  LDI r6, 8
  STORE r6, r10
  LOAD r7, r6
  LDI r1, 1746
  STORE r1, r10
  LOAD r7, r1
  LDI r5, 1773
  STORE r5, r19
  LOAD r15, r5
  LDI r12, 256
  LDI r5, 1712
  LDI r13, 595
  PSET r12, r5, r13
  HALT
