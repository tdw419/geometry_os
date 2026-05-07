; DESCRIPTION: The GeOS assembly code initializes several registers with specific values and then enters a drawing loop where it performs division, subtraction, bitwise shift operations, frames the data, and jumps back to the start of the loop. This loop likely handles geometric calculations or rendering tasks in a graphics system.

; drawing loop program
; initialization
  LDI r14, 0xD3035A
  LDI r8, 1752
  LDI r2, 0x26AD92
  LDI r15, 0xE636E0
main_0:
  DIV r0, r3, r2
  SUBI r12, r3, 8
  SHR r11, r8, r6
  SHL r7, r5, r13
  FRAME
  JMP main_0
