; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a series of loops to perform counted animations. It uses arithmetic operations, conditional branches, and graphics instructions like drawing circles and setting pixels to animate on the screen. The animation involves decrementing counters and modifying register values to create visual effects until the program halts.

; counted animation
; initialization
  LDI r4, 64
  LDI r5, 2078
  LDI r1, 128
  LDI r2, 497
  LDI r14, 0x9AAB02
  LDI r0, 8
  LDI r0, 4
loop_0:
  MOD r11, r2, r0
  SUB r3, r5, r2
  LDI r7, 1
  SUB r0, r0, r7
  JNZ r0, loop_0
  LDI r2, 255
loop_1:
  LDI r9, 8
  LDI r6, 0xA50B64
  LDI r5, 8
  LDI r13, 10
  CIRCLE r9, r6, r5, r13
  ADDI r0, r8, 4
  LDI r8, 1
  SUB r2, r2, r8
  JNZ r2, loop_1
  LDI r5, 255
loop_2:
  CMPI r6, r5, 86
  ADDI r19, r14, 0xB5C95C
  SHR r1, r27, r10
  LDI r9, 0x309764
  LDI r23, 0x7E8434
  LDI r5, 369
  PSETI
  LDI r12, 1
  SUB r5, r5, r12
  JNZ r5, loop_2
  HALT
