; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it draws lines and circles based on specific parameters. It continuously updates the drawing coordinates and checks for user input to modify the circle's radius, before refreshing the frame and repeating the process.

; drawing loop program
; initialization
  LDI r2, 0x369C9D
  LDI r8, 32
  LDI r3, 256
  LDI r4, 4
  LDI r14, 0xB684C9
main_0:
  LDI r12, 128
  LDI r7, 2952
  LDI r15, 2
  LDI r5, 255
  LDI r8, 32
  LINE r12, r7, r15, r5, r8
  CMP r4, r10
  LDI r3, 0x8D0429
  LDI r9, 10
  LDI r8, 0x00EAC7
  LDI r6, 3217
  CIRCLE r3, r9, r8, r6
  ADD r6, r5, r4
  IKEY r4
  CMPI r4, 0
  JNZ r4, key_1
  ADD r12, r2, r11
  FRAME
  JMP main_0
