; DESCRIPTION: Renders a orange disk with center (233, 77) and radius 12.
; PLAN: r0=233(x), r1=77(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 77
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
