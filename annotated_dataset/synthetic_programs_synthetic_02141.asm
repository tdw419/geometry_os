; DESCRIPTION: This GeOS assembly code performs conditional logic operations and initializes various registers with specific values. It then checks conditions to execute different blocks of geometric drawing instructions such as setting pixels (`PSETI`), drawing rectangles (`RECTF`), and lines (`LINE`). The code concludes by halting execution.

; conditional logic
; initialization
  LDI r10, 2098
  LDI r12, 505
  LDI r13, 16
  LDI r15, 0xC8B246
  LDI r1, 255
  LDI r9, 0x5C8CDD
  LDI r0, 32
  CMP r15, r6
  JNZ r15, else_0
  XOR r11, r4, r0
  MUL r0, r4, r13
  OR r1, r8, r10
  SUB r9, r13, r8
  JMP endif_1
else_0:
  LDI r5, 8
  LDI r2, 2207
  LDI r6, 64
  PSETI
  LDI r29, 128
  LDI r13, 2441
  LDI r4, 902
  LDI r25, 8
  LDI r1, 4040
  RECTF r29, r13, r4, r25, r1
  LDI r4, 1320
  LDI r11, 128
  LDI r10, 2943
  PSETI
  LDI r8, 2452
  LDI r3, 0x523F0C
  LDI r13, 255
  LDI r2, 0x9A9E17
  LDI r1, 134
  LINE r8, r3, r13, r2, r1
endif_1:
  CMP r11, r10
  JNZ r11, else_2
  DIV r15, r13, r9
  SHL r5, r2, r8
  JMP endif_3
else_2:
  LDI r2, 2678
  LDI r3, 0
  LDI r15, 2660
  PSET r2, r3, r15
  LDI r5, 1016
  LDI r12, 0xA78A36
  LDI r0, 0xC167FA
  LDI r8, 0xC41E2B
  LDI r1, 128
  LINE r5, r12, r0, r8, r1
  LDI r3, 1
  LDI r12, 659
  LDI r3, 0x85215A
  PSETI
endif_3:
  CMP r13, r5
  JZ r13, else_4
  DIV r5, r2, r1
  SUB r11, r5, r10
  ADD r3, r4, r14
  JMP endif_5
else_4:
  LDI r0, 3398
  LDI r0, 8
  LDI r11, 0xCA9895
  WPIXEL
  LDI r19, 1055
  LDI r3, 64
  LDI r10, 256
  PSET r19, r3, r10
endif_5:
  HALT
