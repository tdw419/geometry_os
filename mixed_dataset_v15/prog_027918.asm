; DESCRIPTION: Renders a red disk with center (318, 100) and radius 77.
; PLAN: r0=318(x), r1=100(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 100
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
