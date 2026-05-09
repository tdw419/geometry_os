; DESCRIPTION: Creates a black circular shape at (186, 113) with radius 31.
; PLAN: r0=186(x), r1=113(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 113
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
