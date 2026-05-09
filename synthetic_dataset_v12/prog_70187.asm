; DESCRIPTION: Composite: Places a cyan dot at position (229, 13) then Draws a orange rectangle at (200, 105) with width 16 and height 105.
; PLAN: r0=229(x), r1=13(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=105(y), r7=16(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 13
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 105
LDI r7, 16
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
