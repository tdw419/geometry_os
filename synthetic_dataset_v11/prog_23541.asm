; DESCRIPTION: Draws a red circle centered at (86, 157) with radius 33.
; PLAN: r0=86(x), r1=157(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 157
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
