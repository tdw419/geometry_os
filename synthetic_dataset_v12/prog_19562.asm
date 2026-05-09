; DESCRIPTION: Draws a red circle centered at (308, 119) with radius 75.
; PLAN: r0=308(x), r1=119(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 119
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
