; DESCRIPTION: Composite: Places a orange dot at position (145, 30) then Draws a cyan rectangle at (78, 11) with width 52 and height 94.
; PLAN: r0=145(x), r1=30(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=11(y), r7=52(width), r8=94(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 30
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 78
LDI r6, 11
LDI r7, 52
LDI r8, 94
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
