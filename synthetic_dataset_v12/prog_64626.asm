; DESCRIPTION: Renders a black disk with center (196, 124) and radius 55.
; PLAN: r0=196(x), r1=124(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 124
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
