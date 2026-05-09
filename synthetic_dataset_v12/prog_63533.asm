; DESCRIPTION: Draws a orange circle centered at (415, 73) with radius 34.
; PLAN: r0=415(x), r1=73(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 73
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
