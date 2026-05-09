; DESCRIPTION: Renders a magenta disk with center (166, 86) and radius 41.
; PLAN: r0=166(x), r1=86(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 86
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
