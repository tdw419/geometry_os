; DESCRIPTION: Draws a red circle centered at (115, 39) with radius 38.
; PLAN: r0=115(x), r1=39(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 39
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
