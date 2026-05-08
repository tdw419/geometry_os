; DESCRIPTION: This GeOS assembly code initializes registers with various values and performs a series of arithmetic and logical operations, including shifts, additions, subtractions, multiplications, divisions, and comparisons. It also includes conditional branches and loops to execute different sequences based on the comparison results. The code interacts with graphical elements such as pixels, circles, rectangles, and text drawing within a loop that continuously updates the display.

; mixed program
; initialization
  LDI r4, 1195
  LDI r11, 0x7CC547
  LDI r3, 0xF4353F
  LDI r2, 0x3D12F2
  SAR r15, r13, r0
  SAR r11, r10, r12
  SHR r5, r3, r4
  LDI r9, 0
  FILL r9
  PUSH r10
  PUSH r0
  PUSH r15
  DIV r15, r3, r2
  ADD r15, r14, r0
  ADD r12, r11, r10
  SHL r2, r6, r5
  OR r10, r12, r6
  POP r15
  POP r0
  POP r10
  CMP r15, r11
  JZ r15, else_0
  ADD r12, r2, r13
  DIV r5, r8, r11
  SHL r7, r27, r11
  ADD r10, r9, r22
  JMP endif_1
else_0:
  LDI r7, 3835
  LDI r5, 0xA01B50
  LDI r15, 0x94DC23
  PSET r7, r5, r15
  LDI r13, 2
  LDI r9, 3011
  LDI r8, 16
  PSETI
  LDI r10, 128
  LDI r2, 638
  LDI r12, 255
  WPIXEL
endif_1:
  CMP r15, r11
  JZ r15, else_2
  ADD r24, r6, r2
  MOD r4, r8, r0
  MUL r1, r3, r13
  SUB r11, r9, r8
  JMP endif_3
else_2:
  LDI r22, 0
  LDI r11, 2703
  LDI r11, 2
  LDI r9, 591
  CIRCLE r22, r11, r11, r9
  LDI r15, 2973
  LDI r21, 0x5287DC
  LDI r11, 1106
  LDI r12, 0x546B21
  LDI r7, 128
  RECTF r15, r21, r11, r12, r7
  LDI r14, 1335
  LDI r1, 579
  LDI r14, 0xACAFDB
  LDI r2, 0xDD146F
  CIRCLE r14, r1, r14, r2
endif_3:
  LDI r9, 0xEA22D0
loop_4:
  SUBI r6, r1, 0xA5932F
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_4
  OR r11, r26, r9
main_5:
  LDI r15, 255
  LDI r5, 0x45642A
  LDI r7, 1794
  WPIXEL
  SAR r6, r12, r8
  SAR r2, r13, r6
  SHR r8, r13, r12
  AND r21, r1, r15
  XOR r13, r8, r3
  AND r3, r10, r6
  XOR r12, r11, r31
  MOD r15, r1, r6
  LDI r11, 3955
  LDI r1, 536
  LDI r1, 128
  DRAWTEXT r11, r1, r1, "WORLD"
  FRAME
  JMP main_5
