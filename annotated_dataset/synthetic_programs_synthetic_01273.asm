; DESCRIPTION: This GeOS assembly code initializes registers with specific values, performs arithmetic and logical operations, conditionally executes different branches based on register comparisons, and uses functions like TEXT and LINE to display text and draw lines on the screen. The program ultimately halts execution after completing its tasks.

; mixed program
; initialization
  LDI r2, 255
  LDI r10, 128
  LDI r14, 0x2168BB
  LDI r7, 2898
  LDI r3, 106
  PUSH r2
  PUSH r6
  PUSH r0
  SUB r31, r6, r3
  OR r11, r6, r14
  AND r15, r5, r0
  POP r0
  POP r6
  POP r2
  LDI r8, 0x778092
  LDI r5, 710
  LDI r0, 0x8635A3
  TEXT r8, r5, r0, "HELLO"
  CMP r13, r7
  JZ r13, else_0
  XOR r24, r8, r10
  JMP endif_1
else_0:
  LDI r6, 1080
  LDI r0, 0x4BD4E5
  LDI r14, 1417
  PSET r6, r0, r14
endif_1:
  CMP r2, r1
  JZ r2, else_2
  SHR r5, r15, r0
  MUL r11, r4, r13
  AND r16, r5, r8
  AND r11, r3, r9
  JMP endif_3
else_2:
  LDI r1, 0xE79657
  LDI r11, 0x21DEBD
  LDI r3, 128
  PSETI
  LDI r6, 256
  LDI r10, 537
  LDI r3, 0x1D480F
  LDI r6, 0
  LDI r8, 0x1C21F6
  LINE r6, r10, r3, r6, r8
endif_3:
  HALT
