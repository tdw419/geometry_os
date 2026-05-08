; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it performs bitwise operations, arithmetic calculations, and conditional jumps. The loop decrements a counter until it reaches zero, at which point the program halts.

; counted animation
; initialization
  LDI r5, 10
  LDI r8, 0
  LDI r14, 128
loop_0:
  ANDI r12, r16, 1
  SUBI r1, r9, 255
  DIV r5, r11, r13
  LDI r8, 1
  SUB r14, r14, r8
  JNZ r14, loop_0
  HALT
