; DESCRIPTION: Places a magenta circle of radius 51 at center (421, 109).
; PLAN: r0=421(x), r1=109(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 109
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
