; DESCRIPTION: Creates a green circular shape at (194, 113) with radius 52.
; PLAN: r0=194(x), r1=113(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 113
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
