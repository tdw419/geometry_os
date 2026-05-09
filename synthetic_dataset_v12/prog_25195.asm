; DESCRIPTION: Draws a red circle centered at (223, 105) with radius 76.
; PLAN: r0=223(x), r1=105(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 105
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
