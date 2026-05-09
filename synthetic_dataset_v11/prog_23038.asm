; DESCRIPTION: Renders a red disk with center (56, 85) and radius 39.
; PLAN: r0=56(x), r1=85(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 85
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
