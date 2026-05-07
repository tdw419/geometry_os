; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then draws two circles using the `CIRCLE` instruction. It also sets a pixel at a specified coordinate using the `WPIXEL` instruction before halting execution.

; simple draw program
; initialization
  LDI r10, 0x39237C
  LDI r9, 2659
  LDI r5, 16
  LDI r10, 2836
  LDI r13, 3772
  LDI r12, 0x3D8D6B
  LDI r27, 162
  CIRCLE r10, r13, r12, r27
  LDI r5, 1918
  LDI r29, 1
  LDI r15, 3433
  LDI r3, 1702
  CIRCLE r5, r29, r15, r3
  LDI r14, 128
  LDI r11, 0x016D1F
  LDI r3, 1
  WPIXEL
  HALT
