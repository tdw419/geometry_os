; DESCRIPTION: Composite: Draws a green rectangle at (351, 30) with width 74 and height 11 then Places a orange dot at position (481, 10).
; PLAN: r0=351(x), r1=30(y), r2=74(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x), r6=10(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 30
LDI r2, 74
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 10
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
