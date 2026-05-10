; DESCRIPTION: Renders a magenta circular shape at (51, 6) with radius 15.
; PLAN: r0=51(x), r1=6(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 6
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
