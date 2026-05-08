; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then enters a loop where it performs bit shifting operations, loads new values into registers, draws rectangles and text on the screen, checks for a specific key press, and updates the frame. The loop continues indefinitely until the specified key is pressed.

; drawing loop program
; initialization
  LDI r5, 0xE3131F
  LDI r8, 3055
  LDI r3, 149
  LDI r15, 1843
  LDI r2, 255
  LDI r10, 255
  LDI r1, 641
main_0:
  SHL r10, r15, r22
  SHL r12, r13, r9
  SAR r10, r9, r12
  LDI r8, 0x0B589E
  LDI r8, 10
  LDI r5, 477
  LDI r8, 0xAD29CF
  LDI r12, 286
  RECTF r8, r8, r5, r8, r12
  LDI r9, 0x194F50
  LDI r9, 4
  LDI r11, 0x9EEEAE
  DRAWTEXT r9, r9, r11, "WORLD"
  IKEY r1
  CMPI r1, 0xFBD345
  JNZ r1, key_1
  FRAME
  JMP main_0
