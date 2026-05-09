; DESCRIPTION: Draws a white circle centered at (90, 159) with radius 62.
; PLAN: r0=90(x), r1=159(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 159
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
