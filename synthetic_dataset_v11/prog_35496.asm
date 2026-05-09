; DESCRIPTION: Renders a red disk with center (77, 123) and radius 36.
; PLAN: r0=77(x), r1=123(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 123
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
