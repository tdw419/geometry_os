; DESCRIPTION: Composite: Draws a orange circle centered at (333, 195) with radius 52 then Places a orange line segment connecting (230, 79) to (432, 227).
; PLAN: r0=333(x), r1=195(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=79(y1), r7=432(x2), r8=227(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 195
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 79
LDI r7, 432
LDI r8, 227
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
