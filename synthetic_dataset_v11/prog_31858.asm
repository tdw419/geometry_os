; DESCRIPTION: Creates a red circular shape at (47, 171) with radius 38.
; PLAN: r0=47(x), r1=171(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 171
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
