; DESCRIPTION: This GeOS assembly code initializes registers with specific values, sets up a color palette, and conditionally executes loops to draw text and rectangles on the screen based on user input. It uses logical operations and conditional branching to manage pixel drawing and display updates.

; mixed program
; initialization
  LDI r12, 0
  LDI r2, 3313
  LDI r13, 0xCF6065
  LDI r10, 0xEB91D2
  LDI r11, 0x3633B1
  LDI r5, 0x3A61B3
  LDI r6, 256
  LDI r20, 0x4AFABC
; palette
  LDI r4, 0x50E5
  LDI r2, 1
  LDI r15, 0x0044FF
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x0000CC
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x00FF44
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0xAAFF00
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0xAAFF00
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x44FF00
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x008888
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x000066
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0xAAFF00
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x008888
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x0000FF
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0xAAAAAA
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0xFF0000
  STORE r4, r15
  ADD r4, r4, r2
  LDI r15, 0x0044FF
  STORE r4, r15
  ADD r4, r4, r2
  IKEY r8
  CMPI r8, 1
  JNZ r8, key_0
  LDI r1, 0x92FBC2
loop_1:
  ADDI r12, r1, 96
  LDI r15, 1
  SUB r1, r1, r15
  JNZ r1, loop_1
  LDI r1, 2813
  LDI r18, 4
  LDI r14, 2981
  TEXT r1, r18, r14, "HELLO"
  LDI r10, 255
loop_2:
  LDI r12, 0x4CFDBB
  FILL r12
  XOR r11, r12, r2
  SHR r10, r2, r13
  LDI r0, 1
  SUB r10, r10, r0
  JNZ r10, loop_2
  LDI r6, 1572
  STORE r6, r3
  LOAD r1, r6
  LDI r4, 2
  STORE r4, r7
  LOAD r25, r4
  LDI r14, 0x7A744B
  STORE r14, r14
  LOAD r9, r14
  LDI r13, 1133
  STORE r13, r3
  LOAD r5, r13
  LDI r4, 4
loop_3:
  ADDI r12, r7, 4
  LDI r10, 8
  FILL r10
  CMPI r4, r15, 1
  LDI r13, 0x93820C
  LDI r3, 0xD6F35F
  LDI r14, 0xFFE99D
  LDI r0, 1176
  LDI r0, 16
  RECTF r13, r3, r14, r0, r0
  LDI r2, 1
  SUB r4, r4, r2
  JNZ r4, loop_3
  HALT
