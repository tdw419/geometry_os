; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it checks for keyboard input. If the input matches a specific value (194), it performs calculations involving register values and draws a frame before returning to the loop.

; drawing loop program
; initialization
  LDI r0, 497
  LDI r7, 0xD348ED
main_0:
  IKEY r9
  CMPI r9, 194
  JNZ r9, key_1
  SUBI r8, r12, 16
  FRAME
  JMP main_0
