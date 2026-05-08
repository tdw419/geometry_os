; DESCRIPTION: This GeOS assembly code initializes various registers with specific values, performs arithmetic operations including division and shifts, draws the text "WORLD" at different coordinates on a display, and enters an infinite loop where it writes pixels to the screen and manipulates registers in a continuous process.

; mixed program
; initialization
  LDI r5, 0xF21EDD
  LDI r3, 0xDEE487
  LDI r7, 1293
  LDI r11, 0xE47858
  LDI r15, 2253
  LDI r2, 64
  CMPI r6, 0x12F58E
  DIV r5, r6, r9
  LDI r3, 0x4EBDA8
  LDI r1, 4066
  LDI r11, 128
  DRAWTEXT r3, r1, r11, "WORLD"
  SHL r4, r6, r15
  SHL r0, r21, r8
  SHR r4, r15, r14
  SAR r3, r10, r14
  SHR r12, r1, r4
  SHLI r13, r5, 5
  PUSH r3
  ADD r12, r7, r0
  ADD r6, r2, r0
  POP r3
  LDI r3, 2902
  LDI r13, 614
  LDI r2, 1986
  DRAWTEXT r3, r13, r2, "WORLD"
main_0:
  LDI r8, 3796
  LDI r1, 16
  LDI r8, 2105
  WPIXEL
  SHLI r14, r0, 0x433195
  SAR r11, r13, r8
  SHL r1, r11, r0
  SHR r6, r15, r5
  SHR r15, r14, r10
  SHL r1, r4, r6
  FRAME
  JMP main_0
