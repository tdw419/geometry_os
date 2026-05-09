; DESCRIPTION: Renders a black disk with center (408, 63) and radius 55.
; PLAN: r0=408(x), r1=63(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 63
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
