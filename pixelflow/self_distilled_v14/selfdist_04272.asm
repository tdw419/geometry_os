; DESCRIPTION: Renders a magenta circular shape at (114, 41) with radius 57.
; PLAN: r0=114(x), r1=41(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 41
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
