; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it checks for key presses. If the keys '54' and '202' are pressed in sequence, it sets up parameters to draw the text "WORLD" on the screen using the DRAWTEXT command and then updates the frame.

; drawing loop program
; initialization
  LDI r9, 64
  LDI r11, 2509
  LDI r12, 0xCEB837
  LDI r8, 128
main_0:
  AND r12, r4, r3
  AND r6, r0, r5
  XOR r10, r6, r5
  XOR r8, r3, r14
  IKEY r9
  CMPI r9, 54
  JNZ r9, key_1
  SHL r5, r29, r0
  IKEY r5
  CMPI r5, 202
  JNZ r5, key_2
  LDI r9, 0x4DA32B
  LDI r6, 0xE5BCC8
  LDI r10, 1
  DRAWTEXT r9, r6, r10, "WORLD"
  FRAME
  JMP main_0
