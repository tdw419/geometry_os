; DESCRIPTION: This GeOS assembly code initializes several registers and enters an infinite loop where it checks a condition, performs bitwise operations, draws the text "WORLD" twice at different locations with different colors, fills the screen with a color, and then updates the display frame.

; input driven program
; initialization
  LDI r0, 2
  LDI r8, 1
  LDI r9, 255
  LDI r4, 2624
  LDI r7, 364
main_0:
  CMPI r4, 128
  OR r0, r6, r13
  OR r2, r9, r10
  XOR r9, r5, r17
  LDI r15, 2
  LDI r1, 0x39BD0B
  LDI r9, 1162
  DRAWTEXT r15, r1, r9, "WORLD"
  CMP r1, r16
  LDI r13, 0x05BA6D
  FILL r13
  LDI r3, 256
  LDI r8, 0xB1579F
  LDI r9, 0xEBF894
  DRAWTEXT r3, r8, r9, "WORLD"
  FRAME
  JMP main_0
