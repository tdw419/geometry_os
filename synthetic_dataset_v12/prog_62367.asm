; DESCRIPTION: Renders a black disk with center (434, 155) and radius 55.
; PLAN: r0=434(x), r1=155(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 155
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
