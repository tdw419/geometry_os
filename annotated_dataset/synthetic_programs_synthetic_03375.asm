; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic checks. Depending on the results of these comparisons, it either executes arithmetic operations and modifies register contents or draws geometric shapes using functions like `LINE` and `RECTF`. The execution flow is controlled by conditional jumps (`JNZ`, `CMP`) to different sections of the code labeled as `else_0`, `else_2`, etc., until a final halt instruction (`HALT`).

; conditional logic
; initialization
  LDI r13, 4
  LDI r8, 64
  LDI r11, 3871
  LDI r7, 753
  LDI r20, 647
  LDI r2, 2643
  CMP r11, r0
  JNZ r11, else_0
  MUL r10, r6, r4
  OR r2, r23, r15
  OR r0, r14, r13
  JMP endif_1
else_0:
  LDI r9, 16
  LDI r5, 4
  LDI r12, 0xEA46C9
  LDI r12, 0x9EFB68
  LDI r7, 0x075FAF
  LINE r9, r5, r12, r12, r7
  LDI r13, 0x7183D8
  LDI r5, 16
  LDI r11, 2431
  PSET r13, r5, r11
endif_1:
  CMP r15, r10
  JNZ r15, else_2
  SHL r3, r13, r0
  MOD r3, r6, r7
  JMP endif_3
else_2:
  LDI r8, 2486
  FILL r8
  LDI r4, 0x5540C5
  LDI r4, 3743
  LDI r11, 0
  PSETI
  LDI r7, 3715
  LDI r5, 128
  LDI r0, 0xBD2DBA
  LDI r14, 64
  LDI r4, 16
  LINE r7, r5, r0, r14, r4
  LDI r13, 256
  LDI r0, 2918
  LDI r11, 0xDF9139
  LDI r6, 8
  LDI r0, 1946
  RECTF r13, r0, r11, r6, r0
endif_3:
  CMP r11, r0
  JNZ r11, else_4
  DIV r4, r13, r11
  JMP endif_5
else_4:
  LDI r11, 0xC91B73
  LDI r4, 0x2788C0
  LDI r14, 270
  LDI r3, 0x17DBC1
  LDI r7, 1301
  RECTF r11, r4, r14, r3, r7
  LDI r13, 4
  LDI r7, 32
  LDI r11, 255
  PSETI
  LDI r3, 0x8B783E
  LDI r12, 1
  LDI r12, 0x0EEF07
  LDI r14, 1787
  LDI r5, 2
  RECTF r3, r12, r12, r14, r5
endif_5:
  HALT
