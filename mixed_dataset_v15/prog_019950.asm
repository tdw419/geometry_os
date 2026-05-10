; DESCRIPTION: Renders a red disk with center (273, 123) and radius 78.
; PLAN: r0=273(x), r1=123(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 123
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
