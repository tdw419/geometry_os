; DESCRIPTION: This GeOS assembly code initializes several registers with specific values and then uses these values to set a pixel color at a given coordinate on the screen. The program halts after executing the drawing command.

; simple draw program
; initialization
  LDI r15, 4033
  LDI r11, 0xD9C6BA
  LDI r4, 16
  LDI r12, 1079
  LDI r9, 844
  LDI r13, 616
  LDI r0, 2393
  PSET r9, r13, r0
  LDI r5, 0x7BEA2E
  LDI r6, 1656
  LDI r8, 0xCDCBDF
  WPIXEL
  HALT
