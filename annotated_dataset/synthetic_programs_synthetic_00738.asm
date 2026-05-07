; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters an infinite loop where it performs XOR operations, loads more data into registers, draws text "WORLD" on the screen at a specified location, draws a rectangle, compares a register value to a constant, subtracts a value from another register, updates the frame, and then jumps back to the start of the loop.

; input driven program
; initialization
  LDI r5, 4013
  LDI r14, 578
  LDI r9, 0x92CDFE
  LDI r3, 255
main_0:
  XOR r5, r8, r4
  LDI r12, 32
  LDI r5, 991
  LDI r1, 0x436CAA
  DRAWTEXT r12, r5, r1, "WORLD"
  LDI r0, 2693
  LDI r3, 3049
  LDI r12, 8
  LDI r11, 255
  LDI r2, 10
  RECTF r0, r3, r12, r11, r2
  CMPI r0, 0x8A3AEF
  SUBI r9, r6, 128
  FRAME
  JMP main_0
