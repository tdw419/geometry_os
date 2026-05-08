; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic checks. Depending on the results of these checks, it either executes a series of arithmetic and logical operations or draws lines using the `LINE` instruction before halting execution.

; conditional logic
; initialization
  LDI r9, 10
  LDI r14, 8
  LDI r7, 256
  LDI r3, 0xFE779A
  LDI r15, 2
  CMP r11, r3
  JZ r11, else_0
  XOR r7, r14, r1
  ADD r19, r8, r10
  SHR r3, r9, r7
  JMP endif_1
else_0:
  LDI r1, 0xB86953
  LDI r10, 0x58DFE7
  LDI r8, 876
  LDI r6, 394
  LDI r4, 3984
  LINE r1, r10, r8, r6, r4
endif_1:
  CMP r15, r2
  JZ r15, else_2
  MOD r12, r10, r0
  AND r10, r3, r7
  XOR r3, r0, r5
  MUL r14, r10, r8
  JMP endif_3
else_2:
  LDI r10, 216
  LDI r4, 2676
  LDI r14, 0x8884E1
  LDI r5, 3724
  LDI r9, 16
  LINE r10, r4, r14, r5, r9
  LDI r12, 0xE3DCEE
  LDI r2, 0x92E8DB
  LDI r6, 32
  LDI r5, 439
  LDI r10, 255
  LINE r12, r2, r6, r5, r10
endif_3:
  HALT
