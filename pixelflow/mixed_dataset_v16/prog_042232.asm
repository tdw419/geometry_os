; DESCRIPTION: Renders a magenta circular shape at (230, 41) with radius 64.
; PLAN: r0=230(x), r1=41(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 41
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
