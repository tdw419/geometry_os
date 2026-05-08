; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of logical operations, comparisons, and arithmetic calculations. It includes loops, conditional branching, and calls to drawing functions like `RECTF` and `LINE`, suggesting it is part of a graphics rendering or geometric computation routine.

; mixed program
; initialization
  LDI r31, 779
  LDI r5, 0xE59554
  LDI r3, 0x51E8B6
  LDI r14, 0x224DCB
  LDI r13, 0x9495AA
  LDI r6, 0x883B39
  LDI r4, 0xEEC624
  LDI r15, 2600
  OR r14, r11, r10
  CMP r0, r9
  JZ r0, else_0
  SHL r1, r7, r5
  SHL r6, r0, r1
  JMP endif_1
else_0:
  LDI r2, 0x565B51
  LDI r11, 3415
  LDI r6, 1127
  LDI r15, 1028
  LDI r11, 0
  RECTF r2, r11, r6, r15, r11
endif_1:
  LDI r6, 255
loop_2:
  ADDI r2, r1, 1
  CMPI r5, r11, 0x69A425
  SHR r15, r11, r4
  ADDI r7, r5, 0
  LDI r2, 1
  SUB r6, r6, r2
  JNZ r6, loop_2
  PUSH r10
  DIV r10, r12, r14
  OR r12, r27, r9
  XOR r11, r14, r1
  POP r10
  CMP r4, r9
  JZ r4, else_3
  AND r2, r0, r27
  ADD r0, r12, r7
  SHR r4, r8, r9
  MUL r12, r14, r4
  JMP endif_4
else_3:
  LDI r7, 2739
  LDI r9, 2485
  LDI r12, 256
  LDI r12, 0xB3E902
  LDI r2, 0x3E1AC3
  LINE r7, r9, r12, r12, r2
  LDI r4, 1319
  FILL r4
  LDI r9, 10
  LDI r3, 0x4D000C
  LDI r7, 0x411409
  PSETI
endif_4:
  HALT
