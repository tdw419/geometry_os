; DESCRIPTION: Draws a red circle centered at (308, 78) with radius 62.
; PLAN: r0=308(x), r1=78(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 78
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
