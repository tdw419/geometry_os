; DESCRIPTION: Creates a yellow circular shape at (246, 113) with radius 43.
; PLAN: r0=246(x), r1=113(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 113
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
