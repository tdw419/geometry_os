; DESCRIPTION: Renders a black disk with center (133, 160) and radius 28.
; PLAN: r0=133(x), r1=160(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 160
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
