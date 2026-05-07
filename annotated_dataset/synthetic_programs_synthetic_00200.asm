; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it repeatedly draws a line on the screen using the `LINE` instruction. The loop continues until a counter in register `r1` reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r14, 2112
  LDI r9, 0xAF6A4B
  LDI r5, 2964
  LDI r10, 2518
  LDI r1, 384
  LDI r7, 0x099B47
  LDI r4, 0xD667EE
  LDI r1, 1
loop_0:
  CMPI r13, r5, 70
  LDI r1, 0x763C4F
  LDI r2, 255
  LDI r19, 4
  PSET r1, r2, r19
  LDI r14, 0x5D53B0
  LDI r2, 0xA8118A
  LDI r0, 2178
  PSETI
  LDI r6, 2235
  LDI r9, 0x7C163A
  LDI r10, 3942
  LDI r2, 128
  LDI r5, 0x53B9A6
  LINE r6, r9, r10, r2, r5
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_0
  HALT
