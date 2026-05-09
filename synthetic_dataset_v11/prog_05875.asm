; DESCRIPTION: Draws a orange circle centered at (81, 60) with radius 57.
; PLAN: r0=81(x), r1=60(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 60
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
