; DESCRIPTION: Draws a red circle centered at (40, 193) with radius 39.
; PLAN: r0=40(x), r1=193(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 193
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
