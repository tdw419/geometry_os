; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop to perform arithmetic operations and draw rectangles on the screen. It includes function calls and conditional branches to manipulate data and execute specific drawing commands.

; mixed program
; initialization
  LDI r12, 64
  LDI r4, 3402
  LDI r20, 8
  LDI r7, 2
loop_0:
  SUBI r0, r4, 0xCCFE5F
  LDI r5, 16
  LDI r6, 0x703DEC
  LDI r12, 2417
  LDI r1, 0x9F3848
  LDI r20, 128
  RECTF r5, r6, r12, r1, r20
  SUBI r11, r4, 0x83DC9C
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_0
  LDI r0, 4
  STORE r0, r9
  LOAD r3, r0
  LDI r11, 128
  STORE r11, r2
  LOAD r3, r11
  LDI r2, 0
  STORE r2, r10
  LOAD r9, r2
  LDI r13, 32
  STORE r13, r10
  LOAD r8, r13
  LDI r4, 0x942F3E
  STORE r4, r5
  LOAD r8, r4
  LDI r7, 23
loop_1:
  CMPI r13, r7, 0x2E3B47
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_1
  CALL func_2
func_2:
  SHR r9, r14, r5
  MOD r13, r15, r5
  SHL r12, r5, r9
  ADD r8, r7, r10
  XOR r11, r5, r12
  SHL r6, r0, r4
  RET
  AND r12, r9, r5
  AND r12, r6, r13
  XOR r0, r14, r15
  SHR r8, r2, r12
  SHLI r2, r7, 4
  SAR r5, r3, r15
  SHL r6, r4, r8
  CMP r12, r8
  JNZ r12, else_3
  SUB r14, r10, r15
  JMP endif_4
else_3:
  LDI r10, 185
  LDI r2, 0xDC91BA
  LDI r9, 919
  LDI r2, 0xE21F35
  LDI r4, 0x359369
  RECTF r10, r2, r9, r2, r4
  LDI r14, 0xD37907
  LDI r2, 2878
  LDI r12, 0x6A98E0
  LDI r14, 255
  LDI r3, 64
  LINE r14, r2, r12, r14, r3
endif_4:
main_5:
  ANDI r12, r3, 0x6839D9
  SHL r31, r8, r11
  LDI r11, 218
  LDI r3, 16
  LDI r4, 255
  TEXT r11, r3, r4, "HELLO"
  FRAME
  JMP main_5
