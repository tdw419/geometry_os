; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the `WPIXEL` instruction to draw three pixels on a display at different coordinates with specified colors. The program halts after drawing the pixels.

; simple draw program
; initialization
  LDI r8, 128
  LDI r2, 517
  LDI r5, 128
  LDI r13, 0x99CAC1
  LDI r7, 3671
  LDI r10, 0xBB9714
  LDI r11, 2
  WPIXEL
  LDI r5, 3094
  LDI r3, 0x8CA7E6
  LDI r8, 2
  WPIXEL
  LDI r6, 0x7A690C
  LDI r10, 0x8865F4
  LDI r7, 256
  WPIXEL
  HALT
