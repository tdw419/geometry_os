; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a drawing loop. The program checks for key input; if the key 'A' (ASCII value 10) is pressed, it calculates coordinates, sets a pixel using `PSETI`, and updates the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r15, 0x8EE229
  LDI r14, 0
  LDI r10, 10
  LDI r1, 255
  LDI r4, 3205
  LDI r3, 8
  LDI r7, 0x5691B9
  LDI r17, 0
main_0:
  CMPI r13, 16
  IKEY r6
  CMPI r6, 10
  JNZ r6, key_1
  SUBI r5, r8, 0x9F063B
  LDI r3, 1054
  LDI r14, 563
  LDI r13, 2284
  PSETI
  FRAME
  JMP main_0
