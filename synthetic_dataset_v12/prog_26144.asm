; DESCRIPTION: Renders a orange disk with center (335, 77) and radius 19.
; PLAN: r0=335(x), r1=77(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 77
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
