; DESCRIPTION: This GeOS assembly code initializes registers and enters a loop where it draws a circle using the `CIRCLE` instruction. After drawing the circle, it writes a pixel at a specific coordinate with the `WPIXEL` instruction and updates the frame before jumping back to the start of the loop.

; drawing loop program
; initialization
  LDI r11, 16
  LDI r4, 10
  LDI r3, 3215
main_0:
  CMPI r5, 0x0F37CE
  ADDI r9, r10, 256
  LDI r25, 2426
  LDI r8, 0x63FA97
  LDI r9, 3123
  LDI r6, 0x251E20
  CIRCLE r25, r8, r9, r6
  CMPI r26, 256
  LDI r3, 1
  LDI r6, 0xCAD134
  LDI r15, 0xA23C7F
  WPIXEL
  FRAME
  JMP main_0
