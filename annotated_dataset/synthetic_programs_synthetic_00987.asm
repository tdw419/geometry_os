; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a counted loop that repeatedly performs bitwise operations, sets up parameters for a line drawing function, fills a region, decrements a counter, and checks if the loop should continue. After exiting the loops, it halts execution.

; counted animation
; initialization
  LDI r8, 0x9D75D0
  LDI r14, 256
  LDI r15, 0x822EFE
  LDI r6, 0x116B08
  LDI r13, 3596
  LDI r12, 1037
  LDI r11, 3224
  LDI r5, 32
loop_0:
  SHR r11, r9, r12
  ANDI r4, r7, 0
  LDI r14, 255
  LDI r6, 2931
  LDI r11, 255
  LDI r26, 4
  LDI r7, 1661
  LINE r14, r6, r11, r26, r7
  LDI r2, 0xF3C891
  FILL r2
  LDI r9, 1
  SUB r5, r5, r9
  JNZ r5, loop_0
  LDI r9, 2
loop_1:
  CMPI r2, r13, 0xBECB4D
  LDI r0, 1
  SUB r9, r9, r0
  JNZ r9, loop_1
  HALT
