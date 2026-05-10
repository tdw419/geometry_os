; DESCRIPTION: Renders a magenta circular shape at (378, 145) with radius 41.
; PLAN: r0=378(x), r1=145(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 145
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
