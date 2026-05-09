; DESCRIPTION: Composite: Draws a purple rectangle at (43, 4) with width 62 and height 51 then Sets a single yellow pixel at (306, 74).
; PLAN: r0=43(x), r1=4(y), r2=62(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=74(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 4
LDI r2, 62
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 74
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
