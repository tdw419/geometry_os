; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it continuously checks for user input. If the input is specific (key 16), it draws a frame at a predefined position (2428, 1944) on the screen and then returns to the main loop.

; drawing loop program
; initialization
  LDI r2, 2428
  LDI r15, 1944
main_0:
  IKEY r13
  CMPI r13, 16
  JNZ r13, key_1
  CMPI r6, r13, 32
  FRAME
  JMP main_0
