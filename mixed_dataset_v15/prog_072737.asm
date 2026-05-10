; DESCRIPTION: Renders a magenta disk with center (64, 75) and radius 41.
; PLAN: r0=64(x), r1=75(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 75
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
