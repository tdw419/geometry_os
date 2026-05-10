; DESCRIPTION: Composite: Draws a red rectangle at (432, 49) with width 78 and height 43 then Places a yellow dot at position (274, 140).
; PLAN: r0=432(x), r1=49(y), r2=78(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x), r6=140(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 432
LDI r1, 49
LDI r2, 78
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 140
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
