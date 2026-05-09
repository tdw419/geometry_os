; DESCRIPTION: Composite: Places a yellow line segment connecting (68, 156) to (389, 151) then Renders a white disk with center (118, 43) and radius 26.
; PLAN: r0=68(x1), r1=156(y1), r2=389(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=43(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 156
LDI r2, 389
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 43
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
