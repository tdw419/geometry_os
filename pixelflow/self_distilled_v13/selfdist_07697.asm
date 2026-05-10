; DESCRIPTION: Draws a white circle centered at (287, 39) with radius 62.
; PLAN: r0=287(x), r1=39(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 39
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
