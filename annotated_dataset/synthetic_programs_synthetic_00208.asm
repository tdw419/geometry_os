; DESCRIPTION: This GeOS assembly code performs conditional logic based on the comparison of registers. It initializes several registers with specific values and executes different geometric operations such as shifting, adding, drawing lines, circles, rectangles, and setting pixels based on the conditions met. The code ultimately halts execution after completing all operations.

; conditional logic
; initialization
  LDI r7, 255
  LDI r3, 3256
  CMP r4, r1
  JZ r4, else_0
  SHR r16, r2, r3
  ADD r10, r13, r14
  JMP endif_1
else_0:
  LDI r8, 670
  LDI r2, 255
  LDI r4, 8
  LDI r12, 3316
  LDI r6, 0
  LINE r8, r2, r4, r12, r6
  LDI r3, 3819
  LDI r7, 10
  LDI r29, 0x46E9D9
  PSET r3, r7, r29
endif_1:
  CMP r2, r4
  JNZ r2, else_2
  SHR r2, r12, r3
  JMP endif_3
else_2:
  LDI r7, 16
  LDI r3, 4
  LDI r6, 541
  LDI r14, 4
  CIRCLE r7, r3, r6, r14
  LDI r2, 1471
  LDI r20, 3295
  LDI r3, 0x7B15AC
  LDI r8, 2628
  LDI r5, 128
  RECTF r2, r20, r3, r8, r5
  LDI r8, 2034
  LDI r13, 3563
  LDI r3, 0x71F3C2
  LDI r13, 0x0C8E1F
  CIRCLE r8, r13, r3, r13
  LDI r15, 0xAAFAAA
  LDI r11, 457
  LDI r12, 32
  PSET r15, r11, r12
endif_3:
  CMP r1, r11
  JNZ r1, else_4
  ADD r8, r23, r3
  SHR r12, r0, r6
  JMP endif_5
else_4:
  LDI r0, 0xA39237
  LDI r15, 32
  LDI r22, 32
  LDI r10, 255
  LDI r8, 1
  LINE r0, r15, r22, r10, r8
  LDI r6, 3735
  FILL r6
  LDI r13, 0xB5D5BE
  FILL r13
endif_5:
  HALT
