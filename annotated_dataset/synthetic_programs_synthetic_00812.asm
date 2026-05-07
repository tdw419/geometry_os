; DESCRIPTION: This GeOS assembly code performs conditional operations and geometric drawing. It initializes registers with specific values, compares register contents, and executes different blocks of instructions based on the comparison results. The code includes multiplication, shift, and logical operations, as well as function calls for setting pixels (`PSETI`, `PSET`) and drawing rectangles (`RECTF`) and circles (`CIRCLE`). Finally, it halts execution.

; conditional logic
; initialization
  LDI r1, 0xCE07A8
  LDI r11, 8
  LDI r12, 0xCC9912
  LDI r0, 2152
  LDI r10, 810
  LDI r6, 0xE15E96
  LDI r3, 32
  CMP r8, r2
  JNZ r8, else_0
  MUL r5, r14, r9
  MUL r7, r5, r10
  SHR r10, r9, r0
  SHL r12, r8, r3
  JMP endif_1
else_0:
  LDI r15, 4
  LDI r15, 2575
  LDI r8, 0x2D7903
  PSETI
  LDI r2, 0x174065
  LDI r5, 0x2242A2
  LDI r12, 10
  LDI r11, 2296
  LDI r7, 1534
  RECTF r2, r5, r12, r11, r7
endif_1:
  CMP r7, r12
  JNZ r7, else_2
  OR r8, r11, r0
  SUB r21, r14, r5
  JMP endif_3
else_2:
  LDI r23, 256
  LDI r3, 0x9D25E2
  LDI r12, 8
  PSETI
  LDI r8, 3049
  LDI r15, 911
  LDI r13, 10
  LDI r3, 2
  LDI r15, 0xBF63D5
  RECTF r8, r15, r13, r3, r15
  LDI r3, 64
  LDI r11, 0x4749E9
  LDI r14, 3622
  LDI r3, 255
  CIRCLE r3, r11, r14, r3
  LDI r9, 0
  LDI r0, 234
  LDI r5, 1161
  PSET r9, r0, r5
endif_3:
  HALT
