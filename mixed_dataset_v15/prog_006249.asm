; DESCRIPTION: Composite: Draws a purple rectangle at (41, 116) with width 71 and height 78 then Sets a single cyan pixel at (13, 26).
; PLAN: r0=41(x), r1=116(y), r2=71(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=13(x), r6=26(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 116
LDI r2, 71
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 26
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
