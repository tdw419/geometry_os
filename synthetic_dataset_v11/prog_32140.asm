; DESCRIPTION: Renders a black disk with center (55, 133) and radius 22.
; PLAN: r0=55(x), r1=133(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 133
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
