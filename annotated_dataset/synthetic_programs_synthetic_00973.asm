; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and sets up a color palette. It then displays the text "HELLO" at a specified location and enters a loop where it performs pixel operations, circle drawing, and conditional checks before halting execution.

; mixed program
; initialization
  LDI r22, 0x94A4D4
  LDI r8, 0
  LDI r12, 2
  LDI r10, 258
  LDI r11, 0xCC4AA2
  LDI r2, 2871
  LDI r6, 0xAF096C
  LDI r5, 1
; palette
  LDI r15, 0x50A5
  LDI r6, 1
  LDI r11, 0x550077
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xFF8800
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x0044FF
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x0000FF
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x000066
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xFFFF00
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x00FFAA
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xAA00AA
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xFF0000
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x888800
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xFFFF00
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x00AAFF
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0x000066
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xAAFF00
  STORE r15, r11
  ADD r15, r15, r6
  LDI r11, 0xAAFF00
  STORE r15, r11
  ADD r15, r15, r6
  LDI r12, 1
  LDI r6, 0x6F583C
  LDI r4, 1796
  TEXT r12, r6, r4, "HELLO"
  LDI r6, 255
loop_0:
  LDI r13, 8
  LDI r8, 3258
  LDI r8, 64
  WPIXEL
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_0
  XOR r8, r15, r9
  SAR r15, r5, r10
  SHR r3, r11, r7
  OR r6, r12, r9
  OR r9, r3, r2
  CMP r6, r9
  JZ r6, else_1
  SUB r2, r9, r15
  XOR r24, r6, r1
  SUB r19, r8, r15
  JMP endif_2
else_1:
  LDI r12, 3636
  LDI r6, 0xBDFDD1
  LDI r15, 32
  LDI r2, 0xEEF148
  CIRCLE r12, r6, r15, r2
  LDI r6, 2218
  FILL r6
  LDI r11, 1470
  LDI r2, 10
  LDI r7, 256
  LDI r12, 128
  CIRCLE r11, r2, r7, r12
endif_2:
  PUSH r6
  PUSH r10
  ADD r19, r4, r11
  SUB r15, r0, r12
  ADD r12, r2, r21
  POP r10
  POP r6
  HALT
