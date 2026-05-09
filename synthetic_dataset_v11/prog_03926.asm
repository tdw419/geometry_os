; DESCRIPTION: Renders a red disk with center (109, 93) and radius 72.
; PLAN: r0=109(x), r1=93(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 93
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
