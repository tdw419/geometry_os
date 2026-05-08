; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs conditional operations based on comparisons. It includes logic for setting pixels, filling areas, shifting bits, dividing numbers, and checking user input to halt execution if a specific key is pressed.

; mixed program
; initialization
  LDI r13, 0xD2629D
  LDI r12, 213
  LDI r15, 2933
  LDI r3, 8
  LDI r8, 1
  LDI r14, 3815
  LDI r19, 0x0DAFF2
  CMP r5, r28
  JNZ r5, else_0
  OR r3, r15, r8
  JMP endif_1
else_0:
  LDI r11, 3082
  LDI r10, 128
  LDI r13, 0xE68498
  PSETI
  LDI r12, 1124
  FILL r12
endif_1:
  CMP r13, r0
  JNZ r13, else_2
  SHL r9, r3, r2
  DIV r16, r14, r8
  SHL r13, r5, r3
  ADD r10, r13, r20
  JMP endif_3
else_2:
  LDI r13, 0x238091
  LDI r13, 0
  LDI r11, 0xB0F189
  WPIXEL
endif_3:
  IKEY r1
  CMPI r1, 16
  JNZ r1, key_4
  HALT
