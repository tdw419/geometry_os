; DESCRIPTION: Composite: Draws a red circle centered at (219, 167) with radius 49 then Places a purple line segment connecting (352, 62) to (223, 25).
; PLAN: r0=219(x), r1=167(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x1), r6=62(y1), r7=223(x2), r8=25(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 167
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 62
LDI r7, 223
LDI r8, 25
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
