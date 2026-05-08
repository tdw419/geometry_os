; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, performs bitwise operations, draws the text "WORLD" on a screen at coordinates (1, 128), and then enters a loop where it calculates coordinates for a pixel drawing operation. The loop continues until a condition is met, after which it shifts bits, sets a pixel, and finally halts execution.

; mixed program
; initialization
  LDI r3, 0xCCDE3E
  LDI r18, 0x766870
  LDI r12, 0xC4C599
  LDI r5, 8
  LDI r9, 2764
  LDI r6, 0x3A09A5
  LDI r4, 1537
  LDI r13, 0x277531
  AND r12, r2, r6
  AND r8, r3, r13
  LDI r2, 1
  LDI r14, 128
  LDI r9, 255
  DRAWTEXT r2, r14, r9, "WORLD"
  LDI r7, 0x652859
  LDI r7, 0x988405
  LDI r7, 10
  LDI r9, 0x35F4CE
  LDI r14, 0xCD9F08
  LINE r7, r7, r7, r9, r14
  LDI r8, 128
loop_0:
  CMPI r7, r15, 4
  XOR r21, r12, r30
  SUBI r10, r14, 255
  LDI r4, 0xA4D6E6
  LDI r13, 10
  LDI r8, 0x477F7C
  WPIXEL
  LDI r14, 1
  SUB r8, r8, r14
  JNZ r8, loop_0
  SHR r4, r3, r2
  LDI r2, 4
  LDI r9, 256
  LDI r12, 32
  PSET r2, r9, r12
  PUSH r6
  SHL r12, r9, r8
  AND r14, r13, r9
  SUB r10, r1, r14
  POP r6
  HALT
