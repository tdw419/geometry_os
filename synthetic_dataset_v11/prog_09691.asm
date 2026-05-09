; DESCRIPTION: Draws a red circle centered at (134, 143) with radius 76.
; PLAN: r0=134(x), r1=143(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 143
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
