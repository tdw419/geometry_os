; DESCRIPTION: This GeOS assembly code performs conditional logic operations, initializes several registers with specific values, and executes different sets of instructions based on the comparison results. It includes multiplication, modulus, bitwise operations, and drawing functions like `PSETI`, `FILL`, and `RECTF`. The program halts execution at the end.

; conditional logic
; initialization
  LDI r14, 1362
  LDI r6, 8
  CMP r6, r5
  JZ r6, else_0
  MUL r9, r6, r2
  MOD r5, r8, r13
  JMP endif_1
else_0:
  LDI r0, 49
  LDI r14, 0x1D15F7
  LDI r14, 0x8C9622
  PSETI
endif_1:
  CMP r13, r15
  JNZ r13, else_2
  OR r10, r0, r12
  MUL r6, r13, r2
  AND r0, r13, r2
  JMP endif_3
else_2:
  LDI r8, 0x5DC7CA
  FILL r8
  LDI r10, 255
  LDI r15, 2933
  LDI r14, 1436
  LDI r8, 8
  LDI r5, 255
  RECTF r10, r15, r14, r8, r5
endif_3:
  CMP r8, r7
  JZ r8, else_4
  SHR r14, r13, r7
  OR r6, r2, r18
  JMP endif_5
else_4:
  LDI r14, 0xD30A27
  LDI r5, 3280
  LDI r5, 0
  WPIXEL
endif_5:
  HALT
