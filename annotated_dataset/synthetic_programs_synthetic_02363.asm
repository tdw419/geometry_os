; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and enters a loop where it waits for a key press. If the key 'R' (ASCII value 82) is pressed, it triggers a function to draw a frame and then returns to the main loop.

; drawing loop program
; initialization
  LDI r7, 128
  LDI r10, 3708
  LDI r13, 0x382840
  LDI r17, 0x3B501E
  LDI r1, 0xB8C3B0
  LDI r4, 128
main_0:
  XOR r8, r11, r9
  IKEY r5
  CMPI r5, 82
  JNZ r5, key_1
  FRAME
  JMP main_0
