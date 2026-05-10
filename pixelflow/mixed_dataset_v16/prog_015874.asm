; DESCRIPTION: Renders a black disk with center (436, 133) and radius 72.
; PLAN: r0=436(x), r1=133(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 133
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
