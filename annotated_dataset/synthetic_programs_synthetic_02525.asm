; DESCRIPTION: This GeOS assembly code initializes several registers with specific values, enters a loop where it draws the text "WORLD" at coordinates (550, 10) using color 0xF17AE3, checks for a key press (0xF9A3A5), and if pressed, performs a bitwise XOR and OR operation on registers, then calls FRAME to update the display before looping back.

; drawing loop program
; initialization
  LDI r14, 2739
  LDI r9, 0x860D99
  LDI r1, 0x4CE315
  LDI r2, 3634
  LDI r15, 255
  LDI r11, 0x8D147B
  LDI r6, 795
  LDI r10, 0x5FCBC7
main_0:
  LDI r18, 0xF17AE3
  LDI r3, 550
  LDI r2, 10
  DRAWTEXT r18, r3, r2, "WORLD"
  AND r5, r9, r8
  LDI r15, 0
  LDI r9, 8
  LDI r3, 128
  TEXT r15, r9, r3, "HELLO"
  IKEY r11
  CMPI r11, 0xF9A3A5
  JNZ r11, key_1
  XOR r0, r13, r11
  OR r13, r29, r1
  FRAME
  JMP main_0
