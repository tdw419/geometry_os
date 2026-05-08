; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and draws two circles on the screen using the `CIRCLE` instruction. It then writes a pixel at a specified location and halts execution.

; simple draw program
; initialization
  LDI r26, 32
  LDI r16, 2987
  LDI r5, 1645
  LDI r15, 10
  LDI r8, 3198
  LDI r5, 0xB2CC56
  LDI r0, 3102
  CIRCLE r15, r8, r5, r0
  LDI r15, 3866
  LDI r21, 0xD6A849
  LDI r14, 3054
  LDI r7, 2
  CIRCLE r15, r21, r14, r7
  LDI r27, 0xAE5253
  LDI r11, 0xAF2F63
  LDI r14, 0xE1C27B
  WPIXEL
  HALT
