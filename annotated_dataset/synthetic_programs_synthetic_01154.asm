; DESCRIPTION: This GeOS assembly code performs conditional logic based on the value of `r15`, initializing various registers and performing arithmetic operations. If `r15` is zero, it draws a circle using specific parameters; otherwise, it executes different arithmetic and logical operations, including shifts, OR, XOR, and division, before halting execution.

; conditional logic
; initialization
  LDI r14, 16
  LDI r13, 3689
  CMP r15, r0
  JZ r15, else_0
  MOD r3, r15, r12
  ADD r10, r5, r19
  MUL r9, r13, r8
  JMP endif_1
else_0:
  LDI r6, 0x52D17C
  LDI r14, 0xEA02D1
  LDI r9, 0x933C17
  LDI r8, 4
  CIRCLE r6, r14, r9, r8
  LDI r2, 1
  LDI r5, 0xA4895D
  LDI r6, 1031
  WPIXEL
endif_1:
  CMP r11, r7
  JNZ r11, else_2
  SHL r8, r6, r3
  OR r8, r14, r9
  SHR r7, r3, r14
  JMP endif_3
else_2:
  LDI r11, 8
  LDI r8, 32
  LDI r15, 1872
  PSETI
  LDI r15, 456
  LDI r9, 337
  LDI r15, 0x5E8613
  LDI r4, 440
  LDI r8, 0x075173
  RECTF r15, r9, r15, r4, r8
  LDI r6, 2503
  LDI r3, 2431
  LDI r4, 181
  LDI r9, 901
  LDI r4, 2560
  LINE r6, r3, r4, r9, r4
  LDI r9, 406
  LDI r6, 0x83822C
  LDI r5, 0
  PSET r9, r6, r5
endif_3:
  CMP r3, r7
  JZ r3, else_4
  OR r1, r11, r12
  SHL r3, r1, r6
  DIV r3, r12, r2
  XOR r6, r10, r5
  JMP endif_5
else_4:
  LDI r11, 3823
  LDI r9, 10
  LDI r15, 128
  LDI r12, 0xAFA426
  LDI r14, 1727
  RECTF r11, r9, r15, r12, r14
endif_5:
  HALT
