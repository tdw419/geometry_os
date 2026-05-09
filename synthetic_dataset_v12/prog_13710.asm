; DESCRIPTION: Renders a red disk with center (57, 123) and radius 51.
; PLAN: r0=57(x), r1=123(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 123
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
