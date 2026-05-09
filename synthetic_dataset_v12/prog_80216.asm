; DESCRIPTION: Draws a red circle centered at (244, 79) with radius 60.
; PLAN: r0=244(x), r1=79(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 79
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
