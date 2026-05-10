; DESCRIPTION: Draws a orange circle centered at (415, 124) with radius 62.
; PLAN: r0=415(x), r1=124(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 124
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
