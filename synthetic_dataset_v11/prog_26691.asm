; DESCRIPTION: Renders a red disk with center (93, 140) and radius 61.
; PLAN: r0=93(x), r1=140(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 140
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
