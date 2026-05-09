; DESCRIPTION: Creates a purple circular shape at (41, 55) with radius 36.
; PLAN: r0=41(x), r1=55(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 55
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
