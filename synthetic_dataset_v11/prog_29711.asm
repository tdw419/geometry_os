; DESCRIPTION: Renders a red disk with center (145, 134) and radius 77.
; PLAN: r0=145(x), r1=134(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 134
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
