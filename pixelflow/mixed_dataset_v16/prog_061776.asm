; DESCRIPTION: Composite: Draws a purple circle centered at (287, 178) with radius 11 then Places a cyan line segment connecting (101, 50) to (457, 232).
; PLAN: r0=287(x), r1=178(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x1), r6=50(y1), r7=457(x2), r8=232(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 178
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 50
LDI r7, 457
LDI r8, 232
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
