; DESCRIPTION: Renders a black disk with center (82, 124) and radius 76.
; PLAN: r0=82(x), r1=124(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 124
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
