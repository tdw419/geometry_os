; DESCRIPTION: Creates a yellow circular shape at (247, 96) with radius 41.
; PLAN: r0=247(x), r1=96(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 96
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
