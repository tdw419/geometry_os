; DESCRIPTION: Creates a purple circular shape at (41, 39) with radius 38.
; PLAN: r0=41(x), r1=39(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 39
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
