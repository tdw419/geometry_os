; DESCRIPTION: This GeOS assembly code initializes registers with specific values and enters a loop where it repeatedly displays the text "HELLO" at position (128, 3021) on the screen and draws a rectangle with color 0x66953B from position (136, 10) to (0x338672, 0x66953B). The loop continues indefinitely due to the unconditional jump at the end.

; input driven program
; initialization
  LDI r11, 3782
  LDI r13, 0x3B6E29
  LDI r15, 0x91EC88
  LDI r2, 205
main_0:
  LDI r3, 128
  LDI r9, 3021
  LDI r4, 32
  TEXT r3, r9, r4, "HELLO"
  LDI r5, 0xF2EE44
  LDI r2, 136
  LDI r12, 10
  LDI r5, 0x66953B
  LDI r9, 0x338672
  RECTF r5, r2, r12, r5, r9
  FRAME
  JMP main_0
