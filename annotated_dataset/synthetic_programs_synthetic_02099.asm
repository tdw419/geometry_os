; DESCRIPTION: This GeOS assembly code initializes several registers and enters an infinite loop where it repeatedly draws the text "HELLO" at a specific location on the screen. The loop also includes conditional checks based on register values but does not modify them, resulting in static behavior.

; drawing loop program
; initialization
  LDI r8, 256
  LDI r12, 2990
  LDI r2, 128
  LDI r21, 0x37C617
  LDI r5, 2
main_0:
  CMPI r13, r5, 0x260B4E
  LDI r1, 759
  LDI r1, 0xC8D0FC
  LDI r14, 981
  TEXT r1, r1, r14, "HELLO"
  CMPI r9, 0xD68C14
  FRAME
  JMP main_0
