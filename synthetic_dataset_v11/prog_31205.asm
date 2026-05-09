; DESCRIPTION: Renders a red disk with center (85, 93) and radius 73.
; PLAN: r0=85(x), r1=93(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 85
LDI r1, 93
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
