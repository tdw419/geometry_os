; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, enters a loop to perform counted animations using `PSET` and `FILL` instructions, and modifies register values in each iteration. The loops decrement counters until they reach zero, at which point the program halts.

; counted animation
; initialization
  LDI r4, 2632
  LDI r1, 0x9ABD96
  LDI r12, 0x057C42
  LDI r11, 1
loop_0:
  LDI r0, 0x4136C0
  LDI r2, 3462
  LDI r6, 1630
  PSET r0, r2, r6
  SUBI r5, r8, 10
  SUBI r12, r10, 209
  LDI r13, 1
  SUB r11, r11, r13
  JNZ r11, loop_0
  LDI r10, 16
loop_1:
  ADD r14, r0, r13
  LDI r14, 3539
  FILL r14
  CMPI r5, r9, 194
  SUBI r1, r8, 197
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_1
  LDI r3, 4
loop_2:
  ADDI r0, r11, 4
  ANDI r5, r11, 0xD184B3
  LDI r5, 1
  SUB r3, r3, r5
  JNZ r3, loop_2
  HALT
