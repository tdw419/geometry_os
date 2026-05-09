; DESCRIPTION: Renders a red disk with center (93, 195) and radius 54.
; PLAN: r0=93(x), r1=195(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 195
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
