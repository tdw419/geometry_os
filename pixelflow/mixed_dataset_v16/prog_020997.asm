; DESCRIPTION: Renders a blue disk with center (447, 52) and radius 51.
; PLAN: r0=447(x), r1=52(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 52
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
