; DESCRIPTION: Creates a yellow circular shape at (375, 41) with radius 14.
; PLAN: r0=375(x), r1=41(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 41
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
