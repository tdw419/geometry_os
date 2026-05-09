; DESCRIPTION: Composite: Draws a purple rectangle at (189, 39) with width 42 and height 85 then Sets a single yellow pixel at (355, 131).
; PLAN: r0=189(x), r1=39(y), r2=42(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=131(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 39
LDI r2, 42
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 131
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
