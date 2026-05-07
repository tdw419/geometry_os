; DESCRIPTION: The GeOS assembly code initializes registers and enters a loop where it draws the text "WORLD" twice at different positions and colors. It then performs bitwise operations on registers and checks a condition to potentially update the frame before repeating the loop.

; drawing loop program
; initialization
  LDI r5, 255
  LDI r10, 3069
main_0:
  LDI r5, 128
  LDI r12, 3373
  LDI r13, 32
  DRAWTEXT r5, r12, r13, "WORLD"
  SHLI r0, r7, 1
  SAR r6, r2, r7
  LDI r9, 0xC8C19B
  LDI r0, 0xD129E7
  LDI r4, 2094
  DRAWTEXT r9, r0, r4, "WORLD"
  CMPI r2, r10, 0x774047
  FRAME
  JMP main_0
