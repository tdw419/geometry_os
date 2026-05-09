; DESCRIPTION: Draws a white circle centered at (119, 68) with radius 65.
; PLAN: r0=119(x), r1=68(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 68
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
