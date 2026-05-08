; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional logic. If the value in register `r11` is equal to `r14`, it executes a block of code that writes a pixel and draws a circle; otherwise, it performs an addition and multiplication operation before halting.

; conditional logic
; initialization
  LDI r8, 255
  LDI r11, 0x39676C
  LDI r9, 16
  LDI r1, 32
  LDI r7, 64
  LDI r12, 955
  LDI r4, 0x1AF411
  CMP r11, r14
  JZ r11, else_0
  ADD r9, r13, r1
  MUL r8, r15, r0
  JMP endif_1
else_0:
  LDI r21, 2
  LDI r6, 0x5C55E8
  LDI r5, 128
  WPIXEL
  LDI r3, 0x0EAE2A
  LDI r21, 19
  LDI r14, 32
  LDI r0, 2150
  CIRCLE r3, r21, r14, r0
endif_1:
  HALT
