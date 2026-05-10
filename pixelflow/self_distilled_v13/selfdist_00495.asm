; DESCRIPTION: Renders a yellow circular shape at (111, 125) with radius 41.
; PLAN: r0=111(x), r1=125(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 125
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
