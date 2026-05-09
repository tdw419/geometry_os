; DESCRIPTION: Renders a black disk with center (205, 124) and radius 39.
; PLAN: r0=205(x), r1=124(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 124
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
