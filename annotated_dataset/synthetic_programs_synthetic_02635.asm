; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws text "HELLO" on the screen. It checks for a key press (0x423F78) and if pressed, performs bitwise operations and sets a pixel, then updates the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r7, 3715
  LDI r3, 0xFF6384
  LDI r9, 3882
  LDI r14, 470
main_0:
  LDI r0, 16
  LDI r11, 0xE7B8D7
  LDI r14, 1782
  TEXT r0, r11, r14, "HELLO"
  IKEY r8
  CMPI r8, 0x423F78
  JNZ r8, key_1
  SHR r1, r6, r12
  SAR r12, r8, r7
  LDI r31, 10
  LDI r7, 694
  LDI r30, 64
  PSET r31, r7, r30
  SHLI r10, r9, 0
  SAR r11, r1, r8
  SHR r9, r15, r31
  SHR r0, r1, r6
  FRAME
  JMP main_0
