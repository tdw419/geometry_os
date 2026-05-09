; DESCRIPTION: Draws a orange circle centered at (100, 221) with radius 25.
; PLAN: r0=100(x), r1=221(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 221
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
