; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses the PSET instruction to set a pixel at coordinates (255, 4071) with color 166. It follows by using the RECTF instruction to fill a rectangle with top-left corner at (1846, 0), width and height both set to 0x026780, and color 0xFDA2E4. Finally, it halts execution.

; simple draw program
; initialization
  LDI r8, 10
  LDI r7, 0xBC28E4
  LDI r2, 1203
  LDI r11, 0x4525C9
  LDI r30, 255
  LDI r11, 4071
  LDI r9, 166
  PSET r30, r11, r9
  LDI r9, 2063
  LDI r10, 0
  LDI r7, 1846
  LDI r7, 0x026780
  LDI r4, 0xFDA2E4
  RECTF r9, r10, r7, r7, r4
  HALT
