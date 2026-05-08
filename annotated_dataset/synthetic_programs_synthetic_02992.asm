; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it sets pixel colors at specified coordinates and checks for a condition involving register values. The program then creates a frame and jumps back to the start of the loop, creating an input-driven visual effect.

; input driven program
; initialization
  LDI r1, 64
  LDI r13, 4
main_0:
  LDI r12, 2734
  LDI r6, 0xE38989
  LDI r7, 0x7251D5
  PSETI
  CMPI r9, r12, 0xBB1267
  FRAME
  JMP main_0
