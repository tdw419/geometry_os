; DESCRIPTION: Renders a red disk with center (120, 157) and radius 51.
; PLAN: r0=120(x), r1=157(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 157
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
