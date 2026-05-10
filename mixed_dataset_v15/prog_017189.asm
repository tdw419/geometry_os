; DESCRIPTION: Renders a orange disk with center (83, 71) and radius 29.
; PLAN: r0=83(x), r1=71(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 71
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
