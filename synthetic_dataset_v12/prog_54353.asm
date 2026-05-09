; DESCRIPTION: Renders a magenta disk with center (323, 180) and radius 41.
; PLAN: r0=323(x), r1=180(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 180
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
