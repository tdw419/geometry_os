; DESCRIPTION: Composite: Renders a black line between points (506, 244) and (429, 159) then Draws a orange circle centered at (452, 179) with radius 16.
; PLAN: r0=506(x1), r1=244(y1), r2=429(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=179(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 244
LDI r2, 429
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 179
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
