; DESCRIPTION: Renders a orange disk with center (124, 54) and radius 49.
; PLAN: r0=124(x), r1=54(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 54
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
