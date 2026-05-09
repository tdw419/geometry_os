; DESCRIPTION: Draws a white circle centered at (62, 180) with radius 62.
; PLAN: r0=62(x), r1=180(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 180
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
