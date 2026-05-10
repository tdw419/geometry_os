; DESCRIPTION: Renders a red disk with center (477, 185) and radius 23.
; PLAN: r0=477(x), r1=185(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 185
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
