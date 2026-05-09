; DESCRIPTION: Composite: Draws a purple rectangle at (141, 134) with width 106 and height 111 then Sets a single yellow pixel at (251, 113).
; PLAN: r0=141(x), r1=134(y), r2=106(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=251(x), r6=113(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 134
LDI r2, 106
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 113
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
