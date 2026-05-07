; DESCRIPTION: The GeOS assembly code initializes registers with specific values, sets a pixel using the PSETI instruction, displays the text "HELLO" at position (256, 3661) with color 0x419CB5, and then displays the text "WORLD" at position (32, 0x369AEC) with color 0x3319F8. The program enters an infinite loop, continuously refreshing the frame with these graphics.

; input driven program
; initialization
  LDI r3, 255
  LDI r14, 3477
  LDI r15, 32
main_0:
  LDI r2, 0
  LDI r8, 0xEFC1C1
  LDI r5, 3661
  PSETI
  LDI r11, 256
  LDI r4, 0x6C699D
  LDI r4, 0x419CB5
  TEXT r11, r4, r4, "HELLO"
  LDI r5, 32
  LDI r1, 0x369AEC
  LDI r11, 0x3319F8
  DRAWTEXT r5, r1, r11, "WORLD"
  FRAME
  JMP main_0
