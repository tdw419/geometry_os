; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a series of conditional operations. It includes comparisons, jumps, arithmetic operations, and function calls to draw geometric shapes like lines, rectangles, and text on the screen. The program also handles pixel manipulation and memory storage/retrieval.

; mixed program
; initialization
  LDI r12, 662
  LDI r8, 1854
  LDI r6, 0x86AAE5
  LDI r3, 4002
  LDI r10, 128
  LDI r9, 1233
  LDI r5, 0x3A9311
  CMP r8, r3
  JNZ r8, else_0
  ADD r1, r0, r15
  SHR r24, r4, r6
  ADD r5, r7, r4
  JMP endif_1
else_0:
  LDI r0, 3278
  LDI r5, 0x55F1CD
  LDI r2, 4
  WPIXEL
  LDI r15, 1858
  LDI r12, 16
  LDI r8, 0xD15C31
  PSETI
endif_1:
  LDI r6, 1
  LDI r14, 0x6A4F32
  LDI r6, 0xBC7228
  TEXT r6, r14, r6, "HELLO"
  LDI r12, 31
loop_2:
  OR r6, r19, r23
  ADDI r4, r2, 255
  ADDI r6, r3, 2
  LDI r15, 1
  SUB r12, r12, r15
  JNZ r12, loop_2
  CALL func_3
func_3:
  AND r2, r16, r4
  ADD r3, r2, r13
  MUL r11, r1, r13
  AND r13, r0, r1
  RET
  CMP r14, r6
  JNZ r14, else_4
  SHR r0, r6, r9
  SUB r6, r2, r11
  SHR r10, r5, r0
  MOD r7, r4, r0
  JMP endif_5
else_4:
  LDI r21, 0x6D3699
  LDI r6, 0
  LDI r2, 895
  PSET r21, r6, r2
  LDI r7, 1144
  LDI r5, 0xBCB81B
  LDI r0, 2955
  PSET r7, r5, r0
  LDI r14, 3356
  LDI r0, 3438
  LDI r13, 64
  WPIXEL
  LDI r11, 0xB73262
  LDI r5, 505
  LDI r1, 0xC9CEFB
  LDI r12, 1
  LDI r15, 1306
  LINE r11, r5, r1, r12, r15
endif_5:
  CMP r6, r29
  JZ r6, else_6
  MOD r9, r10, r0
  DIV r0, r1, r3
  SHL r14, r12, r1
  AND r11, r10, r6
  JMP endif_7
else_6:
  LDI r4, 128
  LDI r24, 3973
  LDI r7, 4
  LDI r15, 0x7D49A1
  LDI r1, 3644
  RECTF r4, r24, r7, r15, r1
  LDI r14, 1
  LDI r15, 659
  LDI r2, 128
  PSETI
  LDI r24, 10
  LDI r5, 0xE6A66B
  LDI r4, 0xE2BB9C
  LDI r9, 0xECB074
  LDI r14, 32
  LINE r24, r5, r4, r9, r14
  LDI r12, 3428
  LDI r3, 0x7178B9
  LDI r7, 32
  WPIXEL
endif_7:
  LDI r15, 487
  STORE r15, r12
  LOAD r10, r15
  LDI r7, 0x235FD9
  STORE r7, r2
  LOAD r4, r7
main_8:
  CMP r6, r15
  CMPI r4, 113
  FRAME
  JMP main_8
