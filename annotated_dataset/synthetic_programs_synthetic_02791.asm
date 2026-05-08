; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and checks a hardware key. If the key matches `0x3E0787`, it calls a function that performs bitwise operations, arithmetic, and conditional jumps. The function modifies registers based on conditions and finally stores results back into memory. If the key does not match, it executes an alternative path involving further loading, storing, and shifting operations. The program halts after completing its execution.

; mixed program
; initialization
  LDI r15, 10
  LDI r10, 4
  LDI r6, 3530
  LDI r1, 0xE4B4BF
  LDI r11, 0x0153B1
  LDI r23, 3253
  LDI r2, 0x448A10
  IKEY r14
  CMPI r14, 0x3E0787
  JNZ r14, key_0
  CALL func_1
func_1:
  SHR r12, r14, r23
  ADD r7, r2, r6
  ADD r1, r6, r11
  RET
  CMP r22, r6
  JNZ r22, else_2
  ADD r1, r0, r7
  DIV r15, r8, r11
  XOR r13, r12, r2
  MOD r6, r8, r12
  JMP endif_3
else_2:
  LDI r2, 0x4F7A7C
  LDI r2, 0x82ED40
  LDI r13, 3462
  LDI r8, 8
  LDI r3, 160
  LINE r2, r2, r13, r8, r3
endif_3:
  LDI r1, 1109
  STORE r1, r10
  LOAD r11, r1
  LDI r9, 0x709BD6
  STORE r9, r15
  LOAD r4, r9
  LDI r10, 3469
  STORE r10, r0
  LOAD r4, r10
  SHL r5, r4, r3
  SHLI r8, r13, 4
  SHLI r3, r14, 1
  SHL r4, r8, r7
  XOR r7, r2, r8
  XOR r1, r5, r21
  AND r3, r18, r1
  OR r13, r0, r11
  IKEY r11
  CMPI r11, 160
  JNZ r11, key_4
  DIV r14, r3, r1
  HALT
