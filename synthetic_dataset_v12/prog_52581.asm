; DESCRIPTION: Composite: Places a orange dot at position (427, 10) then Draws a white rectangle at (37, 55) with width 78 and height 78.
; PLAN: r0=427(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=55(y), r7=78(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 37
LDI r6, 55
LDI r7, 78
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
