; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it draws text and a point on the screen. It waits for a key press; if the key is not 220, it performs calculations and refreshes the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r12, 16
  LDI r7, 92
  LDI r2, 0x389231
  LDI r10, 0xA8C784
main_0:
  LDI r8, 1433
  LDI r4, 4
  LDI r4, 0x6694F8
  DRAWTEXT r8, r4, r4, "WORLD"
  SHLI r8, r10, 8
  SHR r4, r13, r5
  LDI r3, 255
  LDI r31, 0x5BCF38
  LDI r4, 0x6B72CD
  PSET r3, r31, r4
  IKEY r11
  CMPI r11, 220
  JNZ r11, key_1
  SUB r7, r8, r11
  SUBI r15, r4, 0x762A93
  FRAME
  JMP main_0
