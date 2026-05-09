; DESCRIPTION: Creates a blue circular shape at (81, 120) with radius 41.
; PLAN: r0=81(x), r1=120(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 120
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
