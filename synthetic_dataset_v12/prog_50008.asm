; DESCRIPTION: Draws a orange circle centered at (204, 141) with radius 57.
; PLAN: r0=204(x), r1=141(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 141
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
