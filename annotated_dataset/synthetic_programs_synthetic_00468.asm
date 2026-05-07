; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted animation loop. The first loop (`loop_0`) repeatedly draws rectangles and modifies register values, while the second loop (`loop_1`) draws lines based on modified register values until the count reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r9, 0xF18F45
  LDI r0, 0xB8B206
  LDI r15, 64
  LDI r5, 1972
  LDI r3, 64
  LDI r1, 0xFDD1EE
loop_0:
  LDI r8, 0x7286E0
  LDI r12, 0x6D0826
  LDI r15, 2240
  LDI r9, 2
  LDI r13, 0xF52D31
  RECTF r8, r12, r15, r9, r13
  LDI r7, 0x78DC69
  LDI r12, 0x6F0692
  LDI r4, 1
  WPIXEL
  SHL r9, r2, r7
  LDI r2, 1
  SUB r1, r1, r2
  JNZ r1, loop_0
  LDI r2, 9
loop_1:
  SUBI r5, r7, 189
  LDI r7, 0x70D4D8
  LDI r8, 0
  LDI r5, 32
  LDI r2, 0xB2F5F1
  LDI r9, 0x9CA0FE
  LINE r7, r8, r5, r2, r9
  LDI r14, 16
  LDI r5, 8
  LDI r6, 256
  LDI r7, 4
  LDI r22, 16
  LINE r14, r5, r6, r7, r22
  LDI r3, 1
  SUB r2, r2, r3
  JNZ r2, loop_1
  HALT
