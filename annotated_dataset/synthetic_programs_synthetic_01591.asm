; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it waits for a key press. If the pressed key's ASCII value is 64 ('@'), it calculates coordinates, sets a pixel on a display at those coordinates, draws a frame, and then repeats the process.

; input driven program
; initialization
  LDI r9, 865
  LDI r15, 0x5E06F3
  LDI r6, 10
  LDI r10, 1
main_0:
  IKEY r14
  CMPI r14, 64
  JNZ r14, key_1
  SUBI r11, r12, 16
  LDI r4, 0x28F95D
  LDI r6, 1631
  LDI r0, 128
  PSET r4, r6, r0
  FRAME
  JMP main_0
