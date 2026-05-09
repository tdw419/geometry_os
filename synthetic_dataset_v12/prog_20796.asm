; DESCRIPTION: Composite: Places a purple circle of radius 73 at center (223, 105) then Places a orange line segment connecting (471, 69) to (34, 230).
; PLAN: r0=223(x), r1=105(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x1), r6=69(y1), r7=34(x2), r8=230(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 105
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 69
LDI r7, 34
LDI r8, 230
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
