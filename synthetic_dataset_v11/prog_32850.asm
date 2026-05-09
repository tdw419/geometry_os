; DESCRIPTION: Renders a red disk with center (156, 155) and radius 76.
; PLAN: r0=156(x), r1=155(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 155
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
