; DESCRIPTION: Creates a purple circular shape at (262, 121) with radius 41.
; PLAN: r0=262(x), r1=121(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 121
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
