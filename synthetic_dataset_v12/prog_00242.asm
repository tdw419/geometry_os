; DESCRIPTION: Renders a red disk with center (183, 71) and radius 52.
; PLAN: r0=183(x), r1=71(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 71
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
