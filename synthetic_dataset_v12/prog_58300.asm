; DESCRIPTION: Composite: Places a blue dot at position (363, 178) then Draws a orange rectangle at (24, 6) with width 67 and height 105.
; PLAN: r0=363(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=6(y), r7=67(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 6
LDI r7, 67
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
