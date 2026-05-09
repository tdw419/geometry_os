; DESCRIPTION: Renders a red disk with center (78, 98) and radius 47.
; PLAN: r0=78(x), r1=98(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 98
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
