; DESCRIPTION: Renders a black disk with center (59, 184) and radius 55.
; PLAN: r0=59(x), r1=184(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 184
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
