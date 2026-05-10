; DESCRIPTION: Renders a red disk with center (414, 117) and radius 78.
; PLAN: r0=414(x), r1=117(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 117
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
