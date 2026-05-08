; DESCRIPTION: The GeOS assembly code initializes several registers and enters a loop where it repeatedly calls the `RECTF` function to draw a rectangle with varying parameters. The loop continues until a counter reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r12, 128
  LDI r8, 4
  LDI r14, 0
  LDI r1, 128
  LDI r4, 2376
  LDI r13, 256
  LDI r9, 128
  LDI r3, 8
loop_0:
  LDI r2, 8
  LDI r1, 342
  LDI r3, 0x86500A
  LDI r12, 0x8E4FD1
  LDI r3, 255
  RECTF r2, r1, r3, r12, r3
  SHL r4, r15, r10
  LDI r2, 1
  SUB r3, r3, r2
  JNZ r3, loop_0
  HALT
