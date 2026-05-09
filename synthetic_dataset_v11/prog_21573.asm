; DESCRIPTION: Creates a purple circular shape at (215, 95) with radius 41.
; PLAN: r0=215(x), r1=95(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 95
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
