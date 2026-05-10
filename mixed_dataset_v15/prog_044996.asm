; DESCRIPTION: Renders a orange disk with center (413, 89) and radius 71.
; PLAN: r0=413(x), r1=89(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 89
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
