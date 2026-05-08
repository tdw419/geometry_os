; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and performs a looped operation that sets pixels on a graphical display. It then draws a rectangle and halts execution.

; mixed program
; initialization
  LDI r4, 32
  LDI r7, 221
  LDI r0, 2143
  LDI r6, 16
  LDI r1, 616
  DIV r5, r15, r7
  LDI r10, 3
loop_0:
  LDI r4, 0xC69BF2
  LDI r8, 2984
  LDI r15, 441
  PSET r4, r8, r15
  SUBI r4, r10, 0xEEB0EB
  SUB r7, r8, r3
  ANDI r1, r9, 0x6E21E0
  LDI r25, 1
  SUB r10, r10, r25
  JNZ r10, loop_0
  LDI r6, 128
  LDI r11, 16
  LDI r11, 3081
  LDI r4, 256
  LDI r8, 0x7E254B
  RECTF r6, r11, r11, r4, r8
  HALT
