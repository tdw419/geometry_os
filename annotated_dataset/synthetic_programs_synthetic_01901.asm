; DESCRIPTION: This GeOS assembly code initializes various registers and performs a series of arithmetic operations, including subtraction, addition, and division. It then enters a loop where it shifts bits, checks conditions, and calls a function that further manipulates registers and potentially draws geometric shapes like lines, circles, and rectangles using functions like `LINE`, `CIRCLE`, and `RECTF`. The program ultimately halts execution.

; mixed program
; initialization
  LDI r12, 128
  LDI r9, 3670
  SUB r5, r1, r10
  LDI r5, 256
  LDI r3, 0
  LDI r14, 0x41526D
  LDI r6, 256
  LDI r3, 8
  LINE r5, r3, r14, r6, r3
  LDI r11, 27
loop_0:
  ADD r13, r4, r8
  CMPI r15, r7, 119
  SHR r13, r5, r11
  LDI r3, 1
  SUB r11, r11, r3
  JNZ r11, loop_0
  CALL func_1
func_1:
  XOR r4, r12, r5
  SHR r9, r5, r17
  DIV r7, r13, r14
  ADD r8, r11, r9
  ADD r23, r15, r5
  RET
  CMP r13, r1
  JZ r13, else_2
  ADD r1, r9, r10
  SUB r8, r15, r13
  AND r9, r8, r12
  AND r1, r0, r8
  JMP endif_3
else_2:
  LDI r2, 4
  LDI r0, 2291
  LDI r7, 1534
  LDI r0, 2874
  CIRCLE r2, r0, r7, r0
  LDI r15, 1947
  LDI r14, 2532
  LDI r3, 16
  LDI r11, 3495
  LDI r13, 16
  RECTF r15, r14, r3, r11, r13
  LDI r1, 3377
  LDI r14, 3611
  LDI r4, 10
  LDI r1, 638
  CIRCLE r1, r14, r4, r1
  LDI r15, 8
  LDI r5, 0x37861B
  LDI r7, 3757
  WPIXEL
endif_3:
  HALT
