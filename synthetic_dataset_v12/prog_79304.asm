; DESCRIPTION: Composite: Renders a black line between points (194, 246) and (41, 36) then Draws a blue circle centered at (41, 140) with radius 25.
; PLAN: r0=194(x1), r1=246(y1), r2=41(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=140(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 246
LDI r2, 41
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 140
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
