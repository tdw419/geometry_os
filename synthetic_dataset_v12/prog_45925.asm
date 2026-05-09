; DESCRIPTION: Composite: Draws a red rectangle at (12, 41) with width 62 and height 107 then Sets a single blue pixel at (375, 186).
; PLAN: r0=12(x), r1=41(y), r2=62(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=186(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 41
LDI r2, 62
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 186
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
