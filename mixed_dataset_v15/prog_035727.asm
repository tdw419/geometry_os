; DESCRIPTION: Draws a orange circle centered at (204, 121) with radius 56.
; PLAN: r0=204(x), r1=121(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 121
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
