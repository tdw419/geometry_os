; DESCRIPTION: This GeOS assembly code initializes registers and repeatedly executes a loop that draws text and rectangles on the screen, updating register values with specific operations like addition, shift, and arithmetic right shifts.

; drawing loop program
; initialization
  LDI r12, 64
  LDI r5, 0xD147BD
  LDI r15, 8
  LDI r0, 3889
  LDI r13, 32
main_0:
  LDI r3, 0x1006DA
  LDI r5, 0x319E55
  LDI r0, 0x27F8B9
  TEXT r3, r5, r0, "HELLO"
  ADDI r14, r7, 190
  LDI r0, 101
  LDI r4, 0xFB27F3
  LDI r12, 128
  LDI r5, 0
  LDI r13, 0xCE4399
  RECTF r0, r4, r12, r5, r13
  LDI r4, 256
  LDI r8, 3639
  LDI r8, 128
  TEXT r4, r8, r8, "HELLO"
  SHL r6, r8, r11
  SHLI r3, r13, 0xE2F758
  SAR r14, r4, r8
  FRAME
  JMP main_0
