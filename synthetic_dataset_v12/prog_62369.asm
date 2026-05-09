; DESCRIPTION: Renders a magenta disk with center (341, 164) and radius 51.
; PLAN: r0=341(x), r1=164(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 164
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
