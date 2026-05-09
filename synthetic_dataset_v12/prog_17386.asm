; DESCRIPTION: Renders a orange disk with center (124, 108) and radius 31.
; PLAN: r0=124(x), r1=108(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 108
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
