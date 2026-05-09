; DESCRIPTION: Draws a orange circle centered at (338, 95) with radius 54.
; PLAN: r0=338(x), r1=95(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 95
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
