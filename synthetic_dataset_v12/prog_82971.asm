; DESCRIPTION: Composite: Renders a purple disk with center (309, 131) and radius 43 then Places a orange line segment connecting (112, 3) to (107, 88).
; PLAN: r0=309(x), r1=131(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x1), r6=3(y1), r7=107(x2), r8=88(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 131
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 3
LDI r7, 107
LDI r8, 88
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
