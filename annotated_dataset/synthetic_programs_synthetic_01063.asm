; DESCRIPTION: This GeOS assembly code initializes several registers and then uses them to draw a line with specific color attributes. It also sets a pixel at a given location and fills an area with a specified color before halting the program.

; simple draw program
; initialization
  LDI r2, 2195
  LDI r3, 2228
  LDI r11, 0x870AC4
  LDI r6, 2241
  LDI r13, 550
  LDI r6, 255
  LDI r11, 8
  LDI r8, 3258
  LINE r6, r13, r6, r11, r8
  LDI r7, 0xB2C17B
  LDI r4, 0
  LDI r8, 256
  WPIXEL
  LDI r0, 0x9A4CB3
  FILL r0
  HALT
