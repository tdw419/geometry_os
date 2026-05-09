; DESCRIPTION: Creates a yellow circular shape at (292, 113) with radius 33.
; PLAN: r0=292(x), r1=113(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 113
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
