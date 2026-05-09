; DESCRIPTION: Composite: Renders a cyan line between points (436, 167) and (306, 87) then Draws a blue circle centered at (78, 156) with radius 45.
; PLAN: r0=436(x1), r1=167(y1), r2=306(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=156(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 436
LDI r1, 167
LDI r2, 306
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 156
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
