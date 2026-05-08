; DESCRIPTION: This GeOS assembly code initializes the drawing environment and draws a filled circle with a radius of 2198 at coordinates (3255, 1849) using color 0xBC0D6D. It then proceeds to draw a rectangle with dimensions width=8, height=2901, position starting from (3254, 1849) and fills it with the color 0x6AD120 before halting execution.

; simple draw program
; initialization
  LDI r9, 3255
  LDI r10, 1849
  LDI r7, 1849
  LDI r14, 0
  LDI r13, 0xBC0D6D
  LDI r15, 2946
  LDI r12, 2198
  LDI r6, 0x665F82
  CIRCLE r13, r15, r12, r6
  LDI r11, 1
  FILL r11
  LDI r13, 3254
  LDI r11, 0x6AD120
  LDI r8, 2901
  LDI r10, 8
  LDI r6, 4
  RECTF r13, r11, r8, r10, r6
  HALT
