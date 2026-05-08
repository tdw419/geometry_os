; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a drawing loop. In each iteration, it checks a condition, performs arithmetic operations, loads constants, draws the text "WORLD" at specified coordinates, compares another register, updates the frame, and jumps back to the start of the loop.

; drawing loop program
; initialization
  LDI r10, 0x8E12DE
  LDI r8, 8
main_0:
  CMPI r3, 0x40E907
  ADDI r8, r7, 1
  MUL r13, r12, r9
  LDI r4, 255
  LDI r6, 613
  LDI r0, 675
  DRAWTEXT r4, r6, r0, "WORLD"
  CMP r6, r1
  FRAME
  JMP main_0
