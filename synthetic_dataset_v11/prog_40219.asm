; DESCRIPTION: Renders a black disk with center (149, 131) and radius 64.
; PLAN: r0=149(x), r1=131(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 131
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
