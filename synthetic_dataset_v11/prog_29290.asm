; DESCRIPTION: Draws a orange circle centered at (74, 40) with radius 39.
; PLAN: r0=74(x), r1=40(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 40
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
