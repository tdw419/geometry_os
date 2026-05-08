; DESCRIPTION: This GeOS assembly code initializes registers and repeatedly draws text "WORLD" and "HELLO" at specific coordinates with different colors. It uses bitwise operations to manipulate register values and enters an infinite loop by jumping back to the start of the main routine.

; input driven program
; initialization
  LDI r9, 2
  LDI r8, 2
main_0:
  LDI r8, 4
  LDI r7, 0x92BF23
  LDI r6, 16
  DRAWTEXT r8, r7, r6, "WORLD"
  ANDI r10, r6, 10
  LDI r4, 3445
  LDI r11, 2906
  LDI r8, 0xFC2C74
  TEXT r4, r11, r8, "HELLO"
  LDI r12, 0x50A99A
  LDI r15, 0xD3BB89
  LDI r13, 0xC230F9
  TEXT r12, r15, r13, "HELLO"
  XOR r8, r14, r7
  OR r15, r6, r13
  OR r3, r11, r9
  OR r8, r10, r15
  FRAME
  JMP main_0
