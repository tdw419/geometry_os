; DESCRIPTION: Renders a yellow circular shape at (41, 60) with radius 33.
; PLAN: r0=41(x), r1=60(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 60
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
