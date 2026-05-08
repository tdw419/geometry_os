; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and enters a loop where it performs bitwise operations and arithmetic subtractions. The loop continues until a condition is met (register `r5` becomes zero), at which point the program halts.

; counted animation
; initialization
  LDI r15, 0xB1AAD6
  LDI r11, 3347
  LDI r9, 255
  LDI r2, 1801
  LDI r5, 16
loop_0:
  ANDI r8, r10, 0x663CEE
  SUBI r5, r4, 0x8E367E
  SUBI r9, r15, 168
  ANDI r15, r8, 256
  LDI r4, 1
  SUB r5, r5, r4
  JNZ r5, loop_0
  HALT
