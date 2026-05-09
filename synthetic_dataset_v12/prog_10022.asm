; DESCRIPTION: Creates a black circular shape at (310, 133) with radius 38.
; PLAN: r0=310(x), r1=133(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 133
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
