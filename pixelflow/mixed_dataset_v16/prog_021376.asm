; DESCRIPTION: Composite: Places a orange line segment connecting (167, 43) to (130, 33) then Draws a red circle centered at (134, 183) with radius 73.
; PLAN: r0=167(x1), r1=43(y1), r2=130(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=183(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 43
LDI r2, 130
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 183
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
