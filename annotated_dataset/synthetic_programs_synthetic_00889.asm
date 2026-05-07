; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses them to draw a filled rectangle on the screen at coordinates (343, 256) with dimensions 64x64 pixels, using color 0x899C4C. The program also writes a pixel at coordinates (1720, 256) in color 0x292628 and fills the screen with color 0x3023. Finally, it halts execution.

; simple draw program
; initialization
  LDI r2, 1720
  LDI r8, 256
  LDI r7, 3142
  LDI r5, 256
  LDI r13, 242
  LDI r6, 16
  LDI r7, 253
  LDI r12, 255
  LDI r7, 0x292628
  WPIXEL
  LDI r11, 343
  LDI r4, 0x2DF359
  LDI r6, 64
  LDI r0, 2
  LDI r0, 0x899C4C
  RECTF r11, r4, r6, r0, r0
  LDI r0, 3023
  FILL r0
  HALT
