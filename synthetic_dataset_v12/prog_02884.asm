; DESCRIPTION: Renders a magenta disk with center (148, 78) and radius 41.
; PLAN: r0=148(x), r1=78(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 78
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
