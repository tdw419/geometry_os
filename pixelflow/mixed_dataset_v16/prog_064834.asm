; DESCRIPTION: Draws a orange circle centered at (296, 159) with radius 50.
; PLAN: r0=296(x), r1=159(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 159
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
