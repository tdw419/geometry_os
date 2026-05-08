; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops to perform operations such as setting pixels (`PSETI`), shifting bits (`SHR`), and performing arithmetic operations like subtraction (`SUB`). The loops decrement counters and continue until they reach zero, at which point the program halts.

; counted animation
; initialization
  LDI r5, 0x71AB0C
  LDI r4, 217
  LDI r3, 16
  LDI r7, 3779
  LDI r9, 0x425C79
  LDI r12, 3603
  LDI r19, 0x4B6104
  LDI r11, 0xE05655
  LDI r15, 0x80BD65
loop_0:
  LDI r14, 0x9CA809
  LDI r14, 0xEDEDAA
  LDI r7, 64
  PSETI
  SHR r3, r7, r5
  LDI r0, 1117
  LDI r8, 0x668D2E
  LDI r6, 2664
  PSET r0, r8, r6
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_0
  LDI r14, 128
loop_1:
  LDI r3, 3286
  LDI r2, 1578
  LDI r13, 0x6182B2
  PSETI
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_1
  LDI r1, 0x4FD7D5
loop_2:
  ANDI r8, r13, 66
  LDI r2, 1
  SUB r1, r1, r2
  JNZ r1, loop_2
  HALT
