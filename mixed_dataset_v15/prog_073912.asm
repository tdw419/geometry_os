; DESCRIPTION: Creates a red circular shape at (100, 113) with radius 54.
; PLAN: r0=100(x), r1=113(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 113
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
