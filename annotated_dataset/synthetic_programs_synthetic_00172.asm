; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it performs arithmetic operations, bitwise shifts, and conditional checks. It captures keyboard input and conditionally executes a function to draw a frame if a specific key is pressed.

; drawing loop program
; initialization
  LDI r12, 3448
  LDI r8, 0xE3E17C
  LDI r3, 255
main_0:
  ADDI r3, r4, 0xD0B6B1
  CMP r3, r5
  CMP r5, r4
  SAR r4, r11, r25
  SHL r2, r8, r3
  IKEY r3
  CMPI r3, 177
  JNZ r3, key_1
  FRAME
  JMP main_0
