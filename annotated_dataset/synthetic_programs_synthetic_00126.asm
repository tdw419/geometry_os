; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic based on comparisons between registers. It includes operations such as shifting bits, subtracting values, performing bitwise AND, and handling jumps to different sections of the code. Depending on the conditions met, it either modifies register values or executes drawing commands like PSET and LINE before halting execution.

; conditional logic
; initialization
  LDI r2, 2851
  LDI r13, 2058
  LDI r3, 0x80901E
  LDI r0, 0x1E697A
  LDI r8, 2
  LDI r1, 3000
  LDI r4, 886
  LDI r17, 0
  CMP r7, r1
  JNZ r7, else_0
  SHL r24, r6, r5
  SUB r0, r13, r11
  AND r13, r15, r3
  JMP endif_1
else_0:
  LDI r6, 32
  LDI r13, 2
  LDI r2, 3891
  PSET r6, r13, r2
endif_1:
  CMP r1, r28
  JZ r1, else_2
  MOD r16, r3, r15
  JMP endif_3
else_2:
  LDI r1, 0x867FDA
  FILL r1
  LDI r2, 2208
  LDI r10, 0x21ADC3
  LDI r5, 0x136757
  LDI r9, 4070
  LDI r12, 4037
  LINE r2, r10, r5, r9, r12
  LDI r2, 0xE0C6E1
  LDI r13, 2397
  LDI r12, 32
  PSETI
  LDI r31, 4
  LDI r10, 256
  LDI r25, 3654
  PSET r31, r10, r25
endif_3:
  HALT
