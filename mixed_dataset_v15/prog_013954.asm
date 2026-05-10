; DESCRIPTION: Renders a red disk with center (372, 51) and radius 37.
; PLAN: r0=372(x), r1=51(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 51
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
