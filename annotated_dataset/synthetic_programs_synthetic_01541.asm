; DESCRIPTION: This GeOS assembly code initializes registers with various parameters and then performs a series of drawing operations: setting a pixel at coordinates (881, 1813) in color 0x9845C0, drawing a line from (3621, 1224) to (410, 239) with color 0x636C34 and thickness 8, and finally filling a rectangle at coordinates (1215, 0x366CE0) with width 10, height 16, and color 0x0C333E. The program halts after completing these operations.

; simple draw program
; initialization
  LDI r15, 255
  LDI r2, 736
  LDI r0, 2
  LDI r10, 10
  LDI r14, 0x9845C0
  LDI r4, 1813
  LDI r2, 239
  LDI r3, 881
  PSETI
  LDI r10, 3621
  LDI r9, 1224
  LDI r2, 0x636C34
  LDI r13, 410
  LDI r0, 8
  LINE r10, r9, r2, r13, r0
  LDI r2, 1215
  LDI r0, 0x366CE0
  LDI r17, 10
  LDI r15, 16
  LDI r6, 0x0C333E
  RECTF r2, r0, r17, r15, r6
  HALT
